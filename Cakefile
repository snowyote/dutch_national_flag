{exec} = require "child_process"

REPORTER = "list"

task "test", "run tests", ->
  exec "NODE_ENV=test
    ./node_modules/.bin/mocha
    --compilers coffee:coffee-script
    --reporter #{REPORTER}
    --require coffee-script
    --require test/test_helper.coffee
    --colors
    --recursive
  ", (err, output) ->
    console.log output
    throw err if err
