//
//  Response.swift
//  RC_week6
//
//  Created by 권유정 on 2022/10/23.
//

import Foundation

struct Welcome: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let image: String
    let subtitle, pubDate, director, actor: String
    let userRating: String
}
