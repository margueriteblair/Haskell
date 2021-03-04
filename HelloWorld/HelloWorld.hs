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
    --Contract takes in 3 data types: s e a 
    --s is the schema
    --s will return either an error, or another data type which we will dictate
    --The () are Haskell's way of saying void
--A schema is a combined list of other classes that contains effects such as producing transactions, collecitng inpus from users, and watching the blockchain for changes
--Our 'BlockchainActions' schema will help produce txs and collect inputs from users
--BlockchainActions is a default schema included in Plutus

hello :: Contract BlockchainActions T.Text ()
hello = logInfo @String "Hello, world"

endpoints :: Contract BlockchainActions T.Text ()
endpoints = hello

mkSchemaDefinitions ``BlockchainActions

$(mkKnownCurrencies [])