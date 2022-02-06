module Pages.About exposing (page)

import Config
import Gen.Params.About exposing (Params)
import Gen.Route exposing (Route)
import Html
import Html.Attributes as Attr
import Markdown
import Page exposing (Page)
import Request
import Shared
import View exposing (View)
import View.DoubleColumn as DoubleColumn
import View.Page as Page


page : Shared.Model -> Request.With Params -> Page
page shared req =
    Page.static
        { view = view req.route
        }


view : Route -> View msg
view route =
    { title = "Einzelförderung für Schulkinder"
    , body =
        ( Html.img [ Attr.src "assets/profil.jpeg", Config.roundedBorder, Attr.style "width" "100%" ] []
            |> List.singleton
        , """
##### Lebenslauf

* geboren 1973 in Innsbruck
* Mutter eines Sohnes (geb. 1995), verheiratet
* Ausbildung zur Ergotherapeutin 1991 – 1994
* Ab 1996 als Ergotherapeutin tätig im pädiatrischen und geriatrischen Bereich
* 2006 - 2009: Berufsbegleitender Lehrgang in Waldorfpädagogik mit der Fachrichtung Klassenlehrerin an der Akademie für Anthroposophische Erwachsenenbildung, Waldorf Salzburg
* Seit 2008 Klassenlehrerin an der Freien Waldorfschule Innsbruck
* 2016 - 1017: Berufsbegleitender Lehrgang zur diplomierten Legasthenietrainierin und zur diplomierten Dyskalkulietrainerin an der EÖDL, Klagenfurt
* September 2017: Aufnahme der freiberuflichen Ausübung des ergotherapeutischen Dienstes"""
            |> Markdown.toHtml []
            |> List.singleton
        )
            |> DoubleColumn.view "Über Mich"
            |> Page.view route
    }
