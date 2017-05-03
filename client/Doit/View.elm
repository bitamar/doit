module Doit.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Doit.Model exposing (Model, Task)
import Doit.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    case model.error of
        Just error ->
            div []
                [ text <| toString model.error
                ]

        -- No error
        Nothing ->
            ul [] <| List.map viewTask model.tasks


viewTask : Task -> Html Msg
viewTask task =
    li
        [ classList [ ( "completed", task.completed ), ( "editing", task.editing ) ] ]
        [ div
            [ class "view" ]
            [ input
                [ class "toggle"
                , type_ "checkbox"
                , checked task.completed
                  -- , onClick (Check todo.id (not todo.completed))
                ]
                []
            , label
                [--onDoubleClick (EditingEntry todo.id True)
                ]
                [ text task.title ]
            , button
                [ class "destroy"
                  -- , onClick (Delete todo.id)
                ]
                []
            ]
        , input
            [ class "edit"
              -- , value todo.description
            , name "title"
            , id ("todo-" ++ toString task.id)
              -- , onInput (UpdateEntry todo.id)
              -- , onBlur (EditingEntry todo.id False)
              -- , onEnter (EditingEntry todo.id False)
            ]
            []
        ]
