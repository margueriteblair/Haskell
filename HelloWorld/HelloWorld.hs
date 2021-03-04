import qualified Data.Text as T
import Language.Plutus.Contract hiding (when)
import Language.PlutusTx.Prelude
import Playground.Contract

--This contract is very simple, and will just log 'Hello, World'


--Contracts are the logic that we write for our plutus app to handle transactions between wallets
--'Contract' is the datatype here.
--BlockchainActions and T.Text () are parameters for 'Contract'
--Contract is a generic data structure that takes in 3 types:
    --BlockchainActions, T.Text, ()
    --The Contract type is within Language.Plutus.Contract.Types
hello :: Contract BlockchainActions T.Text ()
hello = logInfo @String "Hello, world"

endpoints :: Contract BlockchainActions T.Text ()
endpoints = hello

mkSchemaDefinitions ``BlockchainActions

$(mkKnownCurrencies [])