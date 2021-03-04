import qualified Data.Text as T
import Language.Plutus.Contract hiding (when)
import Language.PlutusTx.Prelude
import Playground.Contract

--This contract is very simple, and will just log 'Hello, World'

hello :: Contract BlockchainActions T.Text ()
hello = logInfo @String "Hello, world"

endpoints :: Contract BlockchainActions T.Text()
endpoints = hello

mkSchemaDefinitions ``BlockchainActions

$(mkKnownCurrencies [])