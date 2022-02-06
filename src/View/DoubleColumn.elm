module View.DoubleColumn exposing (..)

import Html exposing (Html)
import Html.Attributes as Attr


view : String -> ( List (Html msg), List (Html msg) ) -> Html msg
view name ( c1, c2 ) =
    [ Html.h2 [] [ Html.text name ]
    , [ c1
            |> Html.div [ Attr.class "col-4" ]
      , c2
            |> Html.div [ Attr.class "col" ]
      ]
        |> Html.div [ Attr.class "row" ]
    ]
        |> Html.div [ Attr.class "vstack gap-3" ]
