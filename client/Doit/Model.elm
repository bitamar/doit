module Doit.Model exposing (initialModel, Model, Task)

import Http


type alias Model =
    { tasks : List Task
    , error : Maybe Http.Error
    }


initialModel : Model
initialModel =
    { tasks = []
    , error = Nothing
    }


type alias Task =
    { id : Int
    , title : String
    , description : Maybe String
    , completed : Bool
    , dueDate : Maybe String
    , editing : Bool
    }
