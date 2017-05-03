module Doit.Http exposing (loadTasks)

import Http
import Json.Decode as Decode
import Doit.Messages exposing (Msg(..))
import Doit.Model exposing (initialModel, Model, Task)


type alias Url =
    String


loadTasks : Url -> Cmd Msg
loadTasks apiUrl =
    let
        tasksUrl =
            apiUrl ++ "/api/tasks"
    in
        Http.send LoadTasks (Http.get tasksUrl decodeTasks)


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
