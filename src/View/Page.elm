module View.Page exposing (view)

import Config
import Gen.Route exposing (Route(..))
import Html exposing (Html)
import Html.Attributes as Attr
import Markdown


navbar : String -> Route -> List ( String, Route ) -> Html msg
navbar id route list =
    [ Html.a [ Attr.class "navbar-brand" ] []
    , Html.button
        [ Attr.class "navbar-toggler"
        , Attr.type_ "button"
        , Attr.attribute "data-bs-toggle" "collapse"
        , Attr.attribute "data-bs-target" ("#" ++ id)
        , Attr.attribute "aria-controls" id
        , Attr.attribute "expanded" "true"
        , Attr.attribute "aria-label" "Toggle Navigation"
        ]
        [ Html.span [ Attr.class "navbar-toggler-icon" ] [] ]
    , list
        |> List.map
            (\( name, r ) ->
                name
                    |> Html.text
                    |> List.singleton
                    |> Html.a
                        (if route == r then
                            [ Attr.class "nav-link active"
                            , Attr.attribute "aria-current" "page"
                            ]

                         else
                            [ Attr.class "nav-link"
                            , Attr.href (r |> Gen.Route.toHref)
                            ]
                        )
                    |> List.singleton
                    |> Html.li [ Attr.class "nav-item" ]
            )
        |> Html.ul [ Attr.class "navbar-nav" ]
        |> List.singleton
        |> Html.div
            [ Attr.class "collapse navbar-collapse justify-content-md-center"
            , Attr.id id
            ]
    ]
        |> Html.div
            [ Attr.class "container-md"
            ]
        |> List.singleton
        |> Html.nav
            [ Attr.class "navbar navbar-expand navbar-dark bg-primary fixed-top"
            , Attr.style "z-index" "5"
            ]


view : Route -> Html msg -> List (Html msg)
view route content =
    [ [ ( "Angebot", Home_ )
      , ( "Methode", Method )
      , ( "Fragen & Antworten", Faq )
      , ( "Über Mich", About )
      , ( "Kontakt", Contact )
      ]
        |> navbar "myNavbar" route
    , [ Html.img
            ([ Attr.src "assets/header.png"
             , Attr.style "width" "100%"
             , Attr.style "z-index" "1"
             ]
                ++ Config.imageOffset
            )
            []
            |> List.singleton
            |> Html.div
                [ Attr.style "height" "0px"
                , Attr.style "width" "100%"
                , Attr.style "margin-left" "auto"
                , Attr.style "margin-right" "auto"
                ]
      , [ "Lisa Payr"
            |> Html.text
            |> List.singleton
            |> Html.h1 []
        , "Ergotherapie"
            |> Html.text
            |> List.singleton
            |> Html.h6 []
        , "Einzelförderung für Schulkinder"
            |> Html.text
            |> List.singleton
            |> Html.h6 []
        ]
            |> Html.div
                [ Attr.style "position" "relative"
                , Attr.style "height" "0"
                , Attr.style "width" "300px"
                , Attr.style "left" "20%"
                , Attr.style "top" "80px"
                , Attr.style "z-index" "3"
                ]
      ]
        |> Html.div
            [ Attr.style "width" "100%"
            , Attr.style "max-width" "910px"
            , Attr.style "margin-left" "auto"
            , Attr.style "margin-right" "auto"
            ]
    , [ content
            |> List.singleton
            |> Html.div
                [ Attr.class "card-body"
                , Attr.style "background-color" "transparent"
                , Attr.style "z-index" "2"
                ]
            |> List.singleton
            |> Html.div
                [ Attr.class "card"
                , Config.roundedBorder
                ]
      , [ "Lisa Payr"
        , "Telefon: " ++ Config.telefonNr
        , "Email: " ++ Config.email
        , "[Impressum](" ++ Gen.Route.toHref Impressum ++ ")"
        ]
            |> String.join " - "
            |> Markdown.toHtml []
      ]
        |> Html.div
            [ Config.contentWidth
            , Config.contentMaxWidth
            , Attr.style "padding-top" "220px"
            , Attr.style "margin-left" "auto"
            , Attr.style "margin-right" "auto"
            , Attr.class "vstack gap-3"
            ]
    ]
