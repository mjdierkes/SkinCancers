//
//  MorphDropShadow.swift
//  Development
//
//  Created by Mason Dierkes on 4/19/21.
//

import SwiftUI

public struct MorphDropShadow: ViewModifier {
	
	public init() {}
		
	public func body(content: Content) -> some View {
		content
			.shadow(color: Color("startColor"), radius: 10, x: 10, y: 10)
			.shadow(color: Color("endColor"), radius: 10, x: -5, y: -5)
	}
}

extension View {
	public func morphDropShadow() -> some View {
		self.modifier(MorphDropShadow())
	}
}
