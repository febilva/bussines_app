defmodule BusinessAppWeb.User do
  require IEx
  use BusinessAppWeb, :model
  alias BusinessAppWeb.User
  alias BusinessApp.Repo
  # import Comeonin
  # alias Comeonin.Bcrypt

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    many_to_many :topics, BusinessAppWeb.Topic,join_through: "topic_of_interestes" 
  end
  # timestamps()
  def changeset(struct, params) do
    struct
    |> cast(params, [:email, :name, :password])
    |> validate_required([:email, :password])
    |> validate_changeset
  end
  defp validate_changeset(struct) do
    struct
    |> validate_length(:email, min: 5, max: 255)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 8)
    |> validate_format(:password, ~r/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*/, [message: "Must include at least one lowercase letter, one uppercase letter, and one digit"])
    |> generate_password_hash
  end

  defp generate_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end




#user  login credentialas verification done here
  # def authenticate(%{"email" => email, "password" => password}) do
  #   user = Repo.get_by(User, email: String.downcase(email))
  #   # IEx.pry
  #   case check_password(user, password) do
  #     true -> {:ok, user}
  #     _ -> :error
  #   end
  # end
  #
  # defp check_password(user, password) do
  #   case user do
  #     nil -> Comeonin.Bcrypt.dummy_checkpw()
  #     _ -> Comeonin.Bcrypt.checkpw(password, user.password_hash)
  #   end
  # end

end
