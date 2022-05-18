defmodule Indexer.Transform.Blocks.Axon do
  @moduledoc """
  Default block transformer to be used.
  """

  alias Indexer.Transform.Blocks

  @behaviour Blocks

  @impl Blocks
  def transform(block) when is_map(block) do
    %{block| nonce: "0x0000000000000000"}
  end
end
