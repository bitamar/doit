module Doit.View exposing (view)

import Html exposing (..)


-- import Html.Attributes exposing (..)
-- import Html.Events exposing (..)

import Doit.Model exposing (Model)
import Doit.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    case model.error of
        Just error ->
            div []
                [ text <| toString model.error
                ]

        Nothing ->
            div [] [ text "ok" ]
