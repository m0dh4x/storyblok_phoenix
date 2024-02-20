defmodule StoryblokPhoenix.Storyblok do
  alias StoryblokPhoenix.Storyblok.Client

  def get_story() do
    "/v2/cdn/stories" |> Client.get_uri() |> get_body()
  end

  defp get_body(uri) do
    uri |> Client.get() |> parse_response
  end

  defp parse_response({200, body, _headers}), do: body |> Jason.decode!()

  defp parse_response({301, _body, headers}) do
    headers
    |> get_location()
    |> get_body()
  end

  defp parse_response({_, _body, _headers}), do: nil

  defp get_location(headers) do
    case get_header_items(headers, ~r/\Alocation\z/i) do
      [{_, location}] -> location
      _ -> nil
    end
  end

  defp get_header_items(headers, regex) do
    headers
    |> Enum.filter(fn {key, _} -> String.match?(key, regex) end)
  end
end
