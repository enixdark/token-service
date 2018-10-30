defmodule TokenService.Startup do

  def ensure_indexes do
    IO.puts "Using database #{Application.get_env(:token_service, :db)[:name]}"
    Mongo.command(:mongo, %{createIndexes: "tokens",
      indexes: [
        %{ key: %{
          "name": 1 },
          name: "name_idx",
          nique: false
        },
        %{
          key: %{
          "symbol": 1
          },
          name: "symbol_idx",
          unique: false
        },
        %{
          key: %{
            "updated_at": 1
          },
          name: "updated_at_idx",
          unique: false
        },
        %{ key: %{
          "version": 1
        },
          name: "version_idx",
          unique: false
        },
        %{ key: %{
          "is_active": 1
          },
          name: "is_active_idx",
          unique: false
        },
          ]
        }
      )
  end
end
