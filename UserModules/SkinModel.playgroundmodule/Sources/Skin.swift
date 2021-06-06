
//
//  Skin.swift
//  Development
//
//  Created by Mason Dierkes on 4/11/21.
//

import Foundation
import SwiftUI
import UIKit

public class Skin: ObservableObject {
	
	// Controls the creation of moles and cancers.
	// Everything is based on statistics and facts to help the
	// simulation be as realistic as possible.

	
	var sunscreenFrequency : Int
	var sunburns : Int
	var isMale : Bool
	
	@Published public var color : Color
	@Published public var hasCancer = false
	@Published public var age = 1
	@Published public var cancer: Cancer?
	
	public init(color: Color, sunscreenFrequency: Int, sunburns: Int, isMale: Bool) {
		self.color = color
		self.sunscreenFrequency = sunscreenFrequency
		self.sunburns = sunburns
		self.isMale = isMale
	}
	
	public func generateMole(age: Int) -> Mole?{
		
		if let cancerMole = checkForCancer(){
			return cancerMole
		}
		
		
		// Moles, or nevi, typically form during childhood and adolescence, but new moles can appear in adulthood.
		// From MedicalNewsToday
		// It is normal to have between 10-40 moles by adulthood.
		// From WebMD
		// Cancer risk goes up as mole formation goes down.
		
		
		let randomEvents = Double.random(in: 1...10)
		let moleFormationProbablility = (((sunExposure(age: age) * sunburnRisk() * ethnicityScore() ) / (sunscreenAid() * Double(age) * randomEvents)) * 1000)
		
		//        print(cancerRisk)
		
		if(moleFormationProbablility >= 60.0){
						print("\(moleFormationProbablility ) Age \(age)")
			return Mole(color: Color(#colorLiteral(red: 0.1733416933, green: 0.07746537477, blue: 0.0295993094, alpha: 1)), size: 17, position: [CGFloat.random(in: 0...1),CGFloat.random(in: 0...1)], age: age)
		}
		
		else{
			return nil
		}
		
	}

	func checkForCancer() -> Cancer?{
		
		// Melanoma - Most dangerous form of Skin Cancer
		// Occurs most often from blistering sunburns and UV exposure
		let melanomaRisk = (((sunburnRisk() * Double(age)) / sunscreenAid()))
		let melanoma = Cancer(type: "Melanoma", color: Color.black, size: 20, position: [CGFloat.random(in: 0...1),CGFloat.random(in: 0...1)], age: age)
		if(melanomaRisk > 35){
			
			// 1 in 38 White, 1 in 1000 Black, 1 in 167 Hispanic
			// From cancer.org
			
			switch ethnicity() {
			case "white":
				if (Int.random(in: 1...38) == 13){
					cancer = melanoma
					return melanoma
				}
				
			case "african-american":
				if (Int.random(in: 1...1000) == 13){
					cancer = melanoma
					return melanoma
				}
				
			case "hispanic":
				if (Int.random(in: 1...167) == 13){
					cancer = melanoma
					return melanoma
				}
				
			default:
				if (Int.random(in: 1...38) == 13){
					cancer = melanoma
					return melanoma
				}
				print("default value used")
			}
			
		}
		
		// Basal Cell Carcinoma (BCC) - Most common form of Skin Cancer
		// Occurs most often from exposure to sun.
		let basalRisk = ((sunExposure(age: age) * sunburnRisk()) / sunscreenAid())
		//        print("Basal Risk \(basalRisk) Age \(age)")
		let basal = Cancer(type: "Basal", color: Color.black, size: 20, position: [CGFloat.random(in: 0...1),CGFloat.random(in: 0...1)], age: age)
		
		if (basalRisk > 10){
			switch ethnicity() {
			case "white":
				if (Int.random(in: 1...38) == 13){
					cancer = basal
					return basal
				}
				
			case "african-american":
				if (Int.random(in: 1...1000) == 13){
					cancer = basal
					return basal
				}
				
			case "hispanic":
				if (Int.random(in: 1...167) == 13){
					cancer = basal
					return basal
				}
				
			default:
				if (Int.random(in: 1...38) == 13){
					cancer = basal
					return basal
				}
				print("default value used")
			}
		}
		
		// Squamous Cell Carcinoma (SCC) - Second most common form of Skin Cancer
		// Occurs from cumulative unprotected exposure to UV radiation and increases by age.
		let squamousRisk = ((sunExposure(age: age) * Double(age)) / sunscreenAid())
		//        print("Squamous Risk \(squamousRisk) Age \(age)")
		let squamous = Cancer(type: "Squamous", color: Color.black, size: 20, position: [CGFloat.random(in: 0...1),CGFloat.random(in: 0...1)], age: age)
		
		if (squamousRisk > 15){
			switch ethnicity() {
			case "white":
				if (Int.random(in: 1...38) == 13){
					cancer = squamous
					return squamous
				}
				
			case "african-american":
				if (Int.random(in: 1...1000) == 13){
					cancer = squamous
					return squamous
				}
				
			case "hispanic":
				if (Int.random(in: 1...167) == 13){
					cancer = squamous
					return squamous
				}
				
			default:
				if (Int.random(in: 1...38) == 13){
					cancer = squamous
					return squamous
				}
				print("default value used")
			}
		}
		
		return nil
		
		
	}
	
	
	
	func sunExposure(age: Int) -> Double{
		
		// Statistics of average accumulated Sun Exposure based on a 78 year lifespan
		// From skincancer.org
		
		switch age {
		case 0..<19:
			return Double(age) * 0.23
		case 19..<40:
			return Double(age) * 0.43
		case 41..<59:
			return Double(age) * 0.74
		case 60..<100:
			return Double(age) * 1.00
			
		default:
			return Double(age) * 0.50
		}
		
	}
	
	
	func sunburnRisk() -> Double {
		
		// "Having 5 or more sunburns doubles your risk for melanoma." (skincancer.org)
		// * Note estimates are made for following numbers based on the exponetial factor
		
		switch sunburns {
		case 0:
			return 0.10
		case 1:
			return 0.20
		case 2:
			return 0.40
		case 3:
			return 0.80
		case 4:
			return 1.60
		case 5:
			return 2.00
			
		default:
			return (Double(sunburns) * 2.00)
		}
		
	}
	
	
	func sunscreenAid() -> Double {
		
		// "Regular daily use of an SPF 15 or higher sunscreen reduces the risk of developing.
		// squamous cell carcinoma by about 40 percent."
		// From skincancer.org
		
		return Double(sunscreenFrequency) * 2
		
	}
	
	func ethnicity() -> String {
		
		// Different skin ethnicities are more resilient to skin damage.
		// Although not full proof, this function attempts to separate the skin by race.
		
		if let skintone = color.getBrightness(){
			switch skintone{
			case 0.75..<1.00:
				return "white"
				
			case 0.65..<0.75:
				return "asian"
				
			case 0.50..<0.65:
				return "hispanic"
				
			case 0.00..<0.50:
				return "african-american"
				
			default:
				return "white"
				
			}
		}
		
		return "white"
		
	}
	
	func ethnicityScore() -> Double {
		switch ethnicity() {
		case "white":
			return 1.00
			
		case "african-american":
			return 0.50
			
		case "hispanic":
			return 0.75
			
		default:
			return 1.00
		}
		
	}
	
	
	
	
}



extension Color {
	
	func getBrightness() -> Float? {
		
		// Get's the brightness of the Skin color to help predict ethnicity.
		
		let originalColor = self.cgColor
		let RGBColor = originalColor?.converted(to: CGColorSpaceCreateDeviceRGB(), intent: .defaultIntent, options: nil)
		guard let components = RGBColor?.components else {
			return nil
		}
		guard components.count >= 3 else {
			return nil
		}
		
		let brightness = Float(((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000)
		return brightness
		
	}
	
}


