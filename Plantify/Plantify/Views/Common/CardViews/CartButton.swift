//
//  CartButton.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-05-16.
//

import SwiftUI

struct CartButton: View {
    
    @Environment(PlantViewModel.self) var viewModel
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
            
            
            Text("\(viewModel.totalQuantity())")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(.red)
                    .cornerRadius(50)
            
        }
    }
}

#Preview {
    CartButton()
}
