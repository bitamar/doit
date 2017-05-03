module Doit.Messages exposing (Msg(..))

import Http
import Doit.Model exposing (Task)


type Msg
    = NoOp
    | LoadTasks (Result Http.Error (List Task))
