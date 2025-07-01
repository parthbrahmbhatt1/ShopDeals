//
//  ShopDealsModel.swift
//  ShopDeals
//
//  Created by Parth Brahmbhatt on 6/26/25.
//

import Foundation

struct ShopDealsContent: Codable, Identifiable, Hashable {
    var id = UUID()
    let target: String
    let title: String
    let elementType: String?
    
    enum CodingKeys: String, CodingKey {
        case target, title, elementType
    }
}

struct ShopDealsModel: Codable, Identifiable, Hashable {
    let id = UUID()
    let title: String
    let backgroundImage: String
    let content: [ShopDealsContent]?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case title, backgroundImage, content, promoMessage, topDescription, bottomDescription
    }
}

