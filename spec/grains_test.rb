require_relative("../lib/grains")
RSpec.describe Grains do
  it("1") { expect(Grains.square(1)).to(eq(1)) }
  it("2") { expect(Grains.square(2)).to(eq(2)) }
  it("3") { expect(Grains.square(3)).to(eq(4)) }
  it("4") { expect(Grains.square(4)).to(eq(8)) }
  it("16") { expect(Grains.square(16)).to(eq(32768)) }
  it("32") { expect(Grains.square(32)).to(eq(2147483648)) }
  it("64") { expect(Grains.square(64)).to(eq(9223372036854775808)) }
  it("square 0 raises an exception") do
    expect { Grains.square(0) }.to(raise_error(ArgumentError))
  end
  it("negative square raises an exception") do
    expect { Grains.square(-1) }.to(raise_error(ArgumentError))
  end
  it("square greater than 64 raises an exception") do
    expect { Grains.square(65) }.to(raise_error(ArgumentError))
  end
  it("returns the total number of grains on the board") do
    expect(Grains.total).to(eq(18446744073709551615))
  end
end
