module Part1 exposing (..)

{--
  Complete this newly invented type caled `Shape`.
  It should have two Data Constructors that replace the dummy datatype `Todo`
  One should be called `Circle` and contain a Float to represent a diameter in cm
  The other should be called `Square` and contain a Float to represent one of (the equal) side lengths in cm

  You can read about creating your own data types here :
  http://elm-lang.org/docs/syntax#union-types

  It is also super-common to use pattern-matching on data types such as Shape.
  You can read about it here :
  http://elm-lang.org/docs/syntax#conditionals
--}
type Shape = Circle Float | Square Float

{--
This is an example of a function in Elm. The first line says that it
is called `size` and that it accepts 1 argument of type Shape, returning a Float.

(This line can be skipped, the compiler can figure this out by itself, but it is
nice to include for human readers for all but the most trivial functions)

The implementation of the function follows after. We say (once more) that the name
of the function is `size`, and we call the argument of the function `shape`.

We use a case expression to implement the function here.
--}
size : Shape -> Float
size shape =
  case shape of
          Circle diameter -> diameter
          Square side -> side

{--
  Complete this function that accepts a Shape, and returns a Circle.
  Requirements :
    - Given a Circle, it should be returned unchanged
    - Given a Square, it should return a Circle as wide as the Square
--}
toCircle : Shape -> Shape
toCircle shape =
  case shape of
          Circle x -> shape
          Square x -> Circle x

{--
  Complete this function that accepts a Shape, and returns a Square.
  Requirements :
    - Given a Square, it should be returned unchanged
    - Given a Circle, it should return a Square as wide as the Circle
--}
toSquare : Shape -> Shape
toSquare shape =
  case shape of
          Square x -> shape
          Circle x -> Square x
