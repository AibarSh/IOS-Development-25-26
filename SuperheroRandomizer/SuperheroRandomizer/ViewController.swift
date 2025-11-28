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
        ButtonDidTap()
    }
    
    @IBAction private func ButtonDidTap(){
        Task { @MainActor in
            guard let model = try? await service.fetchHero() else { return }
            heroNameLabel.text = model.name
            heroImageView.kf.setImage(with: URL(string: model.images.md))
            heroIntelligenceLabel.text = "Intelligence: \(model.powerstats.intelligence)"
            heroStrengthLabel.text = "Strength: \(model.powerstats.strength)"
            heroSpeedLabel.text = "Speed: \(model.powerstats.speed)"
            heroDurabilityLabel.text = "Durability: \(model.powerstats.durability)"
            heroPowerLabel.text = "Power: \(model.powerstats.power)"
            heroCombatLabel.text = "Combat: \(model.powerstats.combat)"
            
            intelligenceProgress.setProgress(percent(model.powerstats.intelligence), animated: true)
            strengthProgress.setProgress(percent(model.powerstats.strength), animated: true)
            speedProgress.setProgress(percent(model.powerstats.speed), animated: true)
            durabilityProgress.setProgress(percent(model.powerstats.durability), animated: true)
            powerProgress.setProgress(percent(model.powerstats.power), animated: true)
            combatProgress.setProgress(percent(model.powerstats.combat), animated: true)
        }
        
    }
    private func percent(_ value: Int) -> Float {
        return Float(value) / 100.0
    }
}

