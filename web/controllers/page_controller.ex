defmodule Doit.PageController do
  use Doit.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
