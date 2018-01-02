module Part1Suite exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Part1 exposing (..)
import Debug exposing (..)

suite : Test
suite =
    describe "Part1 Exercises"
      [ test "circle converts to square" <|
          \_ ->
                let circle = Circle 1.0
                    square = Square 1.0
                in Expect.equal square <| Part1.toSquare circle
        ,test "square converts to circle" <|
          \_ ->
                let circle = Circle 1.0
                    square = Square 1.0
                in Expect.equal circle <| Part1.toCircle square
      ]
