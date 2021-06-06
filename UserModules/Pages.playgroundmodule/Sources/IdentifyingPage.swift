
//
//  ContentView.swift
//  Development
//
//  Created by Mason Dierkes on 4/8/21.
//

import SwiftUI
import QuizModel
import ComponentViews

// This page checks the student's knowledge on identifying a mole based on it's attributes.

public struct IdentifyingPage: View {
	@State private var selected = -1
	
	var cancers: [CancerInfo] = Quiz().infoCards()
	let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    public init() {}
    
    public var body: some View {
        ZStack{
            content
        }
    }
    
	var content: some View {
		
		ZStack{
			if(selected == -1){
				VStack{
					
					Text("Select the Cancer that is most dangerous.")
						.font(.title).bold().padding()
					VStack{
						HStack{
							InfoCardView(cancer: cancers[0], identifier: 0, selected: $selected)
							InfoCardView(cancer: cancers[1], identifier: 1, selected: $selected)
						}
						HStack{
							InfoCardView(cancer: cancers[2], identifier: 3, selected: $selected)
							InfoCardView(cancer: cancers[3], identifier: 3, selected: $selected)
						}
					}
					Spacer()
				}
			}
			
			else if(selected == 0){
				Color(#colorLiteral(red: 0, green: 0.6705882353, blue: 0.4, alpha: 1))
					.ignoresSafeArea()
				Text("Correct!")
					.font(.title).bold().padding()
					.foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
					.onReceive(timer, perform: { _ in
						selected = -1
					})

			}
			
			else{
				Color(#colorLiteral(red: 0.9294117647, green: 0.262745098, blue: 0.2156862745, alpha: 1))
					.ignoresSafeArea()
				Text("Incorrect")
					.font(.title).bold().padding()
					.onReceive(timer, perform: { _ in
						selected = -1
					})
			}
		}.animation(.easeIn)
	   
	}
    
    
}

