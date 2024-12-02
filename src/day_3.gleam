import gleam/int
import gleam/list
import gleam/regexp
import utils

pub fn solve_part_1(input: String) {
  input
  |> get_mul_statements()
  |> list.map(get_number_pairs)
  |> list.map(list.fold(_, 1, int.multiply))
  |> list.fold(0, int.add)
}

fn get_mul_statements(input: String) {
  let assert Ok(regex) = regexp.from_string("mul\\(\\d{1,3},\\d{1,3}\\)")
  regexp.scan(regex, input)
  |> list.map(fn(match) { match.content })
}

fn get_number_pairs(mul_statement: String) {
  let assert Ok(regex) = regexp.from_string("\\d{1,3}")
  regexp.scan(regex, mul_statement)
  |> list.map(fn(match) { match.content })
  |> list.map(int.parse)
  |> list.map(utils.unwrap)
}
