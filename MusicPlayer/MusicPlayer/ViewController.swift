//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Macbook Air on 30.10.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackText: UILabel!
    var player: AVAudioPlayer?
    var isPlaying = false
    let trackList: [String] = ["abstract", "cascade", "groovy", "night", "point"]
    var currentTrackIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrack( name: trackList [ currentTrackIndex ] )
    }

    @IBAction private func ButtonForward(_ sender: UIButton){
        if ( currentTrackIndex == trackList.count - 1 ){
            currentTrackIndex = 0
            loadTrack( name: trackList [ currentTrackIndex ] )
        }
        else{
            currentTrackIndex += 1
            loadTrack(name: trackList[currentTrackIndex])
        }
    }
    @IBAction private func ButtonBack(_ sender: UIButton){
        if ( currentTrackIndex == 0){
            currentTrackIndex = trackList.count - 1
            loadTrack( name: trackList [ currentTrackIndex ] )
        }
        else{
            currentTrackIndex -= 1
            loadTrack(name: trackList[currentTrackIndex])
        }
    }
    @IBAction private func ButtonPlay(_ sender: UIButton){
        if ( isPlaying ){
            player?.stop()
            isPlaying = false
        }
        else{
            player?.play()
            isPlaying = true
        }
    }
    private func loadTrack(name: String){
        isPlaying = true
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3")
        else {
            return
        }
        guard let url2 = Bundle.main.url(forResource: name, withExtension: "png")
        else {
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
        trackImageView.image = UIImage(contentsOfFile: url2.path)
        trackText.text = name
    }

}
