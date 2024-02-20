defmodule StoryblokPhoenix.Storyblok.Client do
  @service Application.compile_env(:storyblok_phoenix, [:service, :storyblok])
  @headers [{"Accept", "application/json"}, {"Content-Type", "application/json"}]

  def get(uri) do
    with request <- Finch.build(:get, uri, @headers),
         {:ok, response} <- Finch.request(request, StoryblokPhoenix.Finch),
         %{status: status, body: body, headers: headers} <- response do
      {status, body, headers}
    else
      _ -> {500, nil, []}
    end
  end

  def get_uri(path) do
    "https://api.storyblok.com"
    |> URI.parse()
    |> URI.merge(path)
    |> URI.append_query("token=#{@service.key}")
  end
end
