# Dutch National Flag sort

A famous problem given by Edsgar Dijkstra is to sort an array of red,
white and blue symbols so that all reds come together, followed by all
whites, followed finally by all blues; it's called the Dutch National
Flag problem because the Dutch flag consists of three stripes with red
at the top, blue at the bottom, and white in the middle. You are
allowed to scan through the array only once, and the only operations
permitted are to examine the color of the symbol at a given array
location and to swap the symbols at two locations.

This is c.f. Programming Praxis March 5 2013,
http://programmingpraxis.com/2013/03/05/dutch-national-flag/

----------------

### How to use

The dnf.coffee script provided in root will accept input from stdin,
filter out anything that's not an R, W, or B on a line by itself, then
output a divider and the sorted output.

### Alternatively

You can construct a general sorter via general_sort, like so:

    sort = require('sort').general_sort(['R','W','B'])

    sort(['B','W','R'])   # returns ['R','W','B']

general_sort takes one argument, a list of the expected atoms in
sorted order, and returns a function that will sort those atoms.

Note that general_sort sorts in-place to conform to Dijkstra's
specification.

### Tests

run

    cake test

for the tests.  They take a few seconds because I copped out and I'm
generating permutations to sort rather than specifying minimal test
cases.
