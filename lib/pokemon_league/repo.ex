defmodule PokemonLeague.Repo do
  use Ecto.Repo,
    otp_app: :pokemon_league,
    adapter: Ecto.Adapters.Postgres
end
