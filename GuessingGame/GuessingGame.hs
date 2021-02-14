import           Control.Monad             (void)
import qualified Data.ByteString.Char8     as C
import           Language.Plutus.Contract
import qualified Language.PlutusTx         as PlutusTx
import           Language.PlutusTx.Prelude hiding (pure, (<$>))
import           Ledger                    (Address, Validator, ValidatorCtx, Value, scriptAddress, pubKeyHash)
import qualified Ledger.Constraints        as Constraints
import qualified Ledger.Typed.Scripts      as Scripts
import           Playground.Contract
import qualified Prelude
import           Wallet.Emulator.Wallet    (Wallet, walletPubKey)

randomNum :: Integer
randomNum = toInteger $ fromEnum $ C.last $ C.pack $ show $ walletPubKey $ Wallet 1

magicNum :: Integer
magicNum = 123

validateGuess :: Integer -> Integer -> ValidatorCtx -> Bool
validateGuess actual guess _ = guess == actual || guess == magicNum

gameAddress :: Address
gameAddress = Ledger.scriptAddress $ Scripts.validatorScript gameInstance

data LockParams = LockParams
    { amount :: Value}
    deriving stock (Prelude.Eq, Prelude.Show, Generic)
    deriving anyclass (FromJSON, ToJSON, IotsType, ToSchema, ToArgument)


newtype GuessParams = GuessParams
    { guessNumber :: Integer}
    deriving stock (Prelude.Eq, Prelude.Show, Generic)
    deriving anyclass (FromJSON, ToJSON, IotsType, ToSchema, ToArgument)


lock :: AsContractError e => Contract GameSchema e ()
lock = do
    LockParams amount <- endpoint @"lock" @LockParams
    let tx            = Constraints.mustPayToTheScript randomNum amount
    void $ submitTxConstraints gameInstance tx


guess :: AsContractError e => Contract GameSchema e ()
guess = do
    GuessParams theGuess <- endpoint @"guess" @GuessParams
    if theGuess > randomNum
        then logInfo $ show "It's lower."
        else if theGuess < randomNum
            then logInfo $ show "It's higher."
            else logInfo $ show "Congrats."

    unspentOutputs <- utxoAt gameAddress
    let tx = collectFromScript unspentOutputs theGuess
    void $ submitTxConstraintsSpending gameInstance unspentOutputs tx

-- the script is taking two parameter DatumType which is a wrapper around the data we used
-- in the script output reedemerType is the wrapper around data we take as an input
data GameDataType
instance Scripts.ScriptType GameDataType where
    type instance DatumType GameDataType = Integer
    type instance RedeemerType GameDataType = Integer

gameInstance :: Scripts.ScriptInstance GameDataType
gameInstance = Scripts.validator @GameDataType
    $$(PlutusTx.compile [|| validateGuess ||])
    $$(PlutusTx.compile [|| Scripts.wrapValidator @Integer @Integer ||])

type GameSchema =
    BlockchainActions
        .\/ Endpoint "lock" LockParams
        .\/ Endpoint "guess" GuessParams