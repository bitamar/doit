module Doit.Model exposing (initialModel, Model, Page(..), Task)

import Http


type Page
    = Register
    | Login
    | Tasks


type alias Model =
    { activePage : Page
    , accessToken : Maybe String
    , tasks : Maybe (List Task)
    , error : Maybe Http.Error
    }


initialModel : Model
initialModel =
    { activePage = Login
    , accessToken = Nothing
    , tasks = Nothing
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
