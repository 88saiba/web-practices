class Status
  PENDING = "Pending"
  APPROVED = "Approved"
  REJECTED = "Rejected"
end

class Item
  attr_accessor :name, :status

  def initialize(name, status)
    @name = name
    @status = status
  end
end

class CRUD
  def initialize
    @items = []
  end

  def create(name, status)
    item = Item.new(name, status)
    @items << item
  end

  def read
    @items.each do |item|
      puts "Name: #{item.name}, Status: #{item.status}"
    end
  end

  def update(name, new_status)
    @items.each do |item|
      if item.name == name
        item.status = new_status
        break
      end
    end
  end

  def delete(name)
    @items.reject! { |item| item.name == name }
  end
end

# Contoh penggunaan
crud = CRUD.new
crud.create("Item 1", Status::PENDING)
crud.create("Item 2", Status::APPROVED)

puts "After creation:"
crud.read

crud.update("Item 1", Status::APPROVED)
puts "\nAfter update:"
crud.read

crud.delete("Item 2")
puts "\nAfter deletion:"
crud.read
# test komen
