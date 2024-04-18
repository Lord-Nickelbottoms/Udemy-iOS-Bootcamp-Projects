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
    
    @IBOutlet var eggStateLabel: UILabel!
    @IBOutlet var eggProgress: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var audioPlayer: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        eggProgress.progress = 0.0
        secondsPassed = 0
        
        let hardnessSelected = sender.currentTitle!
        eggStateLabel.text = hardnessSelected
        
        totalTime = eggTimes[hardnessSelected]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownTimer), userInfo: nil, repeats: true)
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func countdownTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            print(percentageProgress)
            eggProgress.progress = percentageProgress
        } else {
            timer.invalidate()
            eggStateLabel.text = "DONE!"
            playSound()
        }
    }
}
