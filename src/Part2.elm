module Part2 exposing (..)

type alias Circle =
  { area : Float }

{--
Given a Circle type with an area, return the radius of the circle.
The area is in cm^2 and the radius is in cm.

You can find out how to access a field from the Circle record here :
http://elm-lang.org/docs/syntax#records

Try to use a let / in expression, which you can read about here :
http://elm-lang.org/docs/syntax#let-expressions
--}
findRadius : Circle -> Float
findRadius {area} = let rSquared = area / pi
                    in sqrt rSquared

{--
Implement the biggerCircle function. It should return a circle with twice the area.

You can read some more about records here :
http://elm-lang.org/docs/syntax#records
--}
biggerCircle : Circle -> Circle
biggerCircle shape = { shape | area = shape.area * 2 }


{--
Return a function (a lambda) from the function below. The lambda should
Take one argument of type Int and return an Int twice as big

Read about functions and lambdas here : http://elm-lang.org/docs/syntax#functions
--}
f : Int -> Int
f = \n -> n * 2
