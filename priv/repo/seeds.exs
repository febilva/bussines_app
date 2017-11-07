# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BusinessApp.Repo.insert!(%BusinessApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias BusinessApp.Repo
alias BusinessAppWeb.Topic

changeset =
  BusinessAppWeb.User.changeset(%BusinessAppWeb.User{},
                                %{
                                  email: "munnefg.tvr@gmail.com",
                                  password: "Password666",
                                  name: "febil.tvr",
                                })
{:ok, user} = BusinessApp.Repo.insert(changeset)
user = BusinessApp.Repo.preload(user, :topics)
topic_changeset = %Topic{topic_name: Faker.String.base64()}
# {:ok,topic} = BusinessApp.Repo.insert(topic_changeset)
# topic = BusinessApp.Repo.preload(topic, :users)
# changeset =
#   Ecto.Changeset.change(user)
#   |> Ecto.Changeset.put_assoc(:topics, [topic])
# Repo.update changeset
1..20
|> Enum.each(fn x ->
               {:ok, topic} = BusinessApp.Repo.insert(topic_changeset)
               topic = BusinessApp.Repo.preload(topic, :users)
               changeset =
                 Ecto.Changeset.change(user)
                 |> Ecto.Changeset.put_assoc(:topics, [topic])
                 Repo.update changeset
             end)
# (1..21) |> Enum.each(fn(x) -> Repo.insert(topic_changeset) |> Repo.preload(:) end)
