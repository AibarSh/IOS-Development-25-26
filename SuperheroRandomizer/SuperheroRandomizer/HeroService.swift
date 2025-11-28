//
//  HeroService.swift
//  SuperheroRandomizer
//
//  Created by Macbook Air on 28.11.2025.
//
import Foundation

enum URLError: Error{
    case wrongURL
}
protocol HeroServiceDelegate: AnyObject {
    func HeroDidUpdate(model: HeroModel)
}

struct HeroService {
    weak var delegate: HeroServiceDelegate?
    
    func fetchHero() async throws -> HeroModel {
        let randomId = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        guard let url = URL(string: urlString) else{
            throw URLError.wrongURL
        }
        
        let URLRequest = URLRequest(url: url)
        
        do{
            let (data, response) = try await URLSession.shared.data(for: URLRequest)
            print(response)
            let heroModel = try JSONDecoder().decode(HeroModel.self, from: data)
            return heroModel
        }
        catch{
            throw error
        }
    }
}


