let banner = if $nu.is-interactive { true } else { false }

$env.config = {
  show_banner: $banner
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "fuzzy"
    external: {
      enable: true
      max_results: 100
      completer: "carapace"
    }
  }
}

$env.PATH = ($env.PATH | split row (char esep) | prepend /home/gab/.apps | append /usr/bin/env)