defmodule CinemaApp.Repo.Migrations.TopicOfInterestTable do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :topic_name,:string
    end


  end
end
