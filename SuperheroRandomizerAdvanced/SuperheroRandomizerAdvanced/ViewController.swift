//
//  ViewController.swift
//  SuperheroRandomizer
//
//  Created by Macbook Air on 27.11.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroIntelligenceLabel: UILabel!
    @IBOutlet weak var heroStrengthLabel: UILabel!
    @IBOutlet weak var heroSpeedLabel: UILabel!
    @IBOutlet weak var heroDurabilityLabel: UILabel!
    @IBOutlet weak var heroPowerLabel: UILabel!
    @IBOutlet weak var heroCombatLabel: UILabel!
    
    @IBOutlet weak var intelligenceProgress: UIProgressView!
    @IBOutlet weak var strengthProgress: UIProgressView!
    @IBOutlet weak var speedProgress: UIProgressView!
    @IBOutlet weak var durabilityProgress: UIProgressView!
    @IBOutlet weak var powerProgress: UIProgressView!
    @IBOutlet weak var combatProgress: UIProgressView!
    
    var service = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
        loadHeroIfNeeded()
    }
    
    @IBAction private func ButtonDidTap(){
       service.fetchHero()        
    }
    private func percent(_ value: Int) -> Float {
        return Float(value) / 100.0
    }
}


extension ViewController: HeroServiceDelegate{
    func HeroDidUpdate(model: HeroModel) {
        configure(hero: model)
        storeHero(hero: model)
    }
    
    private func storeHero(hero: HeroModel){
        guard let data = try? PropertyListEncoder().encode(hero) else {return}
        UserDefaults.standard.set(data, forKey: "heroModel")
    }
    
    private func loadHeroIfNeeded(){
        guard
            let heroData = UserDefaults.standard.data(forKey: "heroModel"),
            let model = try? PropertyListDecoder().decode(HeroModel.self, from: heroData)
        else{
            return
        }
        
        configure(hero: model)
    }
    
    private func configure(hero: HeroModel){
        heroNameLabel.text = hero.name
        heroImageView.kf.setImage(with: URL(string: hero.images.md))
        heroIntelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
        heroStrengthLabel.text = "Strength: \(hero.powerstats.strength)"
        heroSpeedLabel.text = "Speed: \(hero.powerstats.speed)"
        heroDurabilityLabel.text = "Durability: \(hero.powerstats.durability)"
        heroPowerLabel.text = "Power: \(hero.powerstats.power)"
        heroCombatLabel.text = "Combat: \(hero.powerstats.combat)"
        
        intelligenceProgress.setProgress(percent(hero.powerstats.intelligence), animated: true)
        strengthProgress.setProgress(percent(hero.powerstats.strength), animated: true)
        speedProgress.setProgress(percent(hero.powerstats.speed), animated: true)
        durabilityProgress.setProgress(percent(hero.powerstats.durability), animated: true)
        powerProgress.setProgress(percent(hero.powerstats.power), animated: true)
        combatProgress.setProgress(percent(hero.powerstats.combat), animated: true)
    }
}
