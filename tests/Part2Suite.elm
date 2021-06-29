module Part2Suite exposing (..)

import Debug exposing (..)
import Expect exposing (Expectation)
import Part2 exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Part2 Exercises"
        [ test "finds the radius of a circle (with an area)" <|
            \_ ->
                let
                    circle =
                        Circle pi
                in
                Expect.equal 1 <| Part2.findRadius circle
        , test "creates a bigger circle from a smaller one" <|
            \_ ->
                let
                    circle =
                        Circle 5.0
                in
                Expect.equal (Circle 10.0) <| Part2.biggerCircle circle
        , test "creates a lambda that doubles an int" <|
            \_ -> Expect.equal 2 <| Part2.f 1
        , test "finds the fifth fib number" <|
            \_ -> Expect.equal 8 (Part2.fib 5)
        ]
