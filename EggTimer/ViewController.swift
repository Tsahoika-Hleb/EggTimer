//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var player: AVAudioPlayer!
    
    @IBOutlet var progressBar: UIProgressView!
    
    var timer = Timer()
    
    var currentHardness = 0
    var seconds = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        seconds = eggTimes[sender.currentTitle!]!
        
        currentHardness = seconds
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if seconds > 0 {
            progressBar.progress = Float(currentHardness - seconds) / Float(currentHardness)
            seconds-=1
        } else {
            timer.invalidate()
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
