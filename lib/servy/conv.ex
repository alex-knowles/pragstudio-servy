defmodule Servy.Conv do
  defstruct method: "", path: "", resp_body: "", status: nil

  def format_status(%Servy.Conv{} = conv) do
    "#{conv.status} #{conv.status |> status_reason}"
  end

  defp status_reason(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }[code]
  end
end
