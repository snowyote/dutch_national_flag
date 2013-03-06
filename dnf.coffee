#!/usr/bin/env coffee
# stdin should contain single lines of either R, W, or B

rl = require('readline').createInterface
  input:  process.stdin
  output: process.stdout

atoms = ['R','W','B']
sort = require('./lib/sort')(atoms)

storage = []
rl.on 'line', (line) -> storage.push line if line in atoms
rl.on 'close', ->
  sort(storage)
  console.log '------------------------------------------------------------'
  console.log line for line in storage
  process.exit()
