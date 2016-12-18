defmodule Potato.GenStatem do
  defmacro __using__(opts \\ []) do
    quote do
      @doc"""
      Signals to `:gen_statem` to used `handle_event` functions.

      ## Notes

      * Is a require callback for `:gen_statem`
      * Defined at compile time in `&Potato.GenStatem.__using__/1`
      * Maybe be overridden
      * For further information, please refer to [Erlang documentation](http://erlang.org/doc/man/gen_statem.html#Module:callback_mode-0).
      """
      def callback_mode() do
        :handle_event_function
      end

      @doc"""
      Signals to `:gen_statem` to used `handle_event` functions.  Defined at compile time in `&Potato.GenStatem.__using__/1`.  Maybe be overridden if termination action is desired.  For further information, please refer to [Erlang documentation](http://erlang.org/doc/man/gen_statem.html#Module:callback_mode-0).
      """
      def terminate(_,_,_) do
        :do_nothing
      end

      defoverridable [callback_mode: 0, terminate: 3]
    end
  end
end
