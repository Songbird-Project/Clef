import envoy
import gleam/int
import gleam/result
import lib/logging

pub fn get_log_level() -> Int {
  let log_level = envoy.get("LOG_LEVEL") |> result.unwrap("")
  let log_level = case log_level {
    "" -> "0"
    _ -> log_level
  }

  case int.parse(log_level) {
    Ok(level) -> {
      case level < -1 || level > 5 {
        True -> {
          logging.log("env_err", "Invalid log level: " <> log_level)
          logging.log("env_err", "Value should be between -1 and 4.")
          logging.log("env_err", "Using default log level.")
          0
        }
        False -> {
          level
        }
      }
    }
    Error(_) -> {
      logging.log("env_err", "Invalid log level: " <> log_level)
      logging.log("env_err", "Value should be between -1 and 4.")
      logging.log("env_err", "Using default log level.")
      0
    }
  }
}

pub fn get_test(provided: Bool) -> Bool {
  let clef_test = envoy.get("CLEF_TEST") |> result.unwrap("")
  case clef_test {
    "" -> provided
    _ -> True
  }
}
