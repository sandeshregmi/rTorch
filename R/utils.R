"%||%" <- function(x, y) if (is.null(x)) y else x

is_windows <- function() {
  identical(.Platform$OS.type, "windows")
}

is_unix <- function() {
  identical(.Platform$OS.type, "unix")
}

is_osx <- function() {
  Sys.info()[["sysname"]] == "Darwin"
}

is_linux <- function() {
  identical(tolower(Sys.info()[["sysname"]]), "linux")
}

is_ubuntu <- function() {
  # check /etc/lsb-release
  if (is_unix() && file.exists("/etc/lsb-release")) {
    lsbRelease <- readLines("/etc/lsb-release")
    any(grepl("Ubuntu", lsbRelease))
  } else {
    FALSE
  }
}

is_debian <- function() {
  # check /etc/os-release
  if (is_unix() && file.exists("/etc/os-release")) {
    osRelease <- readLines("/etc/os-release")
    any(grepl("Debian", osRelease))
  } else {
    FALSE
  }
}

dir_exists <- function(x) {
  utils::file_test('-d', x)
}

ensure_loaded <- function() {
  invisible(torch$`__version__`)
}

aliased <- function(path) {
  sub(Sys.getenv("HOME"), "~", path)
}


call_hook <- function(name, ...) {
  hooks <- getHook(name)
  if (!is.list(hooks))
    hooks <- list(hooks)
  response <- FALSE
  lapply(hooks, function(hook) {
    if (isTRUE(hook(...)))
      response <<- TRUE
  })
  response
}


is_rtorch_env_name <- function(default_env_name = "r-torch") {
    grep(pattern = default_env_name, reticulate::conda_list()[["name"]], value = TRUE) == "r-torch"

}
