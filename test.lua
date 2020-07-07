package.path = "tableutils.lua;" .. package.path
tableutils = require "tableutils"

assert(not tableutils.isTable(""), "is not table")
assert(tableutils.isTable({}), "is not table")

assert(tableutils.valuesIntersect({"hello"}, {"hello"}), "found no values")
assert(tableutils.valuesIntersect({"hello"}, {"world", "hello"}), "found no values")
assert(not tableutils.valuesIntersect({"hello"}, {"world"}), "found no values")
assert(not tableutils.valuesIntersect({"hello"}, {}), "found no values")
assert(not tableutils.valuesIntersect({}, {}), "found no values")

assert(tableutils.isValuesSubsetOf({"hello", "world"}, {"hello", "world", "foo"}, "is not subset of"))
assert(tableutils.isValuesSubsetOf({"hello", "world"}, {"hello", "foo", "world"}, "is not subset of"))
assert(not tableutils.isValuesSubsetOf({"hello", "world"}, {"hello"}, "is not subset of"))

assert(tableutils.isValuesMatch({"hello", "world"}, {"hello", "world"}), "table values does not equal")
x=1;y=0
assert(not tableutils.isValuesMatch({"world", "hello"}, {x="hello", y="world"}), "table values does not equal")
assert(tableutils.isValuesMatch({"world", "hello"}, {"hello", "world"}), "table values does not equal")
assert(not tableutils.isValuesMatch({"hello", "world"}, {"hello"}), "table values does not equal")
assert(not tableutils.isValuesMatch({"hello"}, {"hello", "world"}), "table values does not equal")

assert(tableutils.keyValueExist(1, "hello", {"hello", "world"}), "does not contain value")
assert(not tableutils.keyValueExist(3, "foo", {"hello", "world"}), "does not contain value")

assert(tableutils.isKeyValueSubsetOf({"hello", "world"}, {"hello", "world", "foo"}, "is not subset of"))
assert(not tableutils.isKeyValueSubsetOf({"hello", "world"}, {"hello", "foo", "world"}, "is not subset of"))
assert(not tableutils.isKeyValueSubsetOf({"hello", "world"}, {"hello"}, "is not subset of"))

assert(tableutils.isKeyValuesMatch({"hello", "world"}, {"hello", "world"}), "table values does not equal")
x=1;y=0
assert(not tableutils.isKeyValuesMatch({"world", "hello"}, {x="hello", y="world"}), "table values does not equal")
assert(not tableutils.isKeyValuesMatch({"world", "hello"}, {"hello", "world"}), "table values does not equal")
assert(not tableutils.isKeyValuesMatch({"hello", "world"}, {"hello"}), "table values does not equal")
assert(not tableutils.isKeyValuesMatch({"hello"}, {"hello", "world"}), "table values does not equal")