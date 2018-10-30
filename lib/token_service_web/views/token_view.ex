defmodule TokenServiceWeb.TokenView do

  def render("tokens.json", %{tokens: tokens}) do
    %{
      message: "list tokens",
      timestamp: :os.system_time(:seconds),
      items: tokens
    }
  end

  def render("token.json", %{token: token}) do
    %{
      message: "token",
      timestamp: :os.system_time(:seconds),
      name: token[:name],
      symbol: token[:symbol],
      type: token[:type],
      description: token[:description],
      logo: token[:logo],
      platform: token[:platform],
      license: token[:license],
      release_date: token[:release_data],
      supports_languages: token[:supports_languages],
      full_name: token[:full_name],
      contract_address: token[:contract_address],
      total_coin_supply: token[:total_coin_supply],
      algorithm: token[:algorithm],
      proof_type: token[:proof_type]
    }
  end

end
