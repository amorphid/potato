defmodule Potato.ServerTest do
  use ExUnit.Case, async: true

  alias Potato.Server

  test "listening on a port" do
    opts        = %Server.Opts{portno: 0}
    {:ok, pid}  = Server.start_link(opts)
    {:ok, port} = Server.port(pid)
    assert is_port(port)
  end
end
