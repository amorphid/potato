defmodule Potato.Server do
  defmodule Opts do
    defstruct [:portno]
  end

  defmodule Data do
    defstruct [:port]

    # PUBLIC API / CLIENT

    def new(%Opts{} = opts) do
      %__MODULE__{port: port(opts)}
    end

    # PRIVATE API / CLIENT

    defp port(%Opts{} = opts) do
      :gen_tcp.listen(opts.portno, [:binary, active: true])
    end
  end

  use GenServer

  # PUBLIC API / CLIENT

  def start_link(%Opts{} = opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def port(server) do
    GenServer.call(server, :port)
  end

  # PUBLIC API / SERVER

  def init(%Opts{} = opts) do
    {:ok, Data.new(opts)}
  end

  def handle_call(:port, from, %Data{} = data) do
    GenServer.reply(from, data.port)
    {:noreply, data}
  end
end
