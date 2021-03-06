//
//  News.swift
//  NewsApp
//
//  Created by skarev on 08.04.2021.
//

import Foundation

// MARK: - NewsData

struct NewsData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String// Date??
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
// swiftlint:disable identifier_name
struct Source: Codable {
    let id: String?
    let name: String
}
// swiftlint:enable identifier_name
