module Helper exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href)


type GradeStatus
    = Approved
    | Failed
    | Pending


type AirplaneStatus
    = OnTime
    | Boarding
    | Delayed
    | Cancelled


joinWords : String -> String -> String
joinWords w1 w2 =
    w1 ++ w2


isUpperChars : List Char -> List Bool
isUpperChars list =
    List.map Char.isUpper list


categoricalGrade : List Float -> List GradeStatus
categoricalGrade grades =
    List.map checkGrade grades


checkGrade : Float -> GradeStatus
checkGrade g =
    if g < 0 then
        Pending

    else if g >= 7 then
        Approved

    else
        Failed


airplaneScheduleAction : AirplaneStatus -> String
airplaneScheduleAction s =
    case s of
        Cancelled ->
            "Pedir reembolso"

        Delayed ->
            "Esperar"

        OnTime ->
            "Esperar"

        Boarding ->
            "Buscar boleto"


airportAction : List AirplaneStatus -> List String
airportAction list =
    List.map airplaneScheduleAction list


headers : String -> Html msg
headers p =
    div []
        [ h1 [] [ text p ]
        , h2 [] [ text p ]
        , h3 [] [ text p ]
        , h4 [] [ text p ]
        , h5 [] [ text p ]
        , h6 [] [ text p ]
        ]


hyperlink : String -> String -> Html msg
hyperlink url txt =
    a [ href url ] [ text txt ]
