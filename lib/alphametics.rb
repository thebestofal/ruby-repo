class Alphametics
   
    def self.solve(puzzle)
        letters = puzzle.scan(/[A-Z]/).uniq
        start_letters = puzzle.scan(/\b[A-Z]/).uniq
        (0..9).to_a.permutation(letters.length).each do |per|
            i = per.index(0)
            next if i && start_letters.include?(letters[i])
            sl = puzzle.tr(letters.join, per.join)
            return letters.zip(per).to_h if eval(sl) 
        end
        return {}
    end
end