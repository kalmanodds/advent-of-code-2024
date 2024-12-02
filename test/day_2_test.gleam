import day_2
import gleeunit/should
import simplifile

pub fn day_2_part_1_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_2_example.txt")

  day_2.solve_part_1(input) |> should.equal(2)
}

pub fn day_2_part_1_input_test() {
  let assert Ok(input) = simplifile.read("inputs/day_2_input.txt")

  day_2.solve_part_1(input) |> should.equal(549)
}

pub fn day_2_part_2_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_2_example.txt")

  day_2.solve_part_2(input) |> should.equal(4)
}

pub fn day_2_part_2_input_test() {
  let assert Ok(input) = simplifile.read("inputs/day_2_input.txt")

  day_2.solve_part_2(input) |> should.equal(589)
}
