import day_3
import gleeunit/should
import simplifile

pub fn day_3_part_1_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_3_example_part_1.txt")

  day_3.solve_part_1(input) |> should.equal(161)
}

pub fn day_3_part_1_input_test() {
  let assert Ok(input) = simplifile.read("inputs/day_3_input.txt")

  day_3.solve_part_1(input) |> should.equal(180_233_229)
}

pub fn day_3_part_2_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_3_example_part_2.txt")

  day_3.solve_part_2(input) |> should.equal(48)
}

pub fn day_3_part_2_input_test() {
  let assert Ok(input) = simplifile.read("inputs/day_3_input.txt")

  day_3.solve_part_2(input) |> should.equal(95_411_583)
}
