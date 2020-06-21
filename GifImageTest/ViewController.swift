//
//  ViewController.swift
//  GifImageTest
//
//  Created by Dayakar Reddy on 20/06/20.
//  Copyright © 2020 Dayakar. All rights reserved.
//

//FIXME:- Referred links
//https://github.com/kiritmodi2702/GIF-Swift
//https://github.com/swiftgif/SwiftGif/wiki/Extended-use

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    //MARK:- Outlets and variables
    @IBOutlet weak var gifImageView: UIImageView!
    private var animatinRepeatCount = 3
    
    //MARK:- View Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadGifImage()
    }
    
    //MARK:- GIF animation
    func loadGifImage(){
        let gifImage: UIImage = UIImage.gifImageWithName("celebrations")!
        self.gifImageView.image = gifImage
        self.gifImageView.animationImages = gifImage.images;
        self.gifImageView.animationDuration = gifImage.duration;
        self.gifImageView.animationRepeatCount = self.animatinRepeatCount
        self.gifImageView.image = gifImage.images!.last;
        self.gifImageView.startAnimating()
    }
    
    func loadGifImageWithAnimation(){
        let gifImage: UIImage = UIImage.gifImageWithName("earth")!
        
        var values = [CGImage]()
        for image in gifImage.images! {
            values.append(image.cgImage!)
        }
        
        // Create animation and set SwiftGif values and duration
        let animation = CAKeyframeAnimation(keyPath: "contents")
        animation.calculationMode = .discrete
        animation.duration = gifImage.duration
        animation.values = values
        animation.repeatCount = Float(self.animatinRepeatCount)
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.delegate = self
        gifImageView.layer.add(animation, forKey: "GIF_ANIMATION")
    }
    
    //MARK:- CAAnimationDelegate Implementation
    func animationDidStart(_ anim: CAAnimation) {
        print("Animation did start...")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            print("Animation finished...")
        }
    }
}
