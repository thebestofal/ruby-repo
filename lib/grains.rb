class Grains 
    def self.square(number)
        @array=Array.new
        if number <=0 || number > 64
            raise ArgumentError
        end
        @array[0]=1
        for i in 1..number-1
            @array[i]=@array[i-1]*2
        end
        return @array[number-1]
    end

    def self.total
        square(64)
        total=0
        for y in @array
            total+=y
        end
        return total
    end
end