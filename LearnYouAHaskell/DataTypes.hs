import Data.List


{- Rank is an instance of 'Eq' meaning that we can check two
ranks for equality.
Rank is also an instance of 'Ord' which means that we can computer the values of these things
Bounded means that we have minimum and maximum values
minBound :: Rank = Ace
maxBound :: Rank = King
Enum lets us make ranges of ranks
Show is necessary for Haskell to be able to print a Rank
Read is necessary for reading a Rank from a string, but we have to specify a type
-}
data Rank = Ace | Two | Three | Four | Five | Six | Seven
            | Eight | Nine | Ten | Jack | Queen | King
            deriving (Eq, Ord, Bounded, Enum, Show, Read)
--Suits aren't comparable like Ranks are
data Suit = Spades | Hearts | Diamonds | Clubs
            deriving (Eq, Enum, Show, Read)
--First "Card" is the name of a type, the second name
--is the value of the Card constructor, which takes the two types
--a type might have more than one constructor
data Card = Card Rank Suit deriving (Eq, Show, Read)

--A hand is just a list of cards
type Hand = [Card]

--Returns True if all consecutive pair satisfy f
--AllPairs has inferred type
allPairs f [] = True
allPairs f [x] = True
allPairs f (x:y:ys) = f x y && allPairs f (y:ys)


--groupBy is within the Data.List module
--groupBy takes an equality function and a list
--setCount incorporates a Lambda expression
--Pattern matching only works on constructors
setCount n k hand = let sets = groupBy (\(Card r1 _) (Card r2 _) -> r1 == r2) hand
                    in (length sets == n) && (maximum (map length sets) == k)
                

pair = setCount 4 2

twoPair = setCount 3 2

threeOfAKind = setCount 3 3

straight = allPairs (\(Card r1 _) (Card r2 _) -> r1 == pred r2)