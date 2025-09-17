import gleam/io
import gleam/string

pub fn log(kind: String, msg: String) -> Nil {
  io.println("[" <> string.uppercase(kind) <> "]: " <> msg)
}
