module Doit.Subscriptions exposing (subscriptions)

import Doit.Model exposing (Model)
import Doit.Messages exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
