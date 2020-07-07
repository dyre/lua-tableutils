package.path = "tableutils.lua;" .. package.path
tableutils = require "tableutils"

assert(not tableutils.isTable(""), "is not table")
assert(tableutils.isTable({}), "is not table")

assert(tableutils.find(1, "hello", {"hello", "world"}), "does not contain value")
assert(not tableutils.find(3, "foo", {"hello", "world"}), "does not contain value")

assert(tableutils.subsetOf({"hello", "world"}, {"hello", "world", "foo"}, "is not subset of"))
assert(not tableutils.subsetOf({"hello", "world"}, {"hello", "foo", "world"}, "is not subset of"))
assert(not tableutils.subsetOf({"hello", "world"}, {"hello"}, "is not subset of"))

assert(tableutils.matches({"hello", "world"}, {"hello", "world"}), "table values does not equal")
x=1;y=0
assert(not tableutils.matches({"world", "hello"}, {x="hello", y="world"}), "table values does not equal")
assert(not tableutils.matches({"world", "hello"}, {"hello", "world"}), "table values does not equal")
assert(not tableutils.matches({"hello", "world"}, {"hello"}), "table values does not equal")
assert(not tableutils.matches({"hello"}, {"hello", "world"}), "table values does not equal")