module Doit.Update exposing (update, init)

-- import Doit.Http exposing (loadTasks)

import Doit.Model exposing (initialModel, Input(..), Model, Task)
import Doit.Messages exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        -- Currently the parser doesn't allow "inputs = { model.inputs".
        inputs_ =
            model.inputs
    in
        case msg of
            InputChange Email value ->
                { model | inputs = { inputs_ | email = maybeValue value } } ! []

            InputChange Password value ->
                { model | inputs = { inputs_ | password = maybeValue value } } ! []

            LoadTasks (Ok tasks) ->
                { model | error = Nothing, tasks = Just tasks } ! []

            LoadTasks (Err error) ->
                { model | error = Just error, tasks = Nothing } ! []


init : ( Model, Cmd Msg )
init =
    initialModel ! []


maybeValue : String -> Maybe String
maybeValue value =
    if (value == "") then
        Nothing
    else
        Just value



-- ( initialModel
-- , loadTasks "http://localhost:4000/api"
-- )
