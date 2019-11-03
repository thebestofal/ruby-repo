require_relative("../lib/clock")
RSpec.describe Clock do
  it("on the hour") { expect(Clock.new(:hour => 8).to_s).to(eq("08:00")) }
  it("past the hour") do
    expect(Clock.new(:hour => 11, :minute => 9).to_s).to(eq("11:09"))
  end
  it("midnight is zero hours") do
    expect(Clock.new(:hour => 24).to_s).to(eq("00:00"))
  end
  it("hour rolls over") { expect(Clock.new(:hour => 25).to_s).to(eq("01:00")) }
  it("hour rolls over continuously") do
    expect(Clock.new(:hour => 100).to_s).to(eq("04:00"))
  end
  it("sixty minutes is next hour") do
    expect(Clock.new(:hour => 1, :minute => 60).to_s).to(eq("02:00"))
  end
  it("minutes roll over") do
    expect(Clock.new(:minute => 160).to_s).to(eq("02:40"))
  end
  it("minutes roll over continuously") do
    expect(Clock.new(:minute => 1723).to_s).to(eq("04:43"))
  end
  it("hour and minutes roll over") do
    expect(Clock.new(:hour => 25, :minute => 160).to_s).to(eq("03:40"))
  end
  it("hour and minutes roll over continuously") do
    expect(Clock.new(:hour => 201, :minute => 3001).to_s).to(eq("11:01"))
  end
  it("hour and minutes roll over to exactly midnight") do
    expect(Clock.new(:hour => 72, :minute => 8640).to_s).to(eq("00:00"))
  end
  it("negative hour") do
    expect(Clock.new(:hour => -1, :minute => 15).to_s).to(eq("23:15"))
  end
  it("negative hour rolls over") do
    expect(Clock.new(:hour => -25).to_s).to(eq("23:00"))
  end
  it("negative hour rolls over continuously") do
    expect(Clock.new(:hour => -91).to_s).to(eq("05:00"))
  end
  it("negative minutes") do
    expect(Clock.new(:hour => 1, :minute => -40).to_s).to(eq("00:20"))
  end
  it("negative minutes roll over") do
    expect(Clock.new(:hour => 1, :minute => -160).to_s).to(eq("22:20"))
  end
  it("negative minutes roll over continuously") do
    expect(Clock.new(:hour => 1, :minute => -4820).to_s).to(eq("16:40"))
  end
  it("negative sixty minutes is previous hour") do
    expect(Clock.new(:hour => 2, :minute => -60).to_s).to(eq("01:00"))
  end
  it("negative hour and minutes both roll over") do
    expect(Clock.new(:hour => -25, :minute => -160).to_s).to(eq("20:20"))
  end
  it("negative hour and minutes both roll over continuously") do
    expect(Clock.new(:hour => -121, :minute => -5810).to_s).to(eq("22:10"))
  end
  it("add minutes") do
    clock1 = Clock.new(:hour => 10, :minute => 0)
    expect((clock1 + Clock.new(:minute => 3)).to_s).to(eq("10:03"))
  end
  it("add no minutes") do
    clock1 = Clock.new(:hour => 6, :minute => 41)
    expect((clock1 + Clock.new(:minute => 0)).to_s).to(eq("06:41"))
  end
  it("add to next hour") do
    clock1 = Clock.new(:hour => 0, :minute => 45)
    expect((clock1 + Clock.new(:minute => 40)).to_s).to(eq("01:25"))
  end
  it("add more than one hour") do
    clock1 = Clock.new(:hour => 10, :minute => 0)
    expect((clock1 + Clock.new(:minute => 61)).to_s).to(eq("11:01"))
  end
  it("add more than two hours with carry") do
    clock1 = Clock.new(:hour => 0, :minute => 45)
    expect((clock1 + Clock.new(:minute => 160)).to_s).to(eq("03:25"))
  end
  it("add across midnight") do
    clock1 = Clock.new(:hour => 23, :minute => 59)
    expect((clock1 + Clock.new(:minute => 2)).to_s).to(eq("00:01"))
  end
  it("add more than one day") do
    clock1 = Clock.new(:hour => 5, :minute => 32)
    expect((clock1 + Clock.new(:minute => 1500)).to_s).to(eq("06:32"))
  end
  it("add more than two days") do
    clock1 = Clock.new(:hour => 1, :minute => 1)
    expect((clock1 + Clock.new(:minute => 3500)).to_s).to(eq("11:21"))
  end
  it("subtract minutes") do
    clock1 = Clock.new(:hour => 10, :minute => 3)
    expect((clock1 - Clock.new(:minute => 3)).to_s).to(eq("10:00"))
  end
  it("subtract to previous hour") do
    clock1 = Clock.new(:hour => 10, :minute => 3)
    expect((clock1 - Clock.new(:minute => 30)).to_s).to(eq("09:33"))
  end
  it("subtract more than an hour") do
    clock1 = Clock.new(:hour => 10, :minute => 3)
    expect((clock1 - Clock.new(:minute => 70)).to_s).to(eq("08:53"))
  end
  it("subtract across midnight") do
    clock1 = Clock.new(:hour => 0, :minute => 3)
    expect((clock1 - Clock.new(:minute => 4)).to_s).to(eq("23:59"))
  end
  it("subtract more than two hours") do
    clock1 = Clock.new(:hour => 0, :minute => 0)
    expect((clock1 - Clock.new(:minute => 160)).to_s).to(eq("21:20"))
  end
  it("subtract more than two hours with borrow") do
    clock1 = Clock.new(:hour => 6, :minute => 15)
    expect((clock1 - Clock.new(:minute => 160)).to_s).to(eq("03:35"))
  end
  it("subtract more than one day") do
    clock1 = Clock.new(:hour => 5, :minute => 32)
    expect((clock1 - Clock.new(:minute => 1500)).to_s).to(eq("04:32"))
  end
  it("subtract more than two days") do
    clock1 = Clock.new(:hour => 2, :minute => 20)
    expect((clock1 - Clock.new(:minute => 3000)).to_s).to(eq("00:20"))
  end
  it("clocks with same time") do
    clock1 = Clock.new(:hour => 15, :minute => 37)
    clock2 = Clock.new(:hour => 15, :minute => 37)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks a minute apart") do
    clock1 = Clock.new(:hour => 15, :minute => 36)
    clock2 = Clock.new(:hour => 15, :minute => 37)
    expect((clock1 == clock2)).to(be_falsey)
  end
  it("clocks an hour apart") do
    clock1 = Clock.new(:hour => 14, :minute => 37)
    clock2 = Clock.new(:hour => 15, :minute => 37)
    expect((clock1 == clock2)).to(be_falsey)
  end
  it("clocks with hour overflow") do
    clock1 = Clock.new(:hour => 10, :minute => 37)
    clock2 = Clock.new(:hour => 34, :minute => 37)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with hour overflow by several days") do
    clock1 = Clock.new(:hour => 3, :minute => 11)
    clock2 = Clock.new(:hour => 99, :minute => 11)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with negative hour") do
    clock1 = Clock.new(:hour => 22, :minute => 40)
    clock2 = Clock.new(:hour => -2, :minute => 40)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with negative hour that wraps") do
    clock1 = Clock.new(:hour => 17, :minute => 3)
    clock2 = Clock.new(:hour => -31, :minute => 3)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with negative hour that wraps multiple times") do
    clock1 = Clock.new(:hour => 13, :minute => 49)
    clock2 = Clock.new(:hour => -83, :minute => 49)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with minute overflow") do
    clock1 = Clock.new(:hour => 0, :minute => 1)
    clock2 = Clock.new(:hour => 0, :minute => 1441)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with minute overflow by several days") do
    clock1 = Clock.new(:hour => 2, :minute => 2)
    clock2 = Clock.new(:hour => 2, :minute => 4322)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with negative minute") do
    clock1 = Clock.new(:hour => 2, :minute => 40)
    clock2 = Clock.new(:hour => 3, :minute => -20)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with negative minute that wraps") do
    clock1 = Clock.new(:hour => 4, :minute => 10)
    clock2 = Clock.new(:hour => 5, :minute => -1490)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with negative minute that wraps multiple times") do
    clock1 = Clock.new(:hour => 6, :minute => 15)
    clock2 = Clock.new(:hour => 6, :minute => -4305)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with negative hours and minutes") do
    clock1 = Clock.new(:hour => 7, :minute => 32)
    clock2 = Clock.new(:hour => -12, :minute => -268)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("clocks with negative hours and minutes that wrap") do
    clock1 = Clock.new(:hour => 18, :minute => 7)
    clock2 = Clock.new(:hour => -54, :minute => -11513)
    expect((clock1 == clock2)).to(be_truthy)
  end
  it("full clock and zeroed clock") do
    clock1 = Clock.new(:hour => 24, :minute => 0)
    clock2 = Clock.new(:hour => 0, :minute => 0)
    expect((clock1 == clock2)).to(be_truthy)
  end
end
