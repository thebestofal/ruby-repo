class Palindromes
    attr_reader :smallest, :largest
  
    def initialize(min_factor: 1, max_factor: 100)
      @min_factor = min_factor
      @max_factor = max_factor
    end
  
    def generate
      min, max = (min_factor..max_factor).to_a.repeated_combination(2)
        .map { |x,y| x * y }
        .select { |x| x.to_s == x.to_s.reverse }
        .minmax
  
      @smallest = Palindrome.new(min, factors(min))
      @largest  = Palindrome.new(max, factors(max))
    end
  
    private
      attr_reader :min_factor, :max_factor
      def factors(value)
        (min_factor..max_factor).to_a.repeated_combination(2).select do |x, y|
          x * y == value
        end
      end
  end
  
  class Palindrome
    attr_reader :value, :factors
  
    def initialize(value, factors)
      @value = value
      @factors = factors
    end
  end