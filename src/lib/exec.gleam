import gleam/io
import lib/types

pub fn clef_exec(_env: types.Env, options: types.Options) {
  io.println(options.origin)
}
