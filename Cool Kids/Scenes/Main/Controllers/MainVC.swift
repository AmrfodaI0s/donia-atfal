//
//  ViewController.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/10/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
import Lottie

class MainVC: UIViewController {
    
    @IBOutlet weak var splach_view: AnimationView!
    @IBOutlet weak var startBtnTapped: UIButton!
    @IBOutlet weak var splash_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Invoke IBAction for the "start" Button
        startBtnTapped.addTarget(self, action: #selector(goToVC), for: .touchUpInside)
        //MARK: - save Device frame to jusify the tabBar Height by
        Helper.saveUserDefaults(height: self.view.frame.size.height)
        
        //MARK: - Invoke Lottie Animation method
        setLottieAnimation()
        // hide all the layout when the lottie view is running
        showHideSplashLayout(state: true, color: #colorLiteral(red: 0.2078431373, green: 0.2274509804, blue: 0.3137254902, alpha: 1))
        //MARK: - Timer to show all layouts since lottie is loaded
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.showHideSplashLayout(state: false, color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        }
    }
    
}
extension MainVC {
    //MARK: - if "start" button Pressed go to SuperVC
    @objc func goToVC() {
        let SB = UIStoryboard(name: "Main", bundle: nil)
        let VC = SB.instantiateViewController(withIdentifier: "discoveryBar")
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true)
    }
    //MARK: -  Show & Hide IBoutlets by Lottie Loading
    func showHideSplashLayout(state: Bool, color: UIColor) {
        startBtnTapped.isHidden = state ? true : false
        splash_label.isHidden = state ? true : false
        splach_view.isHidden = state ? false : true
        view.backgroundColor = color
    }
    //MARK: - declare lottie's settings
    func setLottieAnimation() {
        // set the lottie's json file-name
        let animation = Animation.named("bus")
        splach_view.animation = animation
        splach_view.layer.cornerRadius = 25
        splach_view.animationSpeed = 1
        splach_view.play()
    }
    
}
