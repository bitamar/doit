module Doit.Model exposing (initialModel, Input(..), Model, Page(..), Task)

import Http


type Page
    = Login
    | Tasks


type Input
    = Email
    | Password


type alias Model =
    { activePage : Page
    , accessToken : Maybe String
    , tasks : Maybe (List Task)
    , error : Maybe Http.Error
    , inputs :
        { email : Maybe String
        , password : Maybe String
        }
    }


initialModel : Model
initialModel =
    { activePage = Login
    , accessToken = Nothing
    , tasks = Nothing
    , error = Nothing
    , inputs =
        { email = Nothing
        , password = Nothing
        }
    }


type alias Task =
    { id : Int
    , title : String
    , description : Maybe String
    , completed : Bool
    , dueDate : Maybe String
    , editing : Bool
    }
