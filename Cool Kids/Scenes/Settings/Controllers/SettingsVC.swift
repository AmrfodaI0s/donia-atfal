//
//  SettingsVC.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/12/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
 
class SettingsVC: UIViewController {
    
    //Outlets
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var NotificationView: UIView!
    @IBOutlet weak var NightModeView: UIView!
    @IBOutlet weak var ShareView: UIView!
    @IBOutlet weak var RateView: UIView!
    @IBOutlet weak var SettingsLabel: UILabel!
    @IBOutlet weak var NotificationLabel: UILabel!
    @IBOutlet weak var NightModeLabel: UILabel!
    @IBOutlet weak var AboutLabel: UILabel!
    @IBOutlet weak var ShareLabel: UILabel!
    @IBOutlet weak var RateLabel: UILabel!
    @IBOutlet weak var ShareImage: UIImageView!
    @IBOutlet weak var RateImage: UIImageView!
    @IBOutlet weak var Notification_Switch: UISwitch!
    @IBOutlet weak var NightMode_Switch: UISwitch!
    
    //MARK: - ViewDidLoad - viewDidDisappear - viewWillAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        Add_Share_Gesture()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "الاعدادات"
    }

    
    //MARK: - Adding Gestures To Views
    private func Add_Share_Gesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(share_app))
        ShareView.addGestureRecognizer(gesture)
    }
    
    //MARK: - Share App
    @objc func share_app() {
        view.isUserInteractionEnabled = false
        let url = "https://www.youtube.com/watch?v=8JSdy3nLLYA&list=PLVYplv54QxwBDYx_QJ267WyFoNrWMFBYv&index=6&t=0s"
        let activitycontroller = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(activitycontroller , animated: true , completion: nil)
        view.isUserInteractionEnabled = true
    }
    
    //MARK: - Notification Switch
    @IBAction func NotificationSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            print("Notification ON")
            //Notification_Switch.thumbTintColor = Theme.current.Episode_Detail
        } else {
            print("Notification OFF")
            //Notification_Switch.thumbTintColor = Theme.current.R_Text
        }
    }
    
    //MARK: - Night Mode Switch
    @IBAction func NightModeSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            Theme.current = Dark_Theme()
            NightMode_Switch.thumbTintColor = Theme.current.Episode_Detail
            navigationController?.navigationBar.barStyle = .default
        } else {
            Theme.current = Light_Theme()
            NightMode_Switch.thumbTintColor = Theme.current.R_Text
            navigationController?.navigationBar.barStyle = .black
        }
        viewWillAppear(true)
        self.navigationController?.viewWillLayoutSubviews()
    }
    
    //MARK: - Theme Colors
    private func Theme_Color() {
 print(90)
    }
    
    
    
}

