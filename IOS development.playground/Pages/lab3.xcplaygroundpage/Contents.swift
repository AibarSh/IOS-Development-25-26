import Cocoa

let laptop = Product( id: "p1", name: "Laptop", price: 1200.0, category: .electronics, description: "High performance laptop" )!
let book = Product( id: "p2", name: "Swift Book", price: 40.0, category: .books, description: "Learn Swift programming" )!
let headphones = Product( id: "p3", name: "Headphones", price: 150.0, category: .electronics, description: "Noise cancelling headphones" )!

let cart = ShoppingCart()
cart.addItem( product: laptop, quantity: 1 )
cart.addItem( product: book, quantity: 2 )

cart.addItem( product: laptop, quantity: 1 )
print( "Laptop quantity:", cart.items.first { $0.product.id == laptop.id }?.quantity ?? 0 )

print( "Subtotal:", cart.subtotal )
print( "Item count:", cart.itemCount )


cart.discountCode = "Save10%"
print( "Total with discount:", cart.total )


cart.removeItem( productID: book.id )
print( "Cart after removing book, item count:", cart.itemCount )



cart.addItem(product: headphones, quantity: 1)


// Verify original cart was modified
print( "Cart item count after modifyCart:", cart.itemCount )


let item1 = CartItem( product: laptop, quantity: 1 )!
var item2 = item1
item2.updateQuantity(5)
print( "item1 quantity:", item1.quantity )
print( "item2 quantity:", item2.quantity )

let address = Address( street: "Main St 123", city: "Almaty", zipCode: "050000", country: "Kazakhstan" )
let order = Order( from: cart, shippingAddress: address )

cart.clearCart()
print( "Order items count:", order.itemCount )
print( "Cart items count:", cart.itemCount )
