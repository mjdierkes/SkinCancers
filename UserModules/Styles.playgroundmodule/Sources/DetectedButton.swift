//
//  DetectedButton.swift
//  Development
//
//  Created by Mason Dierkes on 4/19/21.
//

import SwiftUI

public struct DetectedButton: ViewModifier {
	public func body(content: Content) -> some View {
		content
			.font(.headline)
			.frame(maxWidth: 100, maxHeight: 20)
			.padding(.horizontal, 30)
			.padding(.vertical, 10)
			.background(Color.black)
			.accentColor(.white)
			.cornerRadius(40)
	}
}

public extension View {
	public func detectedButton() -> some View {
		self.modifier(DetectedButton())
	}
}

