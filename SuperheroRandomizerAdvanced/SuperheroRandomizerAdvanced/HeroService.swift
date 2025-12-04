//
//  HeroService.swift
//  SuperheroRandomizer
//
//  Created by Macbook Air on 28.11.2025.
//
import Foundation
import Alamofire

enum URLError: Error{
    case wrongURL
}
protocol HeroServiceDelegate: AnyObject{
    func HeroDidUpdate(model: HeroModel)
}

struct HeroService {
    weak var delegate: HeroServiceDelegate?
    
    func fetchHero(){
        let randomId = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        
        AF.request(urlString).responseDecodable ( of: HeroModel.self ){ response in
            switch response.result{
            case .success(let hero):
                delegate?.HeroDidUpdate( model: hero )
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}


