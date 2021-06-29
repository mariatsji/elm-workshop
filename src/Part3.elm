module Part3 exposing (..)

import Json.Encode as Encode

type Person = Person String Int

{-- complete the toJSON function - it should create json that looks like this (indentation matters)
{"name": "Sjur",birthYear: 1981}

You can use these functions to achieve it:
https://package.elm-lang.org/packages/elm/json/latest/Json-Encode#encode
https://package.elm-lang.org/packages/elm/json/latest/Json-Encode#object
https://package.elm-lang.org/packages/elm/json/latest/Json-Encode#string
https://package.elm-lang.org/packages/elm/json/latest/Json-Encode#int
--}
toJSON : Person -> String
toJSON _ = ""