//
//  LandingPageView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI


struct LandingPageView: View {
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Image("backgroundImage")
                    .resizable()
                    .overlay(LinearGradient(colors: [Color.black.opacity(0.45), Color.black.opacity(0.95)], startPoint: .topLeading, endPoint: .bottomLeading))
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    
                    HStack {
                        Image("logo2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                        
                        Spacer()
                    }
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 350, height: 500)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 50))
                        .overlay(
                            VStack(spacing: 20) {
                                
                                Image("homeIllustration")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                
                                Text("Happiness is turning your space into a garden..With Plantify")
                                    .font(Font.custom("BradleyHandITCTT-Bold", size: 28))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.25, green: 0.53, blue: 0.34))
                               
                                NavigationLink(destination: LoginView()){
                                    Text("Login")
                                        .font(.title3)
                                        .frame(width: 200, height: 20)
                                }
                                .buttonStyle(.primaryGreen)
                                
                            }
                            .padding()
                        )
                    Spacer()
                    
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LandingPageView()
}
