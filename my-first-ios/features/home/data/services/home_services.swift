//
//  home_services.swift
//  my-first-ios
//
//  Created by Entronica on 25/3/2569 BE.
//

import Foundation

class HomeServies{
    func fetchBooks() async throws -> [Book] {
        guard let url = URL(string: "https://gutendex.com/books") else{
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(BookResponse.self, from: data)

            return response.results.map {
                Book(id: $0.id, title: $0.title)
            }
    }
}

struct BookResponse: Decodable {
    let results: [BookItem]
}

struct BookItem: Decodable {
    let id: Int
    let title: String
}
