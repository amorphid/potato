defmodule Potato.ConnectionSupervisor do
  import Supervisor.Spec, warn: false

  # public

  def start_link() do
    children = []
    opts     = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end

  def start_child(accepter) do
    Supervisor.start_child(__MODULE__, connection_worker(accepter))
  end

  # private

  defp connection_worker(accepter) do
    worker(Potato.ConnectionWorker, [accepter])
  end
end
