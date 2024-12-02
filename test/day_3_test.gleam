import day_3
import gleeunit/should
import simplifile

pub fn day_3_part_1_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_3_example.txt")

  day_3.solve_part_1(input) |> should.equal(161)
}

pub fn day_3_part_1_input_test() {
  let assert Ok(input) = simplifile.read("inputs/day_3_input.txt")

  day_3.solve_part_1(input) |> should.equal(180_233_229)
}
