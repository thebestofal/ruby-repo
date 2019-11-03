class WordProblem
    def initialize(string)
        @answer = 0
        if string.scan(/\w+/).include? 'plus'
            @answer += Integer(x)
             string.scan(/-?\d+/) do |x|
            @answer += Integer(x)
        else
            
        end
    end

    def answer 
        @answer
    end
end

