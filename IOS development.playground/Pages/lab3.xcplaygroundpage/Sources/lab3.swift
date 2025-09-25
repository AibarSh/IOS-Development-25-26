import Cocoa

struct Product{
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    enum Category: String{
        case electronics
        case books
        case clothing
        case food
    }
    
    var displayPrice: String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        return numberFormatter.string(from: NSNumber(value: price))!
    }
    
    init?(id: String, name: String, price: Double, category: Category, description: String) {
        guard price > 0 else {return nil}
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}

struct CartItem{
    let product: Product
    var quantity: Int
    
    var subtotal: Double{
        return product.price * Double(quantity)
    }
    
    init?(product: Product, quantity: Int) {
        guard quantity > 0 else {return nil}
        self.product = product
        self.quantity = quantity
    }
    
    mutating func updateQuantity(_ newQuantity: Int){
        guard newQuantity > 0 else {return}
        self.quantity = newQuantity
    }
    
    mutating func increaseQuantity(by amount: Int){
        guard amount > 0 else {return}
        self.quantity += amount
    }
}

class ShoppingCart{
    private(set) var items: [CartItem] = []
    var discountCode: String? = nil
    
    init() {
        self.items = []
        self.discountCode = nil
    }
    
    func addItem(product: Product, quantity: Int = 1){
        if let index = items.firstIndex(where: {$0.product.id == product.id}){
            items[index].increaseQuantity(by: quantity)
        }
        else{
            let newItem = CartItem(product: product, quantity: quantity)!
            items.append(newItem)
        }
    }
    
    func removeItem(productID: String){
        items.removeAll { $0.product.id == productID }
    }
    
    func updateItemQuantity(productID: String, quantity: Int){
        if let index = items.firstIndex(where: {$0.product.id == productID}){
            if quantity > 0{
                items[index].updateQuantity(quantity)
            }
            else {
                removeItem(productID:productID)
            }
        }
    }
    
    func clearCart(){
        items.removeAll()
    }
    
    var subtotal: Double{
        var sum: Double = 0;
        for item in items{
            sum += item.product.price * Double(item.quantity)
        }
        return sum
    }
    
    var discountAmmount: Double{
        if discountCode == "Save10%"{
            return 0.9
        }
        else if discountCode == "Save20%"{
            return 0.8
        }
        else if discountCode == "Save30%"{
            return 0.7
        }
        else if discountCode == "Save50%"{
            return 0.5
        }
        else {return 1.0}
    }
    
    var total: Double{
        return subtotal * discountAmmount
    }
    
    var itemCount: Int{
        var counter: Int = 0;
        for item in items{
            counter += item.quantity
        }
        return counter
    }
    
    var isEmpty: Bool{
        if items.isEmpty{
            return true
        }
        else{
            return false
        }
    }
}

struct Address{
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String{
        return "Address: \(country), \(city), \(zipCode), \(street)"
    }
}

struct Order{
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    var itemCount: Int {
        var count: Int = 0
        for item in items {
            count += item.quantity
        }
        return count
    }
}
