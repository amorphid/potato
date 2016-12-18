defmodule Potato do
  use Application
  use Org.Supervisor

  import Supervisor.Spec, warn: false

  # PUBLIC API / CLIENT

  def start(_type, _args) do
    Supervisor.start_link(children(), opts())
  end

  def start_child() do
  end

  # PRIVATE API / CLIENT

  defp children() do
    [
      manager_child(),
    ]
  end

  defp director() do
    Potato.Director
  end

  defp manager_child() do
    worker(manager(),
      [ director:         director(),
        manager:          manager(),
        supervisor_child: supervisor_child()])
  end

  defp org_chart() do
    [director: [
  end

  defp opts() do
    [strategy: :one_for_one, name: director()]
  end

  defp supervisor_child() do
    supervisor(Potato.Supervisor, [manager: manager()])
  end


end
