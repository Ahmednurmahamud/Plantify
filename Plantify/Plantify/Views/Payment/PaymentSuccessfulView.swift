//
//  PaymentSuccessfulView.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-05-19.
//

import SwiftUI

struct PaymentSuccessfulView: View {
    @Environment(PlantViewModel.self) var viewModel
    @Binding var path: [String]
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.primaryGreen)
                    .frame(width: 88, height: 85)
                
                Image(systemName: "checkmark.seal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 110)
                    .foregroundColor(.white)
            }
            
            Text("Payment Successful!")
                .font(.title)
                .bold()
            
            Text("Thank you for your purchase.")
                .font(.headline)
            
            .navigationBarTitle("Payment Successful")
        }
        .onAppear {
              viewModel.clearCart()
          }
    }
}

//#Preview {
//    PaymentSuccessfulView()
//}
