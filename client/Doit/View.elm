module Doit.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Doit.Model exposing (Model)
import Doit.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [-- button [ onClick LoadTasks ] [ text "Load tasks" ]
        ]
