module TestSuite exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Part1 exposing (..)
import Debug exposing (..)

suite : Test
suite =
    describe "Part1 Exercises"
      [ test "dummytest" <|
          \_ ->
                let tuples = [(2,0),(1,2)]
                in Expect.equal [(2,0),(1,2)] tuples
    ]
