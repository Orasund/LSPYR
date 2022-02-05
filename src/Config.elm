module Config exposing (..)

import Html exposing (Attribute)
import Html.Attributes as Attr


imageOffset : List (Attribute msg)
imageOffset =
    [ Attr.style "position" "relative"
    , Attr.style "right" "6.5%"
    , Attr.style "top" "-150px"
    ]


imageMaxWidth : Attribute msg
imageMaxWidth =
    Attr.style "max-width" "910px"


contentWidth : Attribute msg
contentWidth =
    Attr.style "width" "88%"


contentMaxWidth : Attribute msg
contentMaxWidth =
    --originally i had a 1px border
    Attr.style "max-width" "802px"


telefonNr : String
telefonNr =
    "**+43 650 4455988**"


email : String
email =
    "**info@ergotherapie-payr.at**"
