//
//  BackgroundView.swift
//  Development
//
//  Created by Mason Dierkes on 4/12/21.
//

import SwiftUI
import Styles

public struct BackgroundView: View {
	
	@Environment(\.colorScheme) var colorScheme

	public init() {}
	
	public var body: some View {
		Color("Background")
	}
}



