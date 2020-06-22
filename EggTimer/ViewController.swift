//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
//importing this so that we can play music
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    var totalTime = 0
    var secondPassed = 0
    
    var timer = Timer()
   
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats:true)
        
    }
    
    @objc func updateTimer(){
        if secondPassed <= totalTime{
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
            secondPassed += 1
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound" , withExtension: ".mp3")
                   player = try! AVAudioPlayer(contentsOf: url!)
                   player.play()
        }
    }
    
}
