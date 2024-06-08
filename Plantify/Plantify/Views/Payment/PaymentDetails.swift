//
//  PaymentDetails.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-05-19.
//

import SwiftUI

struct PaymentDetails: View {
    @State private var selectedPayment: String? = nil
    @State private var path: [String] = []
    @State private var isProcessingPayment: Bool = false

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Payment Details")
                    .font(.title2)
                    .padding(.bottom, 10)

                VStack(alignment: .leading) {
                    Text("Payment Options")
                        .font(.title)
                        .padding(.bottom, 20)

                    PaymentOptionView(optionName: "PayPal", systemImageName: "dollarsign.circle", selectedPayment: $selectedPayment)
                    PaymentOptionView(optionName: "Google Pay", systemImageName: "g.circle", selectedPayment: $selectedPayment)
                    PaymentOptionView(optionName: "Apple Pay", systemImageName: "applelogo", selectedPayment: $selectedPayment)

                    Spacer()

                    if isProcessingPayment {
                        VStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                            Text("Processing payment")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    } else {
                        if selectedPayment != nil {
                            Button {
                                isProcessingPayment = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                    path.append("PaymentSuccessful")
                                    isProcessingPayment = false
                                }
                            } label: {
                                Text("Confirm Payment")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryGreen))
                            }
                        } else {
                            VStack {
                                Text("Please select a payment option")
                                    .foregroundColor(.red)
                                    .padding(.top, 10)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationDestination(for: String.self) { viewName in
                if viewName == "PaymentSuccessful" {
                    PaymentSuccessfulView(path: $path)
                }
            }
        }
    }
}

#Preview {
    PaymentDetails()
}
