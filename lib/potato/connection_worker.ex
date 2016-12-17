defmodule Potato.ConnectionWorker do
  use GenServer

  defstruct [:accepter]

  def start_link(accepter) do
    GenServer.start_link(__MODULE__, [%__MODULE__{accepter: accepter}])
  end

  def init(%__MODULE__{} = state) do
    {:ok, connection} = state.accepter.accept()
    {:ok, message }   = :gen_tcp.recv(connection, 0)
    response          = "Pucker up, buttercup.  " <> message
    :ok               = :gen_tcp.send(connection, response)
    :ok               = :gen_tcp.close(connection)
    :ignore
  end
end
