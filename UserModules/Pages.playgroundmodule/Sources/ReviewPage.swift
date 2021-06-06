//
//  QuizView.swift
//  Development
//
//  Created by Mason Dierkes on 4/10/21.
//

import SwiftUI
import QuizModel
import ComponentViews

public struct ReviewPage: View {
    
    public init() {}
	var questions : [Question] = Quiz().questions()

	@State private var index = 0
	@State private var selected = -1
	
	public var body: some View {
		ZStack {
			content
		}
	}
	
	var content : some View {
		ZStack{
			
			VStack{
				Text(questions[index].title)
					.font(.title).bold().padding()
				
				ForEach(0..<questions[index].choices.count, id: \.self) { i in
					Choice(choice: questions[index].choices[i], identifier: i, selected: $selected)
				}
			}
			if(selected == questions[index].correctAnswer){
				Color(#colorLiteral(red: 0, green: 0.6705882353, blue: 0.4, alpha: 1))
					.ignoresSafeArea()
				VStack{
					Text("Correct!")
						.font(.title).bold().padding()
						.foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
					if(index < questions.count - 1 ){
						Button(action: {
							print(questions.count)
							print(index)
							index += 1
							selected = -1
							
						}) {
							Text("Next")
								.detectedButton()
						}
					}
					else{
						Button(action: {
							index = 0
							selected = -1
							
						}) {
							Text("Go again")
								.detectedButton()
						}
					}
				}
			}
			
		}.animation(.easeIn)
	}
	
    
    
}
