module Doit.Update exposing (update, init)

import Http
import Json.Decode as Decode
import Doit.Model exposing (initialModel, Model, Task)
import Doit.Messages exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LoadTasks (Ok tasks) ->
            ( { model | error = Nothing, tasks = tasks }, Cmd.none )

        LoadTasks (Err error) ->
            let
                _ =
                    Debug.log "error" error
            in
                ( { model | error = Just error }, Cmd.none )


init : ( Model, Cmd Msg )
init =
    ( initialModel
    , loadTasks
    )



-- HTTP


loadTasks : Cmd Msg
loadTasks =
    let
        url =
            "http://localhost:4000/api/tasks"
    in
        Http.send LoadTasks (Http.get url decodeTasks)


decodeTasks : Decode.Decoder (List Task)
decodeTasks =
    Decode.at [ "data" ] <| Decode.list decodeTask


decodeTask : Decode.Decoder Task
decodeTask =
    Decode.map6 Task
        (Decode.at [ "id" ] Decode.int)
        (Decode.at [ "title" ] Decode.string)
        (Decode.at [ "description" ] Decode.string)
        (Decode.at [ "completed" ] Decode.bool)
        (Decode.at [ "due_date" ] Decode.string)
        -- Hardcode False for "editing".
        (Decode.succeed False)
