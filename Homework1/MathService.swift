//
//  MathService.swift
//  Homework1
//
//  Created by Sasha on 04/12/2020.
//

import Foundation

class MathService {
    
    static var share: MathService = MathService()
    private init() {}
    
    func factorialIterate(n: Int) -> Int {
        if n == 0 { return  1 }
        
        var temp = 1
        for i in 1...n {
            temp *= i
        }
        
        return temp
    }
    
    func factorialRecurtion(n: Int) -> Int {
        if n >= 1 {
            return n * factorialRecurtion(n: n - 1)
        } else {
            return 1
        }
    }
    
    func fibonachiIterate(n: Int) -> Int {
        var a = 0
        var b = 1
        var c = 1
        if n == 0 { return 0 }
        
        for _ in 2...n {
            c = a + b
            a = b
            b = c
        }
        return b
    }
    
    func fibonachiRecurtion(n: Int) -> Int {
        if n <= 1 {
            return n
        } else {
            return fibonachiRecurtion(n: n - 1) + fibonachiRecurtion(n: n - 2)
        }
    }
    
    func pi(n: Int) -> Double{
        var temp: Double = 0
        for k in 0..<n {
            let a: Double =  1 / pow(16.0, Double(k))
            let b: Double = 4 / (8 * Double(k) + 1)
            let c: Double = 2 / (8 * Double(k) + 4)
            let d: Double = 1 / (8 * Double(k) + 5)
            let e: Double = 1 / (8 * Double(k) + 6)
            temp += a * (b - c - d - e)
        }
        return temp
    }
    
    
}
