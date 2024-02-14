defmodule StoryblokPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :storyblok_phoenix,
    adapter: Ecto.Adapters.Postgres
end
