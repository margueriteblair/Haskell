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
-- .\/ means merge
--It's like returning an object that can be multiple things
--
hello :: Contract BlockchainActions T.Text ()
--logInfo is a plutus function that return a contract type
--logInfo is a composite function, a function of the result of a function
--Contract(L.logInfo(a.toJSON())) prints the given string into the console
hello = logInfo @String "Hello, world"


--We've got this boiler plate code
--All plutus code will have this boilerplate: an endpoints fn
--Endpoints is a function that returns a contract
--mkSchemaDefinition
--mkKnownCurrencies
--Two steps: function implemention, function definition
endpoints :: Contract BlockchainActions T.Text ()
endpoints = hello

--You pass in whatever schema you'll be using, in this case BlockchainActions is our schema
mkSchemaDefinitions ``BlockchainActions

--mkKnownCurencies is for the playground to work properly
$(mkKnownCurrencies [])