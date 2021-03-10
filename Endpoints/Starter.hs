import           Control.Monad             (void)
import           Language.Plutus.Contract
import qualified Language.PlutusTx         as PlutusTx
import           Language.PlutusTx.Prelude hiding (Applicative (..))
import           Ledger                    (Address, ValidatorCtx, scriptAddress)
import qualified Ledger.Constraints        as Constraints
import qualified Ledger.Typed.Scripts      as Scripts
import           Ledger.Value              (Value)
import           Playground.Contract