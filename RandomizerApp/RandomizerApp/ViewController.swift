//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Macbook Air on 22.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemTitleLabel2: UILabel!

    let imageContainer: [( image: String, description: String )] = [
        ("abstract_sky", "A beautiful sky"),
        ("butterfly", "Butterfly on a flower"),
        ("car", "A showcase in the salt valey"),
        ("Neil_Armstrong", "First man on the moon"),
        ("plane", "Touchdown in 3..2..1..."),
        ("polar_shining", "A beauty like no other"),
        ("shark", "Only strong survives"),
        ("sunset", "Is it real, or AI?"),
        ("treePond", "A pond and a tree"),
        ("tree", "Tree on top of a hill")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeImage()
    }
    
    private func randomizeImage(){
        let randomImage = imageContainer.randomElement()
        itemImageView.image = UIImage(named: randomImage!.image)
        itemTitleLabel.text = randomImage?.description
    }
    
    @IBAction func RandomizeButtonTap(_ sender: UIButton){
        randomizeImage()
    }


}
