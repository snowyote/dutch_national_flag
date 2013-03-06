# general_sort is O(mn), where m is the cardinality of atoms, and n is
# the cardinality of arr.  Since atoms is fixed, this means that
# general_sort of any given set of atoms is O(n).
general_sort = (atoms) -> (arr) ->

  # xchg just exchanges the two items at arr[i] and arr[j].
  xchg = (i,j) -> [arr[i], arr[j]] = [arr[j], arr[i]]

  # firsts[type] is the index of the first occurrence of type - so
  # it's actually how many of each type lower than type that we have
  # so far.  So the firsts array is monotonically increasing.  We also
  # have a phantom first at the end, which is the first element past
  # the end of the array - it makes the core loop cleaner.
  firsts = (0 for a in atoms).concat [0]

  for i in [0...arr.length] by 1
    type = atoms.lastIndexOf arr[i]
    throw new Error("#{arr[i]} isn't in #{JSON.stringify atoms}") if type == -1

    # now, for each type in descending order, we want to swap its
    # first with the first of the next higher type (with the first of
    # the phantom type being, of course, the newly scanned element).
    # This will cause the newly scanned element to 'bubble down' to
    # the first occurrence of its type.
    for j in [atoms.length...type] by -1
      xchg(firsts[j], firsts[j-1])
      firsts[j]++

  arr


module.exports = general_sort
