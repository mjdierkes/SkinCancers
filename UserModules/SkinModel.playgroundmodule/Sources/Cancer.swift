
//
//  Melanoma.swift
//  Development
//
//  Created by Mason Dierkes on 4/15/21.
//

import Foundation
import SwiftUI

public class Cancer: Mole  {
	
	
	// Holds the values of the cancer for easy recall
    
    public let type: String
    private var currentStage = 1
    
    public init(type: String,  color: Color, size: CGFloat, position: [CGFloat], age: Int ) {
        self.type = type
        super.init(color: color, size: size, position: position, age: age)
    }
    
    // Updates the image of the cancer overtime to show evolution
    public func transform(lifespan: Int) {
        if(currentStage < lifespan){
            imageName = (type + String(currentStage))
            currentStage += 1
        }
        
    }
    
}
