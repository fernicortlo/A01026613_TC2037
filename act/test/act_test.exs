# Activity 2.2 - Elixir
# Created by Maria Fernanda Cortés Lozano and Arantza Parra

defmodule ActTest do
  use ExUnit.Case

  test "test insert_everywhere" do
    assert act.insert_everywhere(1, []) == []
    assert act.insert_everywhere(1, [2]) == [[1, 2], [2, 1]]
    assert act.insert_everywhere(1, [2, 3]) == [[1, 2, 3], [2, 1, 3], [2, 3, 1]]
    assert act.insert_everywhere(1, [2, 3, 4]) == [[1, 2, 3, 4], [2, 1, 3, 4], [2, 3, 1, 4], [2, 3, 4, 1]]
  end

  test "test pack" do
    assert act.pack([]) == []
    assert act.pack([:a]) == [[:a]]

    assert act.pack([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
             [[:a, :a, :a, :a], [:b], [:c, :c], [:a, :a], [:d], [:e, :e, :e, :e]]

    assert act.pack([1, 2, 3, 4, 5]) == [[1], [2], [3], [4], [5]]
    assert act.pack([9, 9, 9, 9, 9]) == [[9, 9, 9, 9, 9]]
  end

  test "test insert" do
    assert act.insert([], 14) == [14]
    assert act.insert([5, 6, 7, 8], 4) == [4, 5, 6, 7, 8]
    assert act.insert([1, 3, 6, 7, 9, 16], 5) == [1, 3, 5, 6, 7, 9, 16]
    assert act.insert([1, 5, 6], 10) == [1, 5, 6, 10]
  end

  test "test rotate_left" do
    assert act.rotate_left([], 5) == []
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 0) == [:a, :b, :c, :d, :e, :f, :g]
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 1) == [:b, :c, :d, :e, :f, :g, :a]
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], -1) == [:g, :a, :b, :c, :d, :e, :f]
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 3) == [:d, :e, :f, :g, :a, :b, :c]
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], -3) == [:e, :f, :g, :a, :b, :c, :d]
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 8) == [:b, :c, :d, :e, :f, :g, :a]
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], -8) == [:g, :a, :b, :c, :d, :e, :f]
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 45) == [:d, :e, :f, :g, :a, :b, :c]
    assert act.rotate_left([:a, :b, :c, :d, :e, :f, :g], -45) == [:e, :f, :g, :a, :b, :c, :d]
  end

  test "test prime_factors" do
    assert act.prime_factors(1) == []
    assert act.prime_factors(6) == [2, 3]
    assert act.prime_factors(96) == [2, 2, 2, 2, 2, 3]
    assert act.prime_factors(666) == [2, 3, 3, 37]
  end

  test "test gcd" do
    assert act.gcd(0, 0) == 0
    assert act.gcd(3, 0) == 3
    assert act.gcd(0, 2) == 2
    assert act.gcd(2, 2) == 2
    assert act.gcd(10, 8) == 2
    assert act.gcd(8, 10) == 2
    assert act.gcd(270, 192) == 6
    assert act.gcd(13, 7919) == 1
    assert act.gcd(20, 16) == 4
    assert act.gcd(54, 24) == 6
    assert act.gcd(6307, 1995) == 7
  end

  test "test encode" do
    assert Ariel2.encode([]) == []
    assert Ariel2.encode([:a]) == [{1, :a}]

    assert Ariel2.encode([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
             [{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}]

    assert Ariel2.encode([1, 2, 3, 4, 5]) == [{1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}]
    assert Ariel2.encode([9, 9, 9, 9, 9]) == [{5, 9}]

  end

end
