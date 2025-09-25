import Cocoa

print("Task 1")
// Problem 1 Fizzbuzz
for i in 1 ... 100{
    if i % 5 == 0 && i % 3 == 0 {print("Fizzbuzz")}
    else if i % 5 == 0 {print("Fizz")}
    else if i % 3 == 0 {print("Buzz")}
    else {print(i)}
}
print(String(repeating: "-", count: 30))
print("Task 2")
// Problem 2 isPrime

func isPrime(_ input: Int) -> Void {
    if (input <= 1) {
        print("\(input) not prime")
        return
    }
    if (input == 2) {
        print("\(input) is prime")
        return
    }
    if (input > 2) {
        for i in 2..<input+1 {
            if (input % i == 0 && i != input) {
                print("\(input) not prime")
                return
            }
            else if (input % 3 == 0 && input > 3){
                print("\(input) not prime")
                return
            }
            else if (input % 5 == 0 && input > 5){
                print("\(input) not prime")
                return
            }
            else {
                print("\(input) is prime")
                return
            }
        }
    }
}
for i in 1...100{
    isPrime(i)
}

print(String(repeating: "-", count: 30))
print("Task 3")

func tempConverter(input: Double, currentSystem: Character,convertTo: Character) -> Void {
    if currentSystem == "C" {
        if convertTo == "F" {
            print("From C to F: ",input * 9.0 / 5.0 + 32.0)
        }
        else if convertTo == "K" {
            print("From C to K: ",input + 273.15)
        }
        else{
            print("Wrong convert system input!")
        }
    }
    
    else if currentSystem == "K" {
        if convertTo == "C"{
            print("From K to C: ",input - 273.15)
        }
        else if convertTo == "F"{
            print("From K to F: ",input * 9.0 / 5.0 - 459.67)
        }
        else {
            print("Wrong convert system input!")
        }
    }
    
    else if currentSystem == "F" {
        if convertTo == "C"{
            print("From F to C: ",(input - 32.0) * 5.0 / 9.0)
        }
        else if convertTo == "K"{
            print("From F to K: ",(input + 459.67) * 5.0 / 9.0)
        }
        else {
            print("Wrong convert system input!")
        }
    }
    else{
        print("Wrong current system input!")
    }
}
tempConverter(input: 30, currentSystem: "C", convertTo: "F")

print(String(repeating: "-", count: 30))
print("Task 4")

var shoppingList: [String:Int] = ["Phone" : 1, "Cover" : 2, "Watch" : 1, "Tag" : 4, "Bag" : 3]

func updateCart(_ List: inout [String:Int],_ item: String, _ quantity: Int){
    if quantity > 0 {
        List[item] = quantity
    }
    else {
        List[item] = nil
        print(item, "removed")
    }
}
func cartDisplay(_ List: [String:Int]){
    print("Current Cart:")
    for (item, quantity) in List {
        print("\(item): \(quantity)")
    }
}
updateCart(&shoppingList, "Tablet", 1)
updateCart(&shoppingList, "Watch", -1)
cartDisplay(shoppingList)

print(String(repeating: "-", count: 30))
print("Task 5")

let Text: String = "Edit: there is already a question similar to this one but it's for numbers separated by a specific character (Get no. Of words in swift for average calculator). Instead this question is about to get the number of real words in a text, separated in various ways: a line break, some line breaks, a space, more than a space etc."

func wordCounter(_ text: String) -> Void {
    var container: [String : Int] = [:]
    var currentWord = ""
    for character in text {
        if character.isLetter {
            currentWord.append(String(character))
        }
        else {
            if !currentWord.isEmpty {
                container[currentWord, default: 0] += 1
                currentWord = ""
            }
        }
    }
    print("\nWord Frequencies:")
        for (word, count) in container{
            print("\(word): \(count)")
        }
}
wordCounter(Text)

print(String(repeating: "-", count: 30))
print("Task 6")

func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    } else if n == 1 {
        return [0]
    } else if n == 2 {
        return [0, 1]
    }
    
    var sequence: [Int] = [0, 1]
    
    for _ in 2..<n {
        let next = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(next)
    }
    
    return sequence
}

print(fibonacci(10))


print(String(repeating: "-", count: 30))
print("Task 7")


func grading(_ studentList: [String:Double]) -> Void{
    var average = 0.0,count = 0.0, max = 0.0, min = 100.0
    for (_, grade) in studentList{
        if grade >= max {max = grade}
        if grade <= min {min = grade}
        average += grade
        count+=1
    }
    average = average/count
    print("Average grade is:", average, "\nMax grade is:", max, "\nMin grade is:", min)
    
    for student in studentList{
        if student.value < average{
            print("\nName:", student.key, "| Grade:", student.value, "Below average")
        }
        else if student.value > average{
            print("\nName:", student.key, "| Grade:", student.value, "Above average")
        }
        else{
            print("\nName:", student.key, "| Grade:", student.value, "Average")
        }
    }
    
}
let List: [String: Double] = ["Alice":99, "Bob":55.5, "Margo":64, "Ibragim":86.1]
grading(List)

print(String(repeating: "-", count: 30))
print("Task 8")

func isPalindrome(_ text: String) -> Bool {
    let filtered = text.lowercased().filter { $0.isLetter || $0.isNumber }
    return filtered == String(filtered.reversed())
}

print(isPalindrome("Race car"))

print(String(repeating: "-", count: 30))
print("Task 9")

func calculator(_ lhs: Double,_ operation: Character,_ rhs: Double) -> Double{
    if operation == "+" {return lhs + rhs}
    else if operation == "-" {return lhs - rhs}
    else if operation == "*" {return lhs * rhs}
    else if operation == "/" {return lhs / rhs}
    else {print("Operation error: Operation not included")
        return 0.0}
}
print(calculator(10, "*", 3))

print(String(repeating: "-", count: 30))
print("Task 10")

func hasUniqueCharacters(_ text: String) -> Bool{
    var charList = Set<Character>()
    for char in text{
        if charList.contains(char){return false}
        charList.insert(char)
    }
    return true
}
print("Has only unique characters:", hasUniqueCharacters("mouse"))
