module ArmstrongNumbers
    def include? number
        @output = 0
        (1 .. number.digits.count).reverse_each do |i|
            @output += ((number / 10 ** (i - 1))%10) ** number.digits.count
        end
        if @output == number 
            return true
        else 
            return false
        end
    end
    module_function :include?   
end


puts ArmstrongNumbers.include? 0
puts 153/10%10
puts 15%10