import simplifile
import day_1
import gleeunit/should

pub fn day_1_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_1_example.txt")

  day_1.solve(input) |> should.equal(11)
}

pub fn day_1_input_test() {
  let assert Ok(input) = simplifile.read("inputs/day_1_input.txt")

  day_1.solve(input) |> should.equal(1765812)
}