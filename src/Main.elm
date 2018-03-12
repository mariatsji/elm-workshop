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
            [ "Functional frontend language"
            , "Statically typed"
            ]

        , md  """
        # Easy app setup
        ```elm
        $ elm-package install elm-lang/html
        ```
        And we're ready to go!
        """
        ]
