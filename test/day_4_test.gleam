import gleeunit/should
import day_4
import simplifile

pub fn day_4_part_1_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_4_example.txt")

  day_4.solve_part_1(input) |> should.equal(1)
}