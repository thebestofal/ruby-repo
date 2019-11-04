require_relative("../lib/wordy")
RSpec.describe WordProblem do
  it("addition") do
    problem = WordProblem.new("What is 1 plus 1?")
    expect(problem.answer).to(eq(2))
  end
  it("more addition") do
    problem = WordProblem.new("What is 53 plus 2?")
    expect(problem.answer).to(eq(55))
  end
  it("addition with negative numbers") do
    problem = WordProblem.new("What is -1 plus -10?")
    expect(problem.answer).to(eq(-11))
  end
  it("large addition") do
    problem = WordProblem.new("What is 123 plus 45678?")
    expect(problem.answer).to(eq(45801))
  end
  it("subtraction") do
    problem = WordProblem.new("What is 4 minus -12?")
    expect(problem.answer).to(eq(16))
  end
  it("multiplication") do
    problem = WordProblem.new("What is -3 multiplied by 25?")
    expect(problem.answer).to(eq(-75))
  end
  it("division") do
    problem = WordProblem.new("What is 33 divided by -3?")
    expect(problem.answer).to(eq(-11))
  end
  it("multiple additions") do
    problem = WordProblem.new("What is 1 plus 1 plus 1?")
    expect(problem.answer).to(eq(3))
  end
  it("addition and subtraction") do
    problem = WordProblem.new("What is 1 plus 5 minus -2?")
    expect(problem.answer).to(eq(8))
  end
  it("multiple subtraction") do
    problem = WordProblem.new("What is 20 minus 4 minus 13?")
    expect(problem.answer).to(eq(3))
  end
  it("subtraction then addition") do
    problem = WordProblem.new("What is 17 minus 6 plus 3?")
    expect(problem.answer).to(eq(14))
  end
  it("multiple multiplication") do
    problem = WordProblem.new("What is 2 multiplied by -2 multiplied by 3?")
    expect(problem.answer).to(eq(-12))
  end
  it("addition and multiplication") do
    problem = WordProblem.new("What is -3 plus 7 multiplied by -2?")
    message = "You should ignore order of precedence. -3 + 7 * -2 = -8, not #{problem.answer}"
    expect(problem.answer).to(eq(-8))
  end
  it("multiple division") do
    problem = WordProblem.new("What is -12 divided by 2 divided by -3?")
    expect(problem.answer).to(eq(2))
  end
end
