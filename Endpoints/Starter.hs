import           Control.Monad             (void)
import           Language.Plutus.Contract
import qualified Language.PlutusTx         as PlutusTx
import           Language.PlutusTx.Prelude hiding (Applicative (..))
import           Ledger                    (Address, ValidatorCtx, scriptAddress)
import qualified Ledger.Constraints        as Constraints
import qualified Ledger.Typed.Scripts      as Scripts
import           Ledger.Value              (Value)
import           Playground.Contract

-- Plutus Core is the programming language in which scripts in the Cardano blockchain are written
-- PlutusTx is the libraries and compiler for compiling Haskell into Plutus core

--This contract in Plutus once compiled, will simulate the same wallet txs as "Hello, World"
--But this time, also allows each wallet the ability of two more functions: publish and redeem
newtype MyDatum = MyDatum Integer deriving newtype PlutusTx.IsData
PlutusTx.makeLift ''MyDatum

newtype MyRedeemer = MyRedeemer Integer deriving newtype PlutusTx.IsData
PlutusTx.makeLift ''MyRedeemer

-- | This method is the spending validator (which gets lifted to
--   its on-chain representation).
-- Validation script always takes: a datum, a redeemer, and a validation context
-- Validation context is information about the context
-- "validateSpend" here is our validation context for the overall program
validateSpend :: MyDatum -> MyRedeemer -> ValidatorCtx -> Bool
validateSpend _myDataValue _myRedeemerValue _ = error () -- Please provide an implementation.

-- | The address of the contract (the hash of its validator script).
contractAddress :: Address
contractAddress = Ledger.scriptAddress (Scripts.validatorScript starterInstance)

data Starter
instance Scripts.ScriptType Starter where
    type instance RedeemerType Starter = MyRedeemer
    type instance DatumType Starter = MyDatum

-- | The script instance is the compiled validator (ready to go onto the chain)
starterInstance :: Scripts.ScriptInstance Starter
starterInstance = Scripts.validator @Starter
    $$(PlutusTx.compile [|| validateSpend ||])
    $$(PlutusTx.compile [|| wrap ||]) where
        wrap = Scripts.wrapValidator @MyDatum @MyRedeemer

-- | The schema of the contract, with two endpoints.
type Schema =
    BlockchainActions
    --We can see here that publish takes in a tuple of Integer, Value
        .\/ Endpoint "publish" (Integer, Value)
        --Redeem just takes an integer
        .\/ Endpoint "redeem" Integer

contract :: AsContractError e => Contract Schema e ()
contract = publish `select` redeem

-- | The "publish" contract endpoint.
-- Wallet a will publish an amount of $ADA along with a keyword/number that will need to be guessed
-- by the receiving end wallet
--In this program, our validator script is what is actually going to be locking the $ADA
publish :: AsContractError e => Contract Schema e ()
publish = do
    (i, lockedFunds) <- endpoint @"publish"
    let tx = Constraints.mustPayToTheScript (MyDatum i) lockedFunds
    void $ submitTxConstraints starterInstance tx

-- | The "redeem" contract endpoint.
redeem :: AsContractError e => Contract Schema e ()
redeem = do
    myRedeemerValue <- endpoint @"redeem"
    unspentOutputs <- utxoAt contractAddress
    let redeemer = MyRedeemer myRedeemerValue
        tx       = collectFromScript unspentOutputs redeemer
    void $ submitTxConstraintsSpending starterInstance unspentOutputs tx

endpoints :: AsContractError e => Contract Schema e ()
endpoints = contract

mkSchemaDefinitions ''Schema

$(mkKnownCurrencies [])