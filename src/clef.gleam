import lib/environment
import shellout

type Options {
  Options(log_level: Int)
}

pub fn main() -> Nil {
  let log_level = environment.get_log_level()

  let _options = Options(log_level)

  shellout.exit(0)
}
