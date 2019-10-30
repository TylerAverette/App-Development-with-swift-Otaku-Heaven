//
//  ViewController.swift
//  AppEventCount
//
//  Created by Student User on 8/26/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLaunching: UILabel!
    @IBOutlet weak var willResignActive: UILabel!
    @IBOutlet weak var didEnterBackground: UILabel!
    @IBOutlet weak var willEnterForeground: UILabel!
    @IBOutlet weak var didBecomeActive: UILabel!
    @IBOutlet weak var willTerminate: UILabel!
    
    var launchCount = 0
    var resignActive = 0
    var enterBackground = 0
    var enterForeground = 0
    var becameActive = 0
    var terminated = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateView(){
        didFinishLaunching.text = "The app has launches \(launchCount) time(s)"
        willResignActive.text = "The app has resigned active \(resignActive) time(s)"
        didEnterBackground.text = "The app has entered the background \(enterBackground) time(s)"
        willEnterForeground.text = "The app has entered the foreground \(enterForeground) time(s)"
        didBecomeActive.text = "The app has became active \(becameActive) time(s)"
        willTerminate.text = "The app has been terminated \(terminated) time(s)"
    }

}

