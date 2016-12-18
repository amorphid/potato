defmodule Potato.Coordinator do
  use Potato.GenStatem

  defstruct [:director]

  # PUBLIC / CLIENT API

  def start_link() do
    gen_statem(, __MODULE__, [super: self], [])
  end

  # PUBLIC / SERVER API

  def init(opts) do
    {:ok, :idle, init_data(opts), init_action()}
  end

  def handle_event(:cast, :start, :idle, data) do
    {:next_state, :starting, data}
  end

  # PRIVATE API / CLIENT

  def gen_statem(name, module, init_opts, opts) do

  end

  # PRIVATE API / SERVER

  defp init_action() do
    {:next_event, :cast, :start}
  end

  defp init_data(director: director) do
    %__MODULE__{director: director}
  end
end
