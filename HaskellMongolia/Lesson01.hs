import System.IO 

data Chain =
     GenesisBlock
    | Block Chain Txs
type Txs = Int

--This is actually recursive, because we pass Chain into the definition of Block datatype
-- And we're defining chain here

chain1 =
    Block GenesisBlock 2

chain2 =
    Block chain1 4

-- GenesisBlock is a standalone chain and therefore can be placed inthe Blockconstructor

chain2' =
    Block (Block GenesisBlock 2) 4