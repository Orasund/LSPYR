module Config exposing (..)

import Html exposing (Attribute)
import Html.Attributes as Attr


imageOffset : List (Attribute msg)
imageOffset =
    [ Attr.style "position" "relative"
    , Attr.style "right" "0.5%"
    , Attr.style "padding-top" "calc(220px - 20%)"
    ]


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
    "**ergotherapie.payr@gmail.com**"


roundedBorder : Attribute msg
roundedBorder =
    Attr.style "border-radius" "19px"


address : String
address =
    """
Lisa Payr  
Fliederweg 5  
6063 Rum  
"""
