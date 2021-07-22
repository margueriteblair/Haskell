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

--Chain length is a function that operates on our chain and returns of the length of the given chain
--Here, we recursively call chainLength until we reach the gensis block of our passed in chain
--Because Haskell has type inference, we don't need to have the method signature at the top
chainLength :: Chain -> Int
chainLength GenesisBlock = 0
chainLength (Block c _)  = chainLength c + 1