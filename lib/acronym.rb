class Acronym
    def self.abbreviate(string)
        acronym = ''
        words = string.split(/\W+/)
        words.each do |word|
            acronym.concat word[0].upcase
        end
        return acronym
    end
    puts abbreviate ("Something - I made up from thin  air")
end