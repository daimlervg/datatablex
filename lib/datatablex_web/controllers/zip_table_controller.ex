defmodule DatatablexWeb.ZipTableController do
    use DatatablexWeb, :controller
    alias Datatablex.Configurations
  
    action_fallback DatatablexWeb.FallbackController
  
    def index(conn, params) do
      render(conn, "index.json", payload: Configurations.datatable_zips(params))
    end
  end