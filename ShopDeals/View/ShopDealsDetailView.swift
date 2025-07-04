//
//  ShopDealsDetailView.swift
//  ShopDeals
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShopDealsDetailView: View {
    let shopDealsModel: ShopDealsModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                WebImage(
                    url: URL(string: shopDealsModel.backgroundImage),
                    options: [.retryFailed, .continueInBackground]
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipped()
                } placeholder: {
                    Color(.systemGray5)
                        .overlay(ProgressView())
                }
                .frame(height: 320)
                .frame(maxWidth: .infinity)
                .cornerRadius(18)
                .padding(.top, 16)
                
                Text(shopDealsModel.title)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
                
                if let desc = shopDealsModel.topDescription {
                    Text(desc)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                
                if let code = shopDealsModel.promoMessage {
                    Text(code)
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                
                if let content = shopDealsModel.content {
                    ForEach(content) { item in
                        if let url = URL(string: item.target) {
                            Link(item.title, destination: url)
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                                .padding(.horizontal)
                        }
                    }
                }
                
                if let bottomDesc = shopDealsModel.bottomDescription {
                    let validHTML = bottomDesc
                        .replacingOccurrences(of: "\\\"", with: "\"")
                        .replacingOccurrences(of: "\\\\", with: "")
                    HTMLTextView(html: validHTML)
                        .font(.footnote)
                        .padding(.top, 12)
                }
                
                Spacer()
            }
            .navigationTitle(shopDealsModel.title)
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}
