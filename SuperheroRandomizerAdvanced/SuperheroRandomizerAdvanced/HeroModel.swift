//
//  HeroModel.swift
//  SuperheroRandomizer
//
//  Created by Macbook Air on 28.11.2025.
//

nonisolated
struct HeroModel: Codable, Sendable{
    let id: Int
    let name: String
    let powerstats: Powerstats
    let images: HeroImage
}
struct HeroImage: Codable, Sendable{
    let md: String
}
struct Powerstats: Codable, Sendable{
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}
