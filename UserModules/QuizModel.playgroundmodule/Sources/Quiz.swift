
//
//  Quiz.swift
//  Development
//
//  Created by Mason Dierkes on 4/12/21.
//

import Foundation


public struct Quiz {
    
    public init() {}
	
	// Holds the information used in both the info card views and review quiz. 
    
    public func questions() -> [Question] {
        return [
            Question(title: "What is the most dangerous type of skin cancer?", choices: ["Melanoma", "Basal Cell Carcinoma", "Squamous Cell Carcinoma", "Actinic"], correctAnswer: 0),
			
            Question(title: "How often do you need to apply sunscreen?", choices: ["Every hour", "Only when it's hot", "Every 30 minutes"], correctAnswer: 0),
			
			Question(title: "Skin Cancer is primarily caused from exposure to UV rays from the sun.", choices: ["True", "False"], correctAnswer: 0),
			
			Question(title: "What is the best way to protect your skin?", choices: ["Apply sunscreen frequently!", "Wear protective clothing and apply sunscreen!", "Smile and be happy.", "Stay inside during the day. Never go in the sun."], correctAnswer: 1),
			
			Question(title: "Which characteristic could alert you to Melanoma?", choices: ["Asymmetrical – one half does not match the other", "Border – the edge is uneven", "Color – lots of different colors", "All of the above"], correctAnswer: 3)
			
        ]
    }
    
    public func infoCards() -> [CancerInfo] {
        return [
            CancerInfo(type: "Melanoma", description: "very bad", image: "Melanoma"),
            CancerInfo(type: "BCC", description: "also bad", image: "BCC"),
            CancerInfo(type: "SCC", description: "terrible", image: "SCC"),
            CancerInfo(type: "AK", description: "hehe ants", image: "Actinic")
        ]
    }
    
    
}
