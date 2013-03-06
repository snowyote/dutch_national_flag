# 65 tests complete (8 seconds)
# lol

sort = require('../lib/sort')
gsort = sort ['R', 'W', 'B']

permutations = (list, cb) ->
  return if list.length == 0
  return cb(list) if list.length == 1
  for el,i in list
    rest = list.slice(0,i).concat list.slice(i+1)
    permutations rest, (perm) -> cb([el].concat perm)

wark = (pre) ->
  sorted = pre.split ''
  it "Should correctly sort all permutations of #{JSON.stringify sorted}", ->
    permutations sorted, (perm) ->
      expect(gsort(perm)).to.eql sorted

describe 'general_sort', ->
  it 'should sort the empty list', -> expect(gsort []).to.eql []
  for r in [0..3]
    rs = new Array(r+1).join 'R'
    for w in [0..3]
      ws = new Array(w+1).join 'W'
      for b in [0..3]
        bs = new Array(b+1).join 'B'
        wark [rs, ws, bs].join('')
