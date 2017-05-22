module Doit.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Doit.Model exposing (Model, Page(..), Task)
import Doit.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    viewMainContent model


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

                Register ->
                    viewRegister

                Tasks ->
                    viewTasks model.tasks


viewError : Http.Error -> Html Msg
viewError error =
    div []
        [ text <| toString error
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


textInput id inputType label =
    div []
        [ Html.label [ for id ] [ text label ]
        , input [ Html.Attributes.id id, placeholder label, type_ inputType ] []
        ]


viewLogin : Html Msg
viewLogin =
    Html.form []
        [ textInput "email" "email" "Email"
        , textInput "password" "password" "Password"
        , button [] [ text "Login" ]
        ]


viewRegister : Html Msg
viewRegister =
    div [] [ text "Register" ]


viewTasks : Maybe (List Task) -> Html Msg
viewTasks tasks =
    case tasks of
        Just tasks ->
            ul [] <| List.map viewTask tasks

        Nothing ->
            div [] [ text "No tasks" ]
