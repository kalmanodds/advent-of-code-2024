import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string

pub fn unwrap(result: Result(Int, Nil)) {
  result.unwrap(result, 0)
}

pub fn print_int_list(list: List(Int)) {
  list.map(list, int.to_string) |> string.join(", ") |> io.println()
}
