import gleam/result

pub fn unwrap(result: Result(Int, Nil)) {
  result.unwrap(result, 0)
}