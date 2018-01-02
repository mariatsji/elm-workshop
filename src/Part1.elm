module Part1 exposing (..)

{--
  Complete this newly invented type caled `Shape`.
  It should have two Data Constructors that replace the dummy datatype `Todo`
  One should be called `Circle` and contain a Float to represent a diameter in cm
  The other should be called `Square` and contain a Float to represent one of (the equal) side lengths in cm
--}
-- type Shape = Todo
type Shape = Circle Float | Square Float

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
