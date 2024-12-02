import gleam/int
import gleam/list
import gleam/string
import utils

pub fn solve_part_1(input: String) {
  input
  |> string.split(on: "\r\n")
  |> list.map(line_to_int_list)
  |> list.fold(0, add_safe_lines)
}

pub fn solve_part_2(input: String) {
  input
  |> string.split(on: "\r\n")
  |> list.map(line_to_int_list)
  |> list.fold(0, add_dampened_safe_lines)
}

fn line_to_int_list(line: String) {
  line
  |> string.split(on: " ")
  |> list.map(int.parse)
  |> list.map(utils.unwrap)
}

fn add_safe_lines(acc: Int, line: List(Int)) {
  case is_line_safe(line) {
    True -> acc + 1
    False -> acc
  }
}

fn add_dampened_safe_lines(acc: Int, line: List(Int)) {
  let last_index = list.length(line) - 1
  let sub_lines =
    list.range(0, last_index)
    |> list.map(remove_element(line, _))

  case sub_lines |> list.any(is_line_safe) {
    True -> acc + 1
    False -> acc
  }
}

fn remove_element(list: List(Int), index: Int) {
  let assert #(left_list, [_, ..rest]) = list.split(list, index)
  list.flatten([left_list, rest])
}

fn is_line_safe(line: List(Int)) {
  let assert [first, second, ..rest] = line

  case first == second {
    True -> False
    False -> parse_line([first, second, ..rest], first < second)
  }
}

fn parse_line(list: List(Int), is_increasing: Bool) {
  case list {
    [first, second] -> is_gradual(first, second, is_increasing)
    [first, second, ..rest] ->
      case is_gradual(first, second, is_increasing) {
        True -> parse_line([second, ..rest], is_increasing)
        False -> False
      }
    _ -> False
  }
}

fn is_gradual(first: Int, second: Int, is_increasing: Bool) {
  case first != second && first < second == is_increasing {
    False -> False
    True -> int.max(first, second) - int.min(first, second) < 4
  }
}
