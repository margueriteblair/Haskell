--Haskell functions can be grouped into modules.
--A Haskell module is somewhere between a class and a package in Java
--There are many built in modules
--Modules are things like Data.List, Data.Char, Data.Map, Data.Set
--When we log into ghci, the Prelude module is what shows up by default
--We can load other modules directly in ghci with :m + <MOMDULE>
-- :m + Data.List
-- find (>3) [1..6] maybe it returns a value
-- In an actual file as opposed to ghci, we can import our modules up at the top like so:
import Data.List
import Data.Maybe