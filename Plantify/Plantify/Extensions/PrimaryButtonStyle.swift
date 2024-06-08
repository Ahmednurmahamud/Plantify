//
//  PrimaryButtonStyle.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-27.
//

import Foundation
import SwiftUI

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primaryGreen: PrimaryButtonStyle {
        return PrimaryButtonStyle(backgroundColor: Color(red: 0.25, green: 0.53, blue: 0.34))
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


