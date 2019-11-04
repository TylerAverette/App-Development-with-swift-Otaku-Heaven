//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Student User on 11/4/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nasaImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        photoInfoController.fetchPhotoInfo{ (photoInfo) in
            if let photoInfo = photoInfo{
                self.updateUI(with: photoInfo)
            }
        }
    }


   func updateUI(with photoInfo: PhotoInfo) {
    guard let url = photoInfo.url.withHTTPS() else { return }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data,
            let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.title = photoInfo.title
                self.descriptionLabel.text = photoInfo.description
                
                if let copyright = photoInfo.copyright {
                    self.copyrightLabel.text = "Copyright© \(copyright)"
                } else {
                    self.copyrightLabel.isHidden = true
                }
                
                self.nasaImage.image = image
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
        task.resume()
    }// updateUI
}

