import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

// "../inputs/day_1_example.txt"
pub fn main() {
  let assert Ok(input) = simplifile.read("inputs/day_1_example.txt")
  solve(input) |> int.to_string |> io.print
}

pub fn solve(input: String) {
  let #(left_list, right_list) =
    string.split(input, "\r\n")
    |> list.map(line_to_tuple)
    |> list.unzip

  let assert [left_list, right_list] =
    [left_list, right_list]
    |> list.map(to_sorted_int_list)

  list.zip(left_list, right_list)
  |> list.map(tuple_difference)
  |> int.sum
}

fn line_to_tuple(line: String) {
  let assert [a, b] = string.split(line, "   ")
  #(a, b)
}

fn to_sorted_int_list(list: List(String)) {
  list
  |> list.map(int.parse)
  |> list.map(unwrap)
  |> list.sort(int.compare)
}

fn unwrap(result: Result(Int, Nil)) {
  result.unwrap(result, 0)
}

fn tuple_difference(tuple: #(Int, Int)) {
  let #(a, b) = tuple
  int.max(a, b) - int.min(a, b)
}
