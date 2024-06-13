defmodule DemoWeb.PageController do
  use DemoWeb, :controller

  def demo(conn, params) do
    conn =
      case params["flash"] do
        nil ->
          conn

        ["info"] ->
          put_flash(conn, :info, "This is an info flash.")

        ["info", "error"] ->
          conn
          |> put_flash(:info, "This is an info flash.")
          |> put_flash(:error, "This is an error flash.")
      end

    render(conn)
  end
end
