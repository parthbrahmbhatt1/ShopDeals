//
//  ShopDealsView.swift
//  ShopDeals
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import SwiftUI

struct ShopDealsView: View {
    let shopDealsModel: ShopDealsModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: shopDealsModel.backgroundImage)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 300)
                    .clipped()
            } placeholder: {
                Color(.systemGray)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 300)
            }
            
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black.opacity(0.75)]),
                startPoint: .center, endPoint: .bottom
            )
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
            
            VStack(alignment: .center, spacing: 6) {
                Text(shopDealsModel.title)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.6), radius: 2, x: 1, y: 1)
                    .multilineTextAlignment(.center)
                    .background(.ultraThinMaterial)
                    .cornerRadius(5)
                
                if let topDesc = shopDealsModel.topDescription {
                    Text(topDesc)
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.90))
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
            .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8, height: 300)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.07), radius: 8, x: 0, y: 4)
        .padding(.vertical, 10)
    }
}
