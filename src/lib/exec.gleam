import gleam/bool
import gleam/io
import lib/logging
import lib/types
import shellout

pub fn clef_exec(_env: types.Env, options: types.Options) {
  // command: ln
  // options: [-s]
  // dir: `options.origin`
  // target: `options.target`
  let hardlink = case options.hardlink {
    True -> ""
    False -> "-s"
  }

  let args: List(String) = [hardlink, options.origin, options.target]
  let printable_args =
    hardlink <> " " <> options.origin <> " " <> options.target

  case options.simulate {
    True -> {
      io.println("Simulation enabled, no changes will be made.")
      io.println("Command: ln " <> printable_args)
      Nil
    }
    False -> {
      link(args)
      Nil
    }
  }
}

fn link(args: List(String)) {
  let res = shellout.command(run: "ln", in: ".", opt: [], with: args)

  case res {
    Ok(_) -> 0
    Error(_) -> {
      logging.log("err", "Failed to link directories")
      1
    }
  }
}
