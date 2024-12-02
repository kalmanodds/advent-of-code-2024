import gleeunit/should
import day_2
import simplifile

pub fn day_2_example_test() {
  let assert Ok(input) = simplifile.read("inputs/day_2_example.txt")

  day_2.solve_part_1(input) |> should.equal(2)
}