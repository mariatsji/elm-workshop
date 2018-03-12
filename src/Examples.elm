module Main exposing (..)

import Html exposing (Html, Attribute, beginnerProgram, text, div, input, li, ul)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


{--
See how `listAligned` is used.

Task 1 : refactor the view to reverse a text (see Example 1)
Task 2 : create your own text transformation, any way you like.
  You can do this by creating a new function with the signature Model -> Html msg
  And applying this function from `view`
--}


main =
    beginnerProgram { model = "", view = view, update = update }



-- MODEL


type alias Model =
    String



-- UPDATE


type Msg
    = NewContent String


update : Msg -> Model -> Model
update (NewContent content) oldContent =
    content



{--
Example 1
--}


reverseString : Model -> Html msg
reverseString content =
    text (String.reverse content)



{--
Example 2
--}


listAligned : Model -> Html msg
listAligned content =
    let
        w =
            String.words content

        pad =
            String.padLeft 20 '.'

        padded =
            List.map pad w

        toLi =
            \x -> li [] [ text x ]
    in
        ul [] <| List.map toLi padded



-- VIEW


view : Model -> Html Msg
view content =
    div []
        [ input [ placeholder "Text to edit", onInput NewContent, inputStyle ] []
        , div [ outputStyle ] [ listAligned content ]
        ]


inputStyle : Html.Attribute msg
inputStyle =
    style
        [ ( "width", "100%" )
        , ( "height", "40px" )
        , ( "padding", "10px 0" )
        , ( "font-size", "2em" )
        , ( "text-align", "center" )
        ]


outputStyle : Html.Attribute msg
outputStyle =
    style
        [ ( "width", "100%" )
        , ( "height", "40px" )
        , ( "padding", "0" )
        , ( "font-size", "2em" )
        , ( "text-align", "left" )
        , ( "font-family", "monospace" )
        ]
