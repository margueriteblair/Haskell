import Data.List
import Data.Maybe

--Quad here will represent a 2D matrix
--In this case, think of Quad as a generic in Java
--'a' is a type parameter
--Quad is a type constructor
--the second 'Quad' we see on line 9 is a constructor, that takes 4 arguments, all of type 'a'
--when we say type 'a' these are all the same parts, like integers :)
data Quad a = Quad a a a a

instance (Show a) => Show (Quad a) where
        show (Quad a b c d) = (show a) ++ " " ++ (show b) ++ "\n" ++
                              (show c) ++ " " ++ (show d)

--We also make Quad an instance of functor
--A functor is a data structor that can be mapped over
instance Functor Quad where
    fmap f (Quad a b c d) = Quad (f a) (f b) (f c) (f d)