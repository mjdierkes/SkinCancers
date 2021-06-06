//
//  CancerInformation.swift
//  Development
//
//  Created by Mason Dierkes on 4/10/21.
//

import SwiftUI
import QuizModel

public struct InfoCardView: View {
	

	// A component view to display the infographic of the cancerous moles.
	
	var cancer: CancerInfo
	var identifier: Int
	@Binding var selected: Int
	
	public init(cancer: CancerInfo, identifier: Int, selected: Binding<Int>){
		self.cancer = cancer
		self.identifier = identifier
		self._selected = selected
	}
	
	public var body: some View {
		Button(action: {
			selected = identifier
		}) {
			VStack {
				ZStack{
					RoundedRectangle(cornerRadius: 30)
						.shadow(color: Color.black.opacity(0.3), radius: 20, x: 10, y: 10)
						.opacity(0.8)
						.accentColor(.black)
					Image(cancer.image)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.padding()
					
				}.frame(maxWidth: 175, maxHeight: 175)
				.padding()
				Text(cancer.type)
					.font(.title2).bold().accentColor(Color.white)
				
			}
		}
	}
}

