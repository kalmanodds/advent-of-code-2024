import utils
import gleam/int
import gleam/list
import gleam/string

pub fn solve_part_1(input: String) {
  let horizontal_input = input
  |> string.split("\r\n")

  let vertical_input = horizontal_input
  |> list.map(string.to_graphemes)
  |> list.transpose
  |> list.map(string.join(_, ""))

  [horizontal_input, vertical_input]
  |> list.map(get_xmas_count_in_lines)
  |> list.fold(0, int.add)
}

fn get_xmas_count_in_lines(lines: List(String)) {
  lines
  |> list.map(get_xmas_count_in_line)
  |> list.fold(0, int.add)
}

fn get_xmas_count_in_line(line: String) {
  let last_index = string.length(line) - string.length("XMAS")
  list.range(0, last_index)
  |> list.map(string.drop_start(line, _))
  // |> utils.print_string_list
  |> list.filter(starts_with_xmas)
  |> list.length
}

fn starts_with_xmas(sub_line: String) {
  sub_line |> string.starts_with("XMAS") ||
  sub_line |> string.starts_with("SAMX")
}