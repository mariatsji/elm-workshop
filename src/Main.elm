module Main exposing (..)

import Html.Attributes exposing (src, alt, height, width, style, align)
import Html exposing (Html, p, body, div, h1, img, text, span)
import Slides exposing (md, mdFragments, slidesDefaultOptions)
import Slides.Styles exposing (elmMinimalist)
import List exposing (append)
import Css exposing (maxWidth, px, hex)
import Css.Elements exposing (img)


customStyleOptions =
        { slidesDefaultOptions
        | style = List.append
             [ Css.Elements.img
                [ maxWidth (px 100)
                ]
             ]
             <| Slides.Styles.elmMinimalist (hex "#fff") (hex "#ccc") (px 16) (hex "#000")
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
            , "## Functional frontend language"
            , "## Statically typed"
            ]

        , md  """
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
        ```
        """

        , mdFragments
          [ "# Create a Data Type"
          , """
            ```elm
            type TrafficLight          -- The Data Type
              = Green | Yellow | Red   -- Data Constructors
            ```
            """
          , "`TrafficLight` seen in type signatures"
          , "`Green`, `Yellow`, `Red` seen in function implementations"]

        , md """
          # Using our TrafficLight
          ```elm
          -- Notice that we use the data type in the type signature
          -- (Types belong at the type level)
          crossSafely : TrafficLight -> Bool
          crossSafely tl =
            case tl of
              Green -> True -- Type destructed to Data constructor
              _ -> False    -- Wildcard match
          ```
          """
        ]
