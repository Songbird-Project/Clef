import gleam/bool
import gleam/io
import lib/types

pub fn clef_exec(_env: types.Env, options: types.Options) {
  io.println("Origin: " <> options.origin)
  io.println("Simulate: " <> bool.to_string(options.simulate))
  // command: ln
  // options: [-s]
  // dir: `options.origin`
  // target: `options.target`
}
