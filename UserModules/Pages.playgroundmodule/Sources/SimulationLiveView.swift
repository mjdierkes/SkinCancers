//
//  SimulationLiveView.swift
//  Development
//
//  Created by Mason Dierkes on 4/18/21.
//

import SwiftUI

public struct SimulationLiveView: View {
	
	public init() {}
	
	@Environment(\.colorScheme) var colorScheme

    public var body: some View {
		VStack{
			Text("Press Run My Code")
				.font(.title).bold().padding()
			RoundedRectangle(cornerRadius: 35)
				.foregroundColor(Color(#colorLiteral(red: 0.9999651313, green: 0.7638683915, blue: 0.6287755966, alpha: 1)))
				.frame(maxWidth: 300, maxHeight: 300)
				.morphDropShadow()

		}
     
    }
}
