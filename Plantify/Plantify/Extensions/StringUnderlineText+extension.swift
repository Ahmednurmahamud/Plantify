//
//  StringUnderlineText+extension.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-27.
//

import Foundation
import SwiftUI


extension View {
    func roundedBackground(cornerRadius: CGFloat, color: Color) -> some View {
        self.background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(color)
        )
    }
}
