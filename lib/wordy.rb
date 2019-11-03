class WordProblem
    attr_reader :string
  
    OPERATOR = {
      'plus' => '+',
      'minus' => '-',
      'multiply' => '*',
      'divided' => '/'
    }
  
    def initialize(string)
      #require 'pry';binding.pry
      @string = string
      @digits = find_digit.split.count
      #raise ArgumentError if invalid?
    end
  
    def answer
    
     result = if @digits == 2
        two_digit
      elsif @digits == 3
        three_digit
        elsif @digits < 2
          raise ArgumentError, "error" if invalid?
      end
      eval(result)
    end
  
    def find_digit
      string.gsub(/[^\d\-]/, ' ')
    end
  
    def find_operation
      operator = %w(plus minus multiply divided)
      string.split(' ').select do |word|
        operator.include?(word)
      end
    end
  
    def two_digit
      first, second = find_digit.split(' ')
      operator = OPERATOR[find_operation.first]
      [first,operator,second].join(' ')
    end
  
    def three_digit
      first, second, third = find_digit.split(' ')
      first_operator = OPERATOR[find_operation.first]
      second_operator = OPERATOR[find_operation[1]]
      [first,first_operator,second,second_operator,third].join(' ')
    end
  
    def invalid?
      @digits < 2
    end
  end