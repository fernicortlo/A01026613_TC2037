# Activity 2.2 - Elixir
# Created by Maria Fernanda Cortés Lozano and Arantza Parra

defmodule ActTest do
  use ExUnit.Case



  # test "insert_everywhere" do
  #   assert Act.insert_everywhere(1, []) == []
  #   assert Act.insert_everywhere(1, [2]) == [[1, 2], [2, 1]]
  #   assert Act.insert_everywhere(1, [2, 3]) == [[1, 2, 3], [2, 1, 3], [2, 3, 1]]
  #   assert Act.insert_everywhere(1, [2, 3, 4]) == [[1, 2, 3, 4], [2, 1, 3, 4], [2, 3, 1, 4], [2, 3, 4, 1]]
  # end

  # test "pack" do
  #    assert Act.pack([]) == []
  #    assert Act.pack([:a]) == [[:a]]

  #    assert Act.pack([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
  #             [[:a, :a, :a, :a], [:b], [:c, :c], [:a, :a], [:d], [:e, :e, :e, :e]]

  #    assert Act.pack([1, 2, 3, 4, 5]) == [[1], [2], [3], [4], [5]]
  #    assert Act.pack([9, 9, 9, 9, 9]) == [[9, 9, 9, 9, 9]]
  #  end

  #  test "insert" do
  #    assert Act.insert([], 14) == [14]
  #    assert Act.insert([5, 6, 7, 8], 4) == [4, 5, 6, 7, 8]
  #    assert Act.insert([1, 3, 6, 7, 9, 16], 5) == [1, 3, 5, 6, 7, 9, 16]
  #    assert Act.insert([1, 5, 6], 10) == [1, 5, 6, 10]
  #  end

   test "rotate_left" do
     assert Act.rotate_left([], 5) == []
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 0) == [:a, :b, :c, :d, :e, :f, :g]
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 1) == [:b, :c, :d, :e, :f, :g, :a]
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], -1) == [:g, :a, :b, :c, :d, :e, :f]
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 3) == [:d, :e, :f, :g, :a, :b, :c]
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], -3) == [:e, :f, :g, :a, :b, :c, :d]
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 8) == [:b, :c, :d, :e, :f, :g, :a]
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], -8) == [:g, :a, :b, :c, :d, :e, :f]
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], 45) == [:d, :e, :f, :g, :a, :b, :c]
     assert Act.rotate_left([:a, :b, :c, :d, :e, :f, :g], -45) == [:e, :f, :g, :a, :b, :c, :d]
   end

  test "prime_factors" do
    assert Act.prime_factors(1) == []
    assert Act.prime_factors(6) == [2, 3]
    assert Act.prime_factors(96) == [2, 2, 2, 2, 2, 3]
    assert Act.prime_factors(666) == [2, 3, 3, 37]
  end

  test "gcd" do
    assert Act.gcd(0, 0) == 0
    assert Act.gcd(3, 0) == 3
    assert Act.gcd(0, 2) == 2
    assert Act.gcd(2, 2) == 2
    assert Act.gcd(10, 8) == 2
    assert Act.gcd(8, 10) == 2
    assert Act.gcd(270, 192) == 6
    assert Act.gcd(13, 7919) == 1
    assert Act.gcd(20, 16) == 4
    assert Act.gcd(54, 24) == 6
    assert Act.gcd(6307, 1995) == 7
  end

  test "encode" do
    assert Act.encode([]) == []
    assert Act.encode([:a]) == [{1, :a}]

    assert Act.encode([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) ==
             [{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}]

    assert Act.encode([1, 2, 3, 4, 5]) == [{1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}]
    assert Act.encode([9, 9, 9, 9, 9]) == [{5, 9}]

   end

end
