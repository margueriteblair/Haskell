import System.IO 

data Chain =
     GenesisBlock
    | Block Chain Txs
type Txs = Int