import Foundation

// MARK: - Understanding Closures

/*

 Another way to write a function is as a closure. Closures simply let you create and call a function in a single step. By using closures as a different way to write functions, you can write more concise code (with the drawback of being harder to read and understand). Closures are most often used in completion handlers that run as soon as another command finishes running

 */

// - Let's write this function as closures
func multiplyBy2(x: Int) -> Int {
    x * 2
}

let y = { (x: Int) -> Int in x * 2 } // let y: (Int) -> Int
// or
let z = { x in x * 2 } // let z: (Int) -> Int
// or
let w = { $0 * 2 } // let w: (Int) -> Int

multiplyBy2(x: 2)
y(2)
z(2)
w(2)

let w2 = { $0 * 2.5 } // let a: (Double) -> Double

// - Closures with Multiple Parameters
func addNumbers(x: Int, y: Int) -> Int {
    x + y
}

/*
 When using closures, you need to enclose all parameters inside parentheses. In many cases, you do not need to define the data type of each parameter since Swift can infer that value based on the data type of the return value. For example, if the return value data type is an integer, Swift infers that the passed parameters must be integers as well
 */

let a = { (x, y) -> Int in x + y }
let b = { (x: Int, y: Int) in x + y }
let c = { $0 as Int + $1 as Int }

addNumbers(x: 1, y: 2)
a(1, 2)
b(1, 2)
c(1, 2)

// - Understanding Value Capturing
/*
 When you declare variables and constants within a function, they can only be accessed inside that function. However, when you declare a variable or constant outside of a function, that function can access that value as shown  below
 */

let randomValue = 2

func addNumbers2(x: Int, y: Int) -> Int {
    let wildCard = 4
    let sum = x + y + wildCard + randomValue
    return sum
}

let addNumbers3 = { (x, y) -> Int in x + y }

addNumbers3(17, addNumbers3(17, 9))
