import Cocoa

public struct Product{
    public let id: String
    public let name: String
    public let price: Double
    public let category: Category
    public let description: String
    
    public enum Category: String{
        case electronics
        case books
        case clothing
        case food
    }
    
    public var displayPrice: String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        return numberFormatter.string(from: NSNumber(value: price))!
    }
    
    public init?(id: String, name: String, price: Double, category: Category, description: String) {
        guard price > 0 else {return nil}
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}

public struct CartItem{
    public let product: Product
    public private(set) var quantity: Int
    
    public var subtotal: Double{
        return product.price * Double(quantity)
    }
    
    public init?(product: Product, quantity: Int) {
        guard quantity > 0 else {return nil}
        self.product = product
        self.quantity = quantity
    }
    
    public mutating func updateQuantity(_ newQuantity: Int){
        guard newQuantity > 0 else {return}
        self.quantity = newQuantity
    }
    
    public mutating func increaseQuantity(by amount: Int){
        guard amount > 0 else {return}
        self.quantity += amount
    }
}

public class ShoppingCart{
    public private(set) var items: [CartItem] = []
    public var discountCode: String? = nil
    
    public init() {
        self.items = []
        self.discountCode = nil
    }
    
    public func addItem(product: Product, quantity: Int = 1){
        if let index = items.firstIndex(where: {$0.product.id == product.id}){
            items[index].increaseQuantity(by: quantity)
        }
        else{
            let newItem = CartItem(product: product, quantity: quantity)!
            items.append(newItem)
        }
    }
    
    public func removeItem(productID: String){
        items.removeAll { $0.product.id == productID }
    }
    
    public func updateItemQuantity(productID: String, quantity: Int){
        if let index = items.firstIndex(where: {$0.product.id == productID}){
            if quantity > 0{
                items[index].updateQuantity(quantity)
            }
            else {
                removeItem(productID:productID)
            }
        }
    }
    
    public func clearCart(){
        items.removeAll()
    }
    
    public var subtotal: Double{
        var sum: Double = 0;
        for item in items{
            sum += item.product.price * Double(item.quantity)
        }
        return sum
    }
    
    public var discountAmmount: Double{
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
    
    public var total: Double{
        return subtotal * discountAmmount
    }
    
    public var itemCount: Int{
        var counter: Int = 0;
        for item in items{
            counter += item.quantity
        }
        return counter
    }
    
    public var isEmpty: Bool{
        if items.isEmpty{
            return true
        }
        else{
            return false
        }
    }
}

public struct Address{
    public let street: String
    public let city: String
    public let zipCode: String
    public let country: String
    
    public init(street: String, city: String, zipCode: String, country: String) {
        self.street = street
        self.city = city
        self.zipCode = zipCode
        self.country = country
    }
    
    public var formattedAddress: String{
        return "Address: \(country), \(city), \(zipCode), \(street)"
    }
}

public struct Order{
    public let orderId: String
    public let items: [CartItem]
    public let subtotal: Double
    public let discountAmount: Double
    public let total: Double
    public let timestamp: Date
    public let shippingAddress: Address
    
    public init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    public var itemCount: Int {
        var count: Int = 0
        for item in items {
            count += item.quantity
        }
        return count
    }
}
