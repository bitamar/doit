module Doit.Messages exposing (Msg(..))

import Http
import Doit.Model exposing (Input, Task)


type Msg
    = InputChange Input String
    | LoadTasks (Result Http.Error (List Task))
