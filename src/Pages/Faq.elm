module Pages.Faq exposing (page)

import Config
import Gen.Params.Faq exposing (Params)
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
##### Wie vereinbare ich einen Termin?

* Kontaktieren Sie mich unter der Telefonnummer **"""
            ++ Config.telefonNr
            ++ """**
* oder mailen Sie mir mit dem Betreff: **„Kontaktaufnahme“** unter der Mailadresse: **"""
            ++ Config.email
            ++ """**

##### Welche Ausgaben kommen auf mich zu?

* Für ein **unverbindliches Erstgespräch**:
  * Kosten: 10 Euro
  * Dauer: 20 - 40 Minuten  
  * Wichtig ist die Kontaktaufnahme mit den Eltern, das Kind darf gerne dabei sein.
* Für eine **Diagnose mit ASF-Test, Gutachten und Gespräch**:
  * Kosten: 55 Euro
  * Dauer: 1 - 2 Stunden  
    zu 50 Minuten mit dem Kind (Eltern dürfen anwesend sein)  
    und bis zu 50 Minuten Gesprächszeit nur mit den Eltern, ohne Kind
* Für eine **Therapiestunde**:
  * Kosten: 30 - 55 Euro  
    je nachdem ob die Kosten allein von der Familie oder durch die Krankenkasse getragen werden.
  * Dauer: 60 Minuten
* Ermäßigung ist grundsätzlich möglich - bitte fragen Sie bei Bedarf nach.

##### Ich bin am Therapietermin verhindert, was kann ich tun?

Ich bitte Sie, den vereinbarten Termin so früh wie möglich, spätestens jedoch um 9 Uhr vormittags mittels SMS auf die Telefonnummer **"""
            ++ Config.telefonNr
            ++ """** abzusagen, andernfalls muss ich die volle Einheit verrechnen.

##### Was bedeutet Schweigepflicht?

Therapie hat viel mit Vertrauen zu tun. Als Therapeutin unterliege ich der absoluten Schweigepflicht. Ich vernetze mich nur nach Absprache mit den Eltern mit den anderen Berufsgruppen zu den erforderlichen Themen"""
            |> Markdown.toHtml []
            |> List.singleton
            |> SingleColumn.view "Fragen & Antworten"
            |> Page.view route
    }
