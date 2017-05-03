module Doit.Model exposing (initialModel, Model, Task)

import Http


type alias Model =
    { error : Maybe Http.Error }


initialModel : Model
initialModel =
    { error = Nothing }


type alias Task =
    { id : Int
    , title : String
    , description : String
    , completed : Bool
    , dueDate : String
    }
