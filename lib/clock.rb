class Clock
    attr_reader :hour, :minute
    def self.new(hour: "00", minute: "00")
        @hour = (hour.to_i + minute.to_i / 60) % 24
        @minute = minute % 60
        "0"*(@hour.to_s.length % 2) + @hour.to_s +
         ":" +"0"*(@minute.to_s.length % 2) + @minute.to_s
    end

    def +(other)
        @hour = hour + other.hour
        @minute = minute + other.minute
        self.new
    end
end

#Clock.new hour:8
