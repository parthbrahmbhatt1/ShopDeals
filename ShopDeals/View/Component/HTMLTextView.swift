//
//  HTMLTextView.swift
//  ShopDeals
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import SwiftUI

struct HTMLTextView: View {
    let html: String

    var body: some View {
        if let data = html.data(using: .utf16),
           let attributedString = try? AttributedString(
               NSAttributedString(
                   data: data,
                   options: [
                       .documentType: NSAttributedString.DocumentType.html,
                       .characterEncoding: String.Encoding.utf16.rawValue
                   ],
                   documentAttributes: nil
               )
           ) {
            Text(attributedString)
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        } else {
            Text(html)
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}
