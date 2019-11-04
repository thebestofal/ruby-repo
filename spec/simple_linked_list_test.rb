require_relative("../lib/simple_linked_list")
RSpec.describe SimpleLinkedList do
  it("element") do
    element = Element.new(1)
    expect(element.datum).to(eq(1))
  end
  it("element can hold a different value") do
    element = Element.new(10)
    expect(element.datum).to(eq(10))
  end
  it("element next") do
    element = Element.new(1)
    expect(element.next).to(be_nil)
  end
  it("element next can be assigned to") do
    first = Element.new(1)
    second = Element.new(2)
    first.next = second
    expect(first.next).to(eq(second))
  end
  it("list push") do
    list = SimpleLinkedList.new
    element = Element.new(1)
    expect(list.push(element)).to(eq(list))
  end
  it("list pop") do
    list = SimpleLinkedList.new
    element = Element.new(1)
    list.push(element)
    expect(list.pop).to(eq(element))
  end
  it("list pop empty") do
    list = SimpleLinkedList.new
    expect(list.pop).to(be_nil)
  end
  it("list pop is last in first out") do
    list = SimpleLinkedList.new
    first = Element.new(1)
    second = Element.new(2)
    list.push(first).push(second)
    expect(list.pop).to(eq(second))
  end
  it("list empty to array") do
    list = SimpleLinkedList.new
    expect(list.to_a).to(eq([]))
  end
  it("list single to array") do
    list = SimpleLinkedList.new
    first = Element.new(1)
    list.push(first)
    expect(list.to_a).to(eq([1]))
  end
  it("list multiple to array") do
    list = SimpleLinkedList.new
    first = Element.new(1)
    second = Element.new(2)
    third = Element.new(3)
    list.push(first).push(second).push(third)
    expect(list.to_a).to(eq([3, 2, 1]))
  end
  it("list create from array") do
    array = [1, 2, 3]
    list = SimpleLinkedList.new(array)
    expect(list.to_a).to(eq([3, 2, 1]))
  end
  it("list created from array still made up of elements") do
    array = [1, 2, 3]
    list = SimpleLinkedList.new(array)
    expect(list.pop.class).to(eq(Element))
  end
  it("list from array still acts as lifo") do
    array = [1, 2, 3]
    list = SimpleLinkedList.new(array)
    element = list.pop
    expect(element.datum).to(eq(3))
  end
  it("list in place reverse!") do
    first = Element.new(1)
    second = Element.new(2)
    third = Element.new(3)
    list = SimpleLinkedList.new
    list.push(first).push(second).push(third)
    expect(list.reverse!.to_a).to(eq([1, 2, 3]))
  end
  it("list in place reverse are the same elements") do
    first = Element.new(1)
    second = Element.new(2)
    list = SimpleLinkedList.new
    list.push(first).push(second)
    list.reverse!
    expect(list.pop).to(eq(first))
    expect(list.pop).to(eq(second))
  end
  it("list reverse empty list") do
    list = SimpleLinkedList.new
    expect(list.reverse!).to(eq(list))
  end
  it("works for 1 through 10") do
    list = SimpleLinkedList.new((1..10))
    expected = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    expect(list.to_a).to(eq(expected))
  end
end
