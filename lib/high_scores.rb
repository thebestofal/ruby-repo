class HighScores
    def initialize(scores)
        @scores_array = Array.new
        scores.each do |score|
            @scores_array.push score
        end 
    end
    def scores
        @scores_array
    end
    
    def latest
         @scores_array.last
    end
    
    def personal_best
        @scores_array.max 
    end

    def personal_top_three
        @scores_array.max(3)
    end

    def latest_is_personal_best?
        if self.personal_best == self.latest
            return true
        else return false
        end
    end
end

p = HighScores.new([30, 50, 20, 70])
#puts p.scores
#puts p.personal_top_three