module Main exposing (main)

import Html
import Doit.Messages exposing (Msg(..))
import Doit.Subscriptions
import Doit.Model exposing (Model)
import Doit.Update
import Doit.View


main : Program Never Model Msg
main =
    Html.program
        { init = Doit.Update.init
        , update = Doit.Update.update
        , view = Doit.View.view
        , subscriptions = Doit.Subscriptions.subscriptions
        }
