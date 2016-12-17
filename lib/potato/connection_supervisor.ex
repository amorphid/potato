defmodule Potato.ConnectionSupervisor do
  def start_link() do
    import Supervisor.Spec, warn: false
    children = []
    opts     = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end

  def start_child(accepter) do
    Supervisor.start_child(__MODULE__, accepter)
  end
end
