import Data.List ()

data Rank = Ace | Two | Three | Four | Five | Six | Seven
            | Eight | Nine | Ten | Jack | Queen | King
            deriving (Eq, Ord, Bounded, Enum, Show, Read)

data Suit = Spades | Hearts | Diamonds | Clubs
            deriving (Eq, Enum, Show, Read)