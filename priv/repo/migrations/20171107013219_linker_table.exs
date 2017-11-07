defmodule BusinessApp.Repo.Migrations.LinkerTable do
  use Ecto.Migration

  def change do
    create table(:topic_of_interestes,primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :topic_id, references(:topics)
    end

  end
end
