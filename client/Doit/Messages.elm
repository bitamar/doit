module Doit.Messages exposing (Msg(..))

import Http


type Msg
    = NoOp
    | LoadTasks (Result Http.Error String)
