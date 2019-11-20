//
//  SoundPlay.swift
//  SoundPlay
//
//  Created by Donald Yessick on 9/18/18.
//  Copyright © 2018 Donald Yessick. All rights reserved.
//

import UIKit
//Add the following import for sound (and video) support
import AVFoundation
class SoundPlay: UIViewController {
    //declare a player (? because instantiation can fail)
    var mySoundEffect: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //this function will set up the sound player
        setupSound()
    }
    /*
     Instatiating the sound will require connecting the sound file with the player. This will fail if the sound file is missing, corrupt, invalide codec, etc...
    */
    func setupSound(){
        //I just put the sound file in the project next to my swift file, in this case the file is mySound.mp3
        let soundeffectPath = Bundle.main.url(forResource: "mySound", withExtension: "mp3")
        //TRY to instantiate the player
        do {
            mySoundEffect = try AVAudioPlayer(contentsOf: soundeffectPath!)
        }
        //if an error is thrown we can generate a hopefully helpful message
        catch {
            print("sound failed: \(error)")
        }
    }
    /*
     use the sound file
     this will crash if the sound player (mySoundEffect) failed to instantiate
    */
    @IBAction func playSound(_ sender: UIButton) {
        //make sure the sound plays fromn the beginning
        mySoundEffect!.currentTime = 0
        //play the sound (this is asynchronous, multiple players can play at once)
        mySoundEffect!.play()
        //does not wait for sound to finish (that's what we mean by asynchronous)
    }
}

