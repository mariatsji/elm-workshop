module Part2Suite exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Part2 exposing (..)
import Debug exposing (..)

suite : Test
suite =
    describe "Part2 Exercises"
      [ test "finds the radius of a circle (with an area)" <|
          \_ ->
                let circle = Circle pi
                in Expect.equal 1 <| Part2.findRadius circle
       ,test "creates a bigger circle from a smaller one" <|
          \_ ->
                let circle = Circle 5.0
                in Expect.equal (Circle 10.0) <| Part2.biggerCircle circle
       ,test "creates a lambda that doubles an int" <|
          \_ -> Expect.equal 2 <| Part2.f 1
      ]
