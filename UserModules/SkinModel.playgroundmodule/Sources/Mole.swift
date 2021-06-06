

//
//  Mole.swift
//  Development
//
//  Created by Mason Dierkes on 4/11/21.
//

import Foundation
import SwiftUI

public class Mole{
    
    var color : Color
    public var size : CGFloat
    public var position : [CGFloat]
    var age : Int
    
    var imageName : String?
    
    public init(color: Color, size: CGFloat, position: [CGFloat], age: Int) {
        self.color = color
        self.size = size
        self.position = position
        self.age = age
    }
    
	// Sets the image to a random mole and returns the image
    public func image() -> String {
        
        if(imageName == nil){
            let random = Int.random(in: 5...11)
            imageName = String("Mole\(random)")
            return imageName!
        }
        
        return imageName!
        
    }
}

// Enables the mole to be used in a For Each loop
extension Mole: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}


extension Mole: Equatable {
    public static func ==(lhs: Mole, rhs: Mole) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
