//
//  Helpers.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import Foundation

/*
 Stuff in here is just to make the main code more consumable
*/

func random(min min: Int, max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max + 1)) + UInt32(min))
}
extension Collection where Self.Index == Int {
    func randomElement() -> Self.Iterator.Element {
        let index = random(min: 0, max: Int(self.count - 1))
        return self[index]
    }
    subscript(safe safe: Self.Index) -> Iterator.Element? {
        guard self.indices.contains(safe) else { return nil }
        return self[safe]
    }
}

private let units = [
    "", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
    "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
]
private let tens = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

extension Int {
    var asWords: String? {
        if (self < 20) { return units[safe: self] }
        
        let value = tens[safe: self / 10] ?? ""
        let remainder = units[safe: self % 10] ?? ""
        return "\(value) \(remainder)"
    }
}
