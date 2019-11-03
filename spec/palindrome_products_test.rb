require_relative("../lib/palindrome_products")
RSpec.describe Palindromes do
  it("largest palindrome from single digit factors") do
    palindromes = Palindromes.new(:max_factor => 9)
    palindromes.generate
    largest = palindromes.largest
    expect(largest.value).to(eq(9))
    assert_includes([[[3, 3], [1, 9]], [[1, 9], [3, 3]]], largest.factors)
  end
  it("largest palindrome from double digit factors") do
    palindromes = Palindromes.new(:max_factor => 99, :min_factor => 10)
    palindromes.generate
    largest = palindromes.largest
    expect(largest.value).to(eq(9009))
    expect(largest.factors).to(eq([[91, 99]]))
  end
  it("smallest palindrome from double digit factors") do
    palindromes = Palindromes.new(:max_factor => 99, :min_factor => 10)
    palindromes.generate
    smallest = palindromes.smallest
    expect(smallest.value).to(eq(121))
    expect(smallest.factors).to(eq([[11, 11]]))
  end
  it("largest palindrome from triple digit factors") do
    palindromes = Palindromes.new(:max_factor => 999, :min_factor => 100)
    palindromes.generate
    largest = palindromes.largest
    expect(largest.value).to(eq(906609))
    expect(largest.factors).to(eq([[913, 993]]))
  end
  it("smallest palindrome from triple digit factors") do
    palindromes = Palindromes.new(:max_factor => 999, :min_factor => 100)
    palindromes.generate
    smallest = palindromes.smallest
    expect(smallest.value).to(eq(10201))
    expect(smallest.factors).to(eq([[101, 101]]))
  end
end
