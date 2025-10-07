pub type Env {
  Env(log_level: Int)
}

pub type Options {
  Options(
    simulate: Bool,
    verbose: Bool,
    hardlink: Bool,
    force: Bool,
    origin: String,
    target: String,
  )
}
