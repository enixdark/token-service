defmodule TokenService.Token do
  use Ecto.Schema
  import Ecto.Changeset

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "token" do
    field :name, :string
    field :fullname, :string
    field :symbol, :string
    field :type, {:array, :string}
    field :description, :string
    field :logo, :string
    field :platform, {:array, :string}
    field :support_languages, {:array, :string}
    field :license, {:array, :string}
    field :contract_address, :string
    field :algorithm, :string
    field :proof_type, :string
    field :total_coin_supply, :string
    field :decimals, :integer
    field :release_date, :utc_datetime
    field :created_at, :utc_datetime
    field :updated_at, :utc_datetime
    field :is_active, :boolean
    field :version, :integer
  end
end
