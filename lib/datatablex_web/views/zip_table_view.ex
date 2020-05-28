defmodule DatatablexWeb.ZipTableView do
    use DatatablexWeb, :view
  
    def render("index.json", %{payload: payload}) do
      PhoenixDatatables.map_payload(payload, &item_json/1)
    end
  
    def item_json(item) do
      %{
        zip_code: item.zip_code,
        city: item.city,
        state: item.state
      }
    end
  
  end
  