import argv
import glint
import lib/environment
import lib/flags

type Options {
  Options(
    log_level: Int,
    simulate: Bool,
    verbose: Bool,
    hardlink: Bool,
    force: Bool,
    origin: String,
    target: String,
  )
}

fn clef() -> glint.Command(Nil) {
  use <- glint.command_help(
    "Clef is a simple and clean dotfile manager inspired by GNU Stow.",
  )

  // Build the flag parsers
  use simulate <- glint.flag(flags.simulate())
  use verbose <- glint.flag(flags.verbose())
  use hardlink <- glint.flag(flags.hardlink())
  use force <- glint.flag(flags.force())
  use origin <- glint.flag(flags.origin())
  use target <- glint.flag(flags.target())

  // Start the command body
  use _, _, flags <- glint.command()

  let assert Ok(simulate) = simulate(flags)
  let assert Ok(verbose) = verbose(flags)
  let assert Ok(hardlink) = hardlink(flags)
  let assert Ok(force) = force(flags)
  let assert Ok(origin) = origin(flags)
  let assert Ok(target) = target(flags)

  let _options =
    Options(
      environment.get_log_level(),
      simulate,
      verbose,
      hardlink,
      force,
      origin,
      target,
    )

  Nil
}

pub fn main() -> Nil {
  glint.new()
  |> glint.with_name("clef")
  |> glint.pretty_help(glint.default_pretty_help())
  |> glint.add(at: [], do: clef())
  |> glint.run(argv.load().arguments)
}
