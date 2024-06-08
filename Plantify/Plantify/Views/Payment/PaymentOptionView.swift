//
//  PaymentOptionView.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-05-19.
//

import SwiftUI

struct PaymentOptionView: View {
    var optionName: String
    var systemImageName: String
    @Binding var selectedPayment: String?
    
    var body: some View {
        let isSelected = selectedPayment == optionName
        let primaryGreen = Color.primaryGreen
        
        HStack {
            Image(systemName: systemImageName)
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(optionName)
                .font(.headline)
            
            Spacer()
            
            Circle()
                .strokeBorder(isSelected ? primaryGreen : Color.gray, lineWidth: 2)
                .background(Circle().fill(isSelected ? primaryGreen : Color.clear))
                .frame(width: 24, height: 24)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? primaryGreen : Color.gray, lineWidth: 2)
        )
        .padding(.vertical, 5)
        .onTapGesture {
            if selectedPayment == optionName {
                selectedPayment = nil
            } else {
                selectedPayment = optionName
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetails()
    }
}
