//
//  Choice.swift
//  Development
//
//  Created by Mason Dierkes on 4/19/21.
//

import SwiftUI

public struct Choice: View {
	
	var choice: String
	var identifier: Int
	@Binding var selected: Int
	
	public init(choice: String, identifier: Int, selected: Binding<Int>){
		self.choice = choice
		self.identifier = identifier
		self._selected = selected
	}
    public var body: some View {

		Button(action: {
			
				selected = identifier
			
			}
		) {
			VStack {
				ZStack{
					RoundedRectangle(cornerRadius: 30)
						.overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
									.stroke(lineWidth: 0.5)
									.fill(Color.white))
						.shadow(color: Color.black.opacity(0.3), radius: 20, x: 10, y: 10)
						.opacity(0.8)
						.accentColor(.black)
					
					Text(choice)
						.font(.title2)
						.bold()
						.accentColor(Color.white)
						.padding()
					
				}.frame(maxWidth: .infinity, maxHeight: 150)
				.padding(.horizontal, 30.0)
				
			}
		}
    }
}
