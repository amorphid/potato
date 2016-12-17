# Potato

Potato is an HTTP Server written in Elixir.  Why is it called potato? Because...  um...  I stared it on a Friday night, I'm fried, anything fried goes with ketchup, I'm about to put ketchup on my hash browns, and my hash browns used to be a potato (probably many potatoes, but Potatoes is a dumb name for an HTTP server).

## First whack description

I won't be able to write a complete web server in one night, at least not something that parses HTTP requests, but maybe I can write something that listens on a port, accepts TCP connection requests, accepts a string, and replies.  The phrase "Pucker up buttercup.  " will be prepended to any string.  That makes as much sense as naming this Potato.

## First whack issues

* TCP Connections will be opened and closed on each request, which is inefficient, and using a GenServer for this purpose is totes overkill
* Code won't have meaningful comments tests or comments, as I don't understand the problem well enough to know how to test TCP ports
* Receiving messages with variable length using `:gen_tcp.recv(socket, 0)` and  messages longer than that wouldn't be handled correctly

## First whack to-dos

* Decide how ConnectionSupervisor is called
