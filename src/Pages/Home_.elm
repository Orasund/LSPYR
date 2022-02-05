module Pages.Home_ exposing (page)

import Gen.Params.Home_ exposing (Params)
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
##### Unverbindliches Erstgespräch mit Diagnose-Erstellung und Gutachten

* In einem unverbindlichen Erstgespräch mit den Eltern stelle ich Fragen zur schulischen Situation, zum Alltag des Kindes und zu seiner bisherigen Entwicklung.
* Ich bitte um Schulhefte zur Ansicht.
* Im spielerischen Tun lernen das Kind und ich uns kennen.
* Innerhalb einer oder zweier Stunden gelange ich mithilfe eines [Tests](http://www.legasthenie.at/afs-test-zur-feststellung-einer-legasthenie-oder-dyskalkulie/) zu einem differenzierten Bild den Fähigkeiten des Kindes in Aufmerksamkeit und Sinnesverarbeitung.
* In einem zweiten Elterngespräch zeige ich die Ergebnisse und Empfehlungen für eine weitere Vorgehensweise auf.
* Gerne verfasse ich ein Gutachten.
* Kommt es zu einer weiteren Zusammenarbeit, benenne ich das kurzfristige Ziel und lege die dafür erforderliche Stundenanzahl fest.

##### Wesentliche Elemente einer Stunde, je nach Diagnose unterschiedlich gewichtet:

* Körperübungen um sich zu erden
* Handwerkliche, gestalterische und spielerische Aktivitäten, speziell abgestimmt auf die weitere Sinnesentwicklung des Kindes.
* Schwerpunkt bei einer Lese-Rechtschreibförderung ist das Lesen und Schreiben; bei einer Rechenförderung sind es der Aufbau des Zahlenverständnisses und die Rechenprozesse.

##### Zusammenarbeit, Beratung

* Gerne gebe ich Ratschläge, wie das Üben zu Hause gelingen kann.
* Sind die vereinbarten Stunden zu Ende, bespreche ich mit den Eltern, in wie weit das kurzfristige Ziel erreicht wurde und wie die weitere Entwicklung aussehen könnte.
* Bedeutsam für eine gute Entwicklung ist das Zusammenwirken aller Erwachsenen, die für das Kind Sorge tragen: Eltern, Erziehende, Lehrkräfte, Therapeuten, zuweisende Ärzte.
            """
            |> Markdown.toHtml []
            |> List.singleton
            |> SingleColumn.view "Angebot"
            |> Page.view route
    }
