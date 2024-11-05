from enum import Enum

class Status(Enum):
    PENDING = "Pending"
    APPROVED = "Approved"
    REJECTED = "Rejected"

class Item:
    def __init__(self, name, status):
        self.name = name
        self.status = status

class CRUD:
    def __init__(self):
        self.items = []

    def create(self, name, status):
        item = Item(name, status)
        self.items.append(item)

    def read(self):
        for item in self.items:
            print(f"Name: {item.name}, Status: {item.status.value}")

    def update(self, name, new_status):
        for item in self.items:
            if item.name == name:
                item.status = new_status
                break

    def delete(self, name):
        self.items = [item for item in self.items if item.name != name]

# Contoh penggunaan
crud = CRUD()
crud.create("Item 1", Status.PENDING)
crud.create("Item 2", Status.APPROVED)

print("After creation:")
crud.read()

crud.update("Item 1", Status.APPROVED)
print("\nAfter update:")
crud.read()

crud.delete("Item 2")
print("\nAfter deletion:")
crud.read()
