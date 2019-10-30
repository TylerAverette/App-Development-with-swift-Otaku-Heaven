//
//  ViewController.swift
//  MusicWireFrame
//
//  Created by Student User on 10/21/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    var isPlaying: Bool = true{
         didSet{
             if isPlaying {
                 playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
             } else{
                 playPauseButton.setImage(UIImage(named: "play"), for: .normal)
             }
         }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reverseBackground.layer.cornerRadius = 35.0
        reverseBackground.clipsToBounds = true
        reverseBackground.alpha = 0
        
        playPauseBackground.layer.cornerRadius = 35.0
        playPauseBackground.clipsToBounds = true
        playPauseBackground.alpha = 0
        
        forwardBackground.layer.cornerRadius = 35.0
        forwardBackground.clipsToBounds = true
        forwardBackground.alpha = 0
        // Do any additional setup after loading the view.
    }


    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if isPlaying {
            UIView.animate(withDuration: 0.5){
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        } else{
            UIView.animate(withDuration: 0.5, animations: {
                self.albumImageView.transform = CGAffineTransform.identity
            })
        }
        isPlaying.toggle()
    }
    @IBAction func touchedUpInside(_ sender: UIButton) {
        var buttonBackground: UIView
        
        switch sender{
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0.0
            buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { bool in
            buttonBackground.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func touchedDown(_ sender: UIButton) {
        let buttonBackground: UIView
        
        switch sender{
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25){
            buttonBackground.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        
    }
    
}

