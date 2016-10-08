define deploy::app($opts={}) {
  class { "deploy::app::$name": opts => $opts }
}
