
//
//  DarkButtonStyle.swift
//  Development
//
//  Created by Mason Dierkes on 4/15/21.
//

import SwiftUI

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(RoundedRectangle(cornerRadius: 50))
            .background(
                Group{
                    DarkBackground(isHighlighted: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 50))
                    
                }
            )
        
    }
    
}

