defmodule Servy.Parser do

  alias Servy.Conv

  def parse(request) do
    [top, params] = String.split(request, "\n\n")

    [method, path, _] =
      top
      |> String.split("\n")
      |> List.first
      |> String.split(" ")

    params = parse_params(params)

    %Conv{
      method: method,
      path: path,
      params: params
    }
  end

  defp parse_params(params) do
    params
    |> String.trim
    |> URI.decode_query
  end
end