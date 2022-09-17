//
//  File.swift
//  
//
//  Created by Anton Antonov on 9/17/22.
//

import Foundation

public class Trieish {
    
    var trieRootLabel : String = "TRIEROOT"
    var trieValueLabel : String = "TRIEVALUE"
    public var key : String
    public var value : Double
    public var children : Dictionary<String, Trieish> = [:]
    
    // Initializers
    public init() {
        self.key = self.trieValueLabel
        self.value = 0
    }
    
    public init(key:String, value : Double, children: Dictionary<String, Trieish>) {
        self.key = key
        self.value = value
        self.children = children
    }
    
    
    public init(key:String, value:Double) {
        self.key = key
        self.value = value
    }
    
    
    // Copy
    public func copy() -> Trieish {
        let res = Trieish()
        res.key = self.key
        res.value = self.value
        res.children = [:]
        for (k, v) in self.children {
            res.children[k] = v.copy()
        }
        return res
    }
    
    // To JSON format
    public func toJSON() -> String {
        return self.toJSONFormatRec(n: 0)
    }
    
    public func toJSONFormatRec(n:Int) -> String {
        let offset : String = String(repeating: " ", count: n)
        let offset1 : String = offset + " "
        var chMap : [String] = []
        
        if self.children.count > 0 {
            for (_,v) in self.children {
                chMap.append( offset1 + v.toJSONFormatRec(n:n+1))
            }
        }
        let chRes = chMap.count == 0 ? "[]" : "[" + chMap.joined(separator: ", ") + "]"
        
        return "{\"key\":" + "\"" + self.key + "\"" + ", value:" + String(self.value) + ", \"children\":" + chRes + "}"
    }
    
}
