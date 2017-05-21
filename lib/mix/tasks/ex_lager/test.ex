defmodule Mix.Tasks.ExlagerUnit.Test do
  def run(args) do
    path = "test/dummy"
    IO.puts("\nRunning tests for dummy app in 'test/dummy'\n")
    :ok = File.cd(path)
    args = ["test", "--color"] ++ args

    :ok = case System.cmd("mix", args) do
      {str, _exit_code} ->
        IO.puts(str)
    end
  end
end
