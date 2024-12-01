import simplifile
import day_1
import gleeunit/should

pub fn day_1_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_1_example.txt")

  day_1.solve_part_1(input) |> should.equal(11)
}

pub fn day_1_input_test() {
  let assert Ok(input) = simplifile.read("inputs/day_1_input.txt")

  day_1.solve_part_1(input) |> should.equal(1765812)
}

pub fn day_1_part_2_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_1_example.txt")

  day_1.solve_part_2(input) |> should.equal(31)
}

pub fn day_1_part_2_input_test() {
  let assert Ok(input) = simplifile.read("inputs/day_1_input.txt")

  day_1.solve_part_2(input) |> should.equal(20520794)
}