class Clock
    attr_reader :minutes
    def initialize(hour: 0, minute: 0)
      minutes_per_hour = hour * 60
      @minutes = (minutes_per_hour + minute) % 1440
    end
  
    def to_s
      Time.at(@minutes * 60).utc.strftime("%H:%M")
    end
  
    def +(other)
      @minutes = @minutes + other.minutes
      self
    end
  
    def -(other)
      @minutes = @minutes - other.minutes
      self
    end
  
    def ==(other)
      minutes == other.minutes
    end
  end