module Doit.Update exposing (update, init)

import Http
import Json.Decode as Decode
import Doit.Model exposing (initialModel, Model)
import Doit.Messages exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LoadTasks (Ok newUrl) ->
            ( model, Cmd.none )

        LoadTasks (Err _) ->
            ( model, Cmd.none )


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


decodeTasks : Decode.Decoder String
decodeTasks =
    Decode.at [ "data", "image_url" ] Decode.string
