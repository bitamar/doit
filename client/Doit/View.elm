module Doit.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Doit.Model exposing (Model, Input(..), Page(..), Task)
import Doit.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ node "link" [ rel "stylesheet", href "mui.min.css" ] []
        , viewMainContent model
        , div [ class "mui-panel" ] [ pre [] [ text <| toString model ] ]
        ]


viewMainContent : Model -> Html Msg
viewMainContent model =
    case model.error of
        Just error ->
            viewError error

        -- No error
        Nothing ->
            case model.activePage of
                Login ->
                    viewLogin

                Tasks ->
                    viewTasks model.tasks


viewError : Http.Error -> Html Msg
viewError error =
    div []
        [ text <| toString error
        ]


viewLogin : Html Msg
viewLogin =
    Html.form [ class "mui-form mui-panel" ]
        [ div [ class "mui-textfield" ]
            [ input [ onInput (InputChange Email), type_ "email", required True ] []
            , label [] [ text "Email" ]
            ]
        , div [ class "mui-textfield" ]
            [ input [ onInput (InputChange Password), type_ "password", required True, minlength 5 ] []
            , label [] [ text "Password" ]
            ]
        , button [ class "mui-btn mui-btn--raised" ] [ text "Login / Register" ]
        ]


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
                ]
                []
            , label
                []
                [ text task.title ]
            , button
                [ class "destroy" ]
                []
            ]
        , input
            [ class "edit"
            , name "title"
            , id ("todo-" ++ toString task.id)
            ]
            []
        ]


viewTasks : Maybe (List Task) -> Html Msg
viewTasks tasks =
    case tasks of
        Just tasks ->
            ul [] <| List.map viewTask tasks

        Nothing ->
            div [] [ text "No tasks" ]
