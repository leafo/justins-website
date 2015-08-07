
sitegen = require "sitegen"

tools = require "sitegen.tools"


sitegen.create =>
  add_renderer "sitegen.renderers.lapis"

  @title = "Justin Keenan"
  @url = "http://justin.net"
  @template = "web"

  scssphp = tools.system_command "pscss < %s > %s", "css"
  coffeescript = tools.system_command "coffee -c -s < %s > %s", "js"

  -- build coffeescript, "main.coffee"
  build scssphp, "style.scss", "style.css"

  add "index.moon"

