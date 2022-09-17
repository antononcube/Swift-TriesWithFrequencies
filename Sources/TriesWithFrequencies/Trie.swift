//
//  File.swift
//  
//
//  Created by Anton Antonov on 9/17/22.
//

import Foundation

public class Trie : Trieish {
    
    //=======================================================
    // Core functions -- creation, merging, insertion, node frequencies
    //=======================================================
    public func make(chars: [String], value: Double = 1, bottomValue: Double = 1) -> Trie {
        
    
        // First node
        var res = Trie(key : chars.last!, value : bottomValue, children : [:] )
        
        // Iterative
        for (i, c) in chars.reversed().enumerated() {
            if i > 0 {
                let children : [String : Trie] = [ res.key : res]
                res = Trie( key : c, value : value, children : children )
            }
        }
        
        // Add root
        let res2 = Trie( key : self.trieRootLabel, value : value, children : [res.key : res])
        
        // Result
        return res2
    }
    

}
