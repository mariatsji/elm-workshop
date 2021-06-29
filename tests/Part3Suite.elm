module Part3Suite exposing (..)

import Debug exposing (..)
import Expect exposing (Expectation)
import Part3 exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Part3 Exercises"
        [ test "creates a person" <|
            \_ ->
                let
                    me =
                        Person "Sjur" 1981
                in
                Expect.equal "{\"name\":\"Sjur\",\"birthYear\":1981}" <| (Part3.toJSON me)
        ]
