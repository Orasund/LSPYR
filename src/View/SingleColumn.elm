module View.SingleColumn exposing (view)

import Html exposing (Html)
import Html.Attributes as Attr


view : String -> List (Html msg) -> Html msg
view name content =
    Html.h2 [] [ Html.text name ]
        :: content
        |> Html.div [ Attr.class "vstack gap-3" ]
