module Config exposing (..)

import Html exposing (Attribute)
import Html.Attributes as Attr


imageXOffset : Attribute msg
imageXOffset =
    Attr.style "right" "0.5%"


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
