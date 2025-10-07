import glint

pub fn simulate() -> glint.Flag(Bool) {
  glint.bool_flag("simulate")
  |> glint.flag_default(False)
  |> glint.flag_help("Simulate the changes without performing them")
}

pub fn verbose() -> glint.Flag(Bool) {
  glint.bool_flag("verbose")
  |> glint.flag_default(False)
  |> glint.flag_help("Print out verbose output")
}

pub fn hardlink() -> glint.Flag(Bool) {
  glint.bool_flag("hardlink")
  |> glint.flag_default(False)
  |> glint.flag_help("Use hard links instead of symbolic links")
}

pub fn force() -> glint.Flag(Bool) {
  glint.bool_flag("force")
  |> glint.flag_default(False)
  |> glint.flag_help("Perform actions even if target files already exist")
}

pub fn origin() -> glint.Flag(String) {
  glint.string_flag("origin")
  |> glint.flag_default("~/clef")
  |> glint.flag_help("Origin of the files to be linked, can be a remote url")
}

pub fn target() -> glint.Flag(String) {
  glint.string_flag("target")
  |> glint.flag_default("~")
  |> glint.flag_help("Target directory for the files to be linked to")
}
