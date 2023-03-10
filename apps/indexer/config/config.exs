# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
import Config

block_transformers = %{
  "clique" => Indexer.Transform.Blocks.Clique,
  "base" => Indexer.Transform.Blocks.Base,
  "axon" => Indexer.Transform.Blocks.Axon
}

# Compile time environment variable access requires recompilation.
configured_transformer = System.get_env("BLOCK_TRANSFORMER") || "base"

block_transformer =
  case Map.get(block_transformers, configured_transformer) do
    nil ->
      raise """
      No such block transformer: #{configured_transformer}.

      Valid values are:
      #{Enum.join(Map.keys(block_transformers), "\n")}

      Please update environment variable BLOCK_TRANSFORMER accordingly.
      """

    transformer ->
      transformer
  end

config :indexer,
  ecto_repos: [Explorer.Repo]

# config :indexer, Indexer.Fetcher.ReplacedTransaction.Supervisor, disabled?: true

config :indexer, Indexer.Tracer,
  service: :indexer,
  adapter: SpandexDatadog.Adapter,
  trace_key: :blockscout

config :indexer, Indexer.Block.Catchup.MissingRangesCollector, future_check_interval: :timer.minutes(1)

config :logger, :indexer,
  # keep synced with `config/config.exs`
  format: "$dateT$time $metadata[$level] $message\n",
  metadata:
    ~w(application fetcher request_id first_block_number last_block_number missing_block_range_count missing_block_count
       block_number step count error_count shrunk import_id transaction_id)a,
  metadata_filter: [application: :indexer]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
