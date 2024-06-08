//
//  RemoveFromCartView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct RemoveFromCartView: View {
    @Environment(\.dismiss) var dismiss
    @State private var quantity = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Remove From Cart?")
                .font(.title2).fontWeight(.semibold)
            Divider()
            HStack(alignment: .top, spacing: 16) {
                //ImageView()
                Image("snakeplant")
                    .resizable()
                    .frame(width:120, height: 120)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                //Detail
                VStack(alignment: .leading, spacing: 4) {
                    Text("Plant Name")
                        .font(.headline)
                    Text("$20")
                        .font(.headline)
                        .foregroundStyle(Color("PrimaryGreen"))
                    Spacer()
                    HStack(alignment: .center) {
                        HStack(spacing: 16) {
                            Button {
                                quantity -= 1
                            } label: {
                                Text("-")
                                    .font(.title)
                            }
                            Text("\(quantity)")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Button {
                                quantity += 1
                            } label: {
                                Text("+")
                                    .font(.title2)
                            }
                        }
                        .padding(8)
                        .foregroundStyle(Color("PrimaryGreen"))
                        .frame(width: 120)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color.gray)
                                .opacity(0.2)
                        }
                    }
                }
                Spacer()
            }
            .frame(height: 120)
            Divider()
            HStack(spacing: 16) {
                Button(action: {dismiss()}, label: {
                    Text("Cancel")
                        .padding(.vertical, 10)
                        .foregroundStyle(Color.primaryGreen)
                        .frame(width: 140)
                })
                .buttonStyle(.bordered)
                
                Button(action: {
                    
                    dismiss()
                }, label: {
                    Text("Yes, Remove")
                        .padding(.vertical)
                        .frame(width: 160)
                })
                .buttonStyle(.primaryGreen)
            }
            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    RemoveFromCartView()
}
