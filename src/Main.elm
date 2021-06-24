module Main exposing (main)

import Css exposing (hex, maxWidth, px)
import Css.Global exposing (code, img)
import List
import Slides exposing (md, mdFragments, slidesDefaultOptions)
import Slides.Styles


customStyleOptions =
    { slidesDefaultOptions
        | style =
            List.append
                [ img [ maxWidth (px 100) ] ]
            <|
                Slides.Styles.elmMinimalist
                    (hex "#fff")
                    (hex "#ccc")
                    (px 16)
                    (hex "#000")
    }


main =
    Slides.app
        customStyleOptions
        [ md """
        # ![Elm logo](images/elm-logo.png "FINN.no") Elm, hands-on

        ![FINN logo](images/finn-logo.png "FINN.no")

        ##### Christopher Kolstad, Stig Kleppe-Jørgensen, Sjur Millidahl
        """
        , mdFragments
            [ "# The Elm Language"
            , "Functional frontend language"
            , "Statically typed"
            , "Compiled frontend catches bugs before runtime"
            , "Once compiled, it works"
            ]
        , md """
          # Meet Elm
          ```elm
          -- Boolean
          True  : Bool
          False : Bool

          42    : number  -- Int or Float depending on usage
          3.14  : Float

          'a'   : Char
          "abc" : String
          ```
          """
        , md """
          # A function
          ```elm
          {-- A comment for the function below
              The type signature indicates a function from
              String to Bool
          --}
          hasOddLength : String -> Bool
          hasOddLength s = String.length s % 2 == 1

          -- lambda syntax
          oddLambda = \\s -> String.length s % 2 == 1
          ```
          """
        , md """
          # Conditions
          ```elm
          f : Int -> String
          f n = if n > 0 then
              "One"
            else if n == 2 then
              "Two"
            else
              "Many"
          ```
          """
        , mdFragments
            [ "# Product Type"
            , """
              ```elm
              -- Wraps address and weight
              type Postable =        -- data type
                Package String Float -- data constructor

              Package "Osloveien 1" 2.3
              ```
              """
            , "`Postable` seen in type signatures"
            , "`Package` seen in function bodys"
            ]
        , mdFragments
            [ "# Union Type"
            , """
            ```elm
            type TrafficLight         -- the data type
              = Green | Yellow | Red  -- data constructors
            ```
            """
            , "`TrafficLight` seen in type signatures"
            , "`Green`, `Yellow`, `Red` seen in function bodys"
            ]
        , md """
          # Using our TrafficLight
          ```elm
          -- Notice that we use the data type in the type signature
          -- (Types belong at the type level)
          crossSafely : TrafficLight -> Bool
          crossSafely tl =
            case tl of
              Green -> True -- pattern matching on fields
              _ -> False    -- wildcard match
          ```
          """
        , md """
          # Record Syntax
          ```elm
          type alias Location =           -- type aliases for records
            { line : Int
            , column : Int
            }

          point =                         -- create a record
            { x = 3, y = 4 }

          point.x                         -- access field

          List.map .x [point,{x=0,y=0}]   -- field access function

          { point | x = 6 }               -- update a field

          { point |                       -- update many fields
              x = point.x + 1,
              y = point.y + 1
          }

          dist {x,y} =                    -- pattern matching on fields
            sqrt (x^2 + y^2)
          ```
          """
        , mdFragments
            [ "# Tuples and Lists"
            , """
            ```elm
            -- 4 identical lists (of type List Int)
            myList = [1,2,3,4]
            myList2 = 1 :: [2,3,4]
            myList3 = 1 :: 2 :: 3 :: 4 :: []
            ```
            """
            , """
            ```elm
            myTuple : (Char, Int)
            myTuple = ('a', 1)

            Tuple.first myTuple
            ```
          """
            ]
        , md """
          # let / in
          ```elm
          span : List Int -> (Int, Int)
          span xs
            = let maybeMin = List.minimum xs
                  maybeMax = List.maximum xs
                  min = Maybe.withDefault 0 maybeMin
                  max = Maybe.withDefault 0 maybeMax
              in (min, max)
          ```
          """
        , md """
          # Higher-order functions
          ```elm
          List.map String.reverse ["stressed", "desserts"]

          sevens = List.filter ((==) 7) [6,7,8]

          List.tail <| List.range 1 (List.length sevens) -- <| to skip paranthesis

          List.tail (List.range 1 (List.length sevens))  --  equivalent

          (String.length << toString) 42 -- function composition
          ```
          """
        , md """
          # Currying
          ```elm
          concatenate : String -> String -> String
          concatenate a b = a ++ b
          ```
          """
        ]
