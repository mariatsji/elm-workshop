-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/buttons.html


module Calculator exposing (..)

import Browser
import Html exposing (Attribute, Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }



-- MODEL


type Operator
    = Plus


type alias Model =
    { a : String
    , b : String
    , result : Float
    }


init : Model
init =
    { a = "41.0", b = "42.0", result = 0.0 }



-- UPDATE


type Msg
    = EnterA String
    | EnterB String
    | Add
    | Sub
    | Mult
    | Div


update : Msg -> Model -> Model
update msg model =
    let
        parsedA =
            Maybe.withDefault 0 (String.toFloat model.a)

        parsedB =
            Maybe.withDefault 0 (String.toFloat model.b)
    in
    case msg of
        EnterA newA ->
            { model | a = newA }

        EnterB newB ->
            { model | b = newB }

        Add ->
            { model | result = parsedA + parsedB }

        Sub ->
            { model | result = parsedA - parsedB }

        Mult ->
            { model | result = parsedA * parsedB }

        Div ->
            { model | result = parsedA / parsedB }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input ([ placeholder model.a, onInput EnterA ] ++ validationStyle model.a) []
        , input ([ placeholder model.b, onInput EnterB ] ++ validationStyle model.b) []
        , button [ onClick Add ] [ text "+" ]
        , button [ onClick Sub ] [ text "-" ]
        , button [ onClick Mult ] [ text "*" ]
        , button [ onClick Div ] [ text "/" ]
        , div myStyle [ text (String.fromFloat (.result model)) ]
        ]


myStyle : List (Attribute msg)
myStyle =
    List.map (\( s1, s2 ) -> style s1 s2) styleList


styleList : List ( String, String )
styleList =
    [ ( "width", "100%" )
    , ( "height", "40px" )
    , ( "padding", "10px 0" )
    , ( "font-size", "2em" )
    , ( "text-align", "center" )
    ]


validationStyle : String -> List (Attribute msg)
validationStyle s =
    let
        color =
            case String.toFloat s of
                Just _ ->
                    "black"

                Nothing ->
                    "red"
    in
    style "color" color :: myStyle
