class SumOfMultiples
    attr_reader :multiples
    def initialize(*multiples)
      @multiples = multiples
    end
  
    def to(limit)
      (1...limit).sum do |i|
         factor?(i) ? i : 0
      end
    end
  
    private
  
    def factor?(i)
      multiples.any? do |factor|
        (i % factor).zero?
      end
    end
  end