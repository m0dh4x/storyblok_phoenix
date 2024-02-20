defmodule StoryblokPhoenix.StoryblokTest do
  use StoryblokPhoenix.DataCase, async: true

  alias StoryblokPhoenix.Storyblok

  # describe "storyblok is offline" do
  #   test "get_story returns error" do
  #     assert Storyblok.get_story() == :error
  #   end
  # end

  describe "storyblok is online" do
    test "get_story returns data" do
      assert %{} = Storyblok.get_story()
    end
  end
end
