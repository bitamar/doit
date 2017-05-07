module Doit.Http exposing (loadTasks)

import Http
import Json.Decode as Decode exposing (at, bool, field, int, map6, maybe, string, succeed)
import Doit.Messages exposing (Msg(..))
import Doit.Model exposing (initialModel, Model, Task)


type alias Url =
    String


loadTasks : Url -> Cmd Msg
loadTasks apiUrl =
    let
        tasksUrl =
            apiUrl ++ "/tasks"
    in
        Http.send LoadTasks (Http.get tasksUrl decodeTasks)


decodeTasks : Decode.Decoder (List Task)
decodeTasks =
    at [ "data" ] <| Decode.list decodeTask


decodeTask : Decode.Decoder Task
decodeTask =
    map6 Task
        (field "id" int)
        (field "title" string)
        (field "description" <| maybe string)
        (field "completed" bool)
        (field "due_date" <| maybe string)
        -- Hardcode False for "editing".
        (succeed False)
