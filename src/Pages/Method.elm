module Pages.Method exposing (page)

import Gen.Params.Method exposing (Params)
import Gen.Route exposing (Route)
import Html
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
        """
##### Ergotherapie

* Ergotherapie (griechisch „ergon": „handeln, tun") beschäftigt sich mit der Entwicklung der Handlungsfähigkeit im Alltag.
* Besonderheit der Ergotherapie liegt in der Methode, unterschiedliche Materialien im Rahmen von Spiel, kreativen Tätigkeiten und Alltagshandlungen gezielt einzusetzen.

##### Waldorfpädagogik

* Die Waldorfpädagogik ist eine Reformpädagogik, die von Rudolf Steiner angeregt wurde.
* Waldorfpädagogen schulen sich in der Wahrnehmung der einzigartigen Individualität des heranwachsenden Kindes um seine Entfaltung bestmöglich zu unterstützen.

##### Legasthenie- und Dyskalkulietraining

* Diplomierte Legasthenie- bzw. Dyskalkulietrainer sind befähigt, eine Lese-Rechtschreibschwäche bzw. eine Rechenschwäche auf pädagogisch-didaktischer Ebene zu diagnostizieren und Betroffene adäquat zu fördern."""
            |> Markdown.toHtml []
            |> List.singleton
            |> SingleColumn.view "Methode"
            |> Page.view route
    }
