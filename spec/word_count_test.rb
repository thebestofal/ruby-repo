require_relative("../lib/word_count")
RSpec.describe WordCount do
  it("count one word") do
    phrase = Phrase.new("word")
    counts = { "word" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("count one of each word") do
    phrase = Phrase.new("one of each")
    counts = { "one" => 1, "of" => 1, "each" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("multiple occurrences of a word") do
    phrase = Phrase.new("one fish two fish red fish blue fish")
    counts = { "one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("handles cramped lists") do
    phrase = Phrase.new("one,two,three")
    counts = { "one" => 1, "two" => 1, "three" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("handles expanded lists") do
    phrase = Phrase.new("one,\ntwo,\nthree")
    counts = { "one" => 1, "two" => 1, "three" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("ignore punctuation") do
    phrase = Phrase.new("car: carpet as java: javascript!!&@$%^&")
    counts = { "car" => 1, "carpet" => 1, "as" => 1, "java" => 1, "javascript" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("include numbers") do
    phrase = Phrase.new("testing, 1, 2 testing")
    counts = { "testing" => 2, "1" => 1, "2" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("normalize case") do
    phrase = Phrase.new("go Go GO Stop stop")
    counts = { "go" => 3, "stop" => 2 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("with apostrophes") do
    phrase = Phrase.new("First: don't laugh. Then: don't cry.")
    counts = { "first" => 1, "don't" => 2, "laugh" => 1, "then" => 1, "cry" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("with quotations") do
    phrase = Phrase.new("Joe can't tell between 'large' and large.")
    counts = { "joe" => 1, "can't" => 1, "tell" => 1, "between" => 1, "large" => 2, "and" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
  it("multiple spaces not detected as a word") do
    phrase = Phrase.new(" multiple   whitespaces")
    counts = { "multiple" => 1, "whitespaces" => 1 }
    expect(phrase.word_count).to(eq(counts))
  end
end
