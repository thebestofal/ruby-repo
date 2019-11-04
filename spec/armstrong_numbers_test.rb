require_relative("../lib/armstrong_numbers")
RSpec.describe ArmstrongNumbers do
  it("zero is an armstrong number") do
    expect(ArmstrongNumbers.include?(0)).to(eq(true))
  end
  it("single digit numbers are armstrong numbers") do
    expect(ArmstrongNumbers.include?(5)).to(eq(true))
  end
  it("there are no 2 digit armstrong numbers") do
    expect(ArmstrongNumbers.include?(10)).to(eq(false))
  end
  it("three digit number that is an armstrong number") do
    expect(ArmstrongNumbers.include?(153)).to(eq(true))
  end
  it("three digit number that is not an armstrong number") do
    expect(ArmstrongNumbers.include?(100)).to(eq(false))
  end
  it("four digit number that is an armstrong number") do
    expect(ArmstrongNumbers.include?(9474)).to(eq(true))
  end
  it("four digit number that is not an armstrong number") do
    expect(ArmstrongNumbers.include?(9475)).to(eq(false))
  end
  it("seven digit number that is an armstrong number") do
    expect(ArmstrongNumbers.include?(9926315)).to(eq(true))
  end
  it("seven digit number that is not an armstrong number") do
    expect(ArmstrongNumbers.include?(9926314)).to(eq(false))
  end
end
