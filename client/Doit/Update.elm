module Doit.Update exposing (update, init)

-- import Doit.Http exposing (loadTasks)

import Doit.Model exposing (initialModel, Model, Task)
import Doit.Messages exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LoadTasks (Ok tasks) ->
            ( { model | error = Nothing, tasks = Just tasks }, Cmd.none )

        LoadTasks (Err error) ->
            ( { model | error = Just error, tasks = Nothing }, Cmd.none )


init : ( Model, Cmd Msg )
init =
    initialModel ! []



-- ( initialModel
-- , loadTasks "http://localhost:4000/api"
-- )
