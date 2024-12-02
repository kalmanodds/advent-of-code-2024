import gleam/int
import gleam/list
import gleam/string
import utils

pub fn solve_part_1(input: String) {
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

pub fn solve_part_2(input: String) {
  let #(left_list, right_list) =
    string.split(input, "\r\n")
    |> list.map(line_to_tuple)
    |> list.unzip

  let assert [left_list, right_list] =
    [left_list, right_list]
    |> list.map(to_int_list)

  left_list
  |> list.map(fn(x) { x * occurrences(x, right_list) })
  |> int.sum
}

fn line_to_tuple(line: String) {
  let assert [a, b] = string.split(line, "   ")
  #(a, b)
}

fn to_sorted_int_list(list: List(String)) {
  list
  |> to_int_list 
  |> list.sort(int.compare)
}

fn to_int_list(list: List(String)) {
  list
  |> list.map(int.parse)
  |> list.map(utils.unwrap)
}

fn tuple_difference(tuple: #(Int, Int)) {
  let #(a, b) = tuple
  int.max(a, b) - int.min(a, b)
}

fn occurrences(element: Int, list: List(Int)) {
  list
  |> list.filter(fn (x) { x == element })
  |> list.length
}
