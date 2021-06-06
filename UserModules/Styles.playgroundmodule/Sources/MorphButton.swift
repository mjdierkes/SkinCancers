//
//  Button.swift
//  Development
//
//  Created by Mason Dierkes on 4/15/21.
//

import Foundation
import SwiftUI

public struct MorphButton: ButtonStyle{
    
    public init() {}
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color.offWhite)
                    } else {
                        RoundedRectangle(cornerRadius: 50)
							.fill(Color.offWhite)

                    }
                }
            )
    }
}

public extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
}


extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

