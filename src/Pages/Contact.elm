module Pages.Contact exposing (page)

import Config
import Gen.Params.Contact exposing (Params)
import Gen.Route exposing (Route)
import Html
import Html.Attributes as Attr
import Markdown
import Page exposing (Page)
import Request
import Shared
import View exposing (View)
import View.Page as Page
import View.SingleColumn as SingleColumn


page : Shared.Model -> Request.With Params -> Page
page shared req =
    Page.static
        { view = view req.route
        }


view : Route -> View msg
view route =
    { title = "Einzelförderung für Schulkinder"
    , body =
        [ """
Lisa Payr  
Jahnstraße 5  
6020 Innsbruck  
Tel.: """
            ++ Config.telefonNr
            ++ """  
Email: """
            ++ Config.email
            |> Markdown.toHtml []
        , "Als Kontakt Hinzufügen"
            |> Html.text
            |> List.singleton
            |> Html.a
                [ Attr.class "btn btn-primary"
                , Attr.href "contact.vcf"
                , Attr.attribute "role" "button"
                , Config.roundedBorder
                ]
        ]
            |> SingleColumn.view "Kontakt"
            |> Page.view route
    }
