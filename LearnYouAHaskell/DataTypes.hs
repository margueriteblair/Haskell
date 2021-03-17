import Data.List ()


{- Rank is an instance of 'Eq' meaning that we can check two
ranks for equality.

-}
data Rank = Ace | Two | Three | Four | Five | Six | Seven
            | Eight | Nine | Ten | Jack | Queen | King
            deriving (Eq, Ord, Bounded, Enum, Show, Read)

data Suit = Spades | Hearts | Diamonds | Clubs
            deriving (Eq, Enum, Show, Read)

data Card = Card Rank Suit deriving (Eq, Show, Read)

type Hand = [Card]

--Returns True if all consecutive pair satisfy f
allPairs f [] = True
allPairs f [x] = True
allPairs f (x:y:ys) = f x y && allPairs f (y:ys)