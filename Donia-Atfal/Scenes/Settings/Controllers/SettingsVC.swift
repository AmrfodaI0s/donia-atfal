//
//  SettingsVC.swift
//  Cool Kids
//
//  Created by lodex solutions on 2/12/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit
 
class SettingsVC: UIViewController {
    
    @IBOutlet var settingsView: SettingsView!
    
    //MARK: - ViewDidLoad - viewDidDisappear - viewWillAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let switching = settingsView.NightMode_Switch {
            switching.addTarget(self, action: #selector(switchNightMode(_:)), for: .valueChanged)
        }
        if let sharebtn = settingsView.ShareBtn {
            sharebtn.addTarget(self, action: #selector(shareApp), for: .touchUpInside)
        }
        

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "الاعدادات"
        Theme_Color()

    }

    
    //MARK: - Share App
    @objc func shareApp() {
        view.isUserInteractionEnabled = false
        let url = "https://www.youtube.com/watch?v=8JSdy3nLLYA&list=PLVYplv54QxwBDYx_QJ267WyFoNrWMFBYv&index=6&t=0s"
        let activitycontroller = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(activitycontroller , animated: true , completion: nil)
        view.isUserInteractionEnabled = true
    }
    
    //MARK: - Notification Switch
    @objc func switchNightMode(_ sender: UISwitch) {
        if sender.isOn == true {
            settingsView.NightMode_Switch?.thumbTintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
           Theme.current = Dark_Theme()
            settingsView.NightMode_Switch?.thumbTintColor = Theme.current.Episode_Detail
            navigationController?.navigationBar.barStyle = .default
        } else {
            settingsView.NightMode_Switch?.thumbTintColor = #colorLiteral(red: 0.7877369523, green: 0.7877556682, blue: 0.7877456546, alpha: 1)
            Theme.current = Light_Theme()
            settingsView.NightMode_Switch?.thumbTintColor = Theme.current.R_Text
            navigationController?.navigationBar.barStyle = .black
        }
        viewWillAppear(true)
    }
    
    //MARK: - Night Mode Switch
    @objc func NotificationSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            Theme.current = Dark_Theme()
            settingsView.NightMode_Switch?.thumbTintColor = Theme.current.Episode_Detail
            navigationController?.navigationBar.barStyle = .default
        } else {
            Theme.current = Light_Theme()
            settingsView.NightMode_Switch?.thumbTintColor = Theme.current.R_Text
            navigationController?.navigationBar.barStyle = .black
        }
        viewWillAppear(true)
        self.navigationController?.viewWillLayoutSubviews()
    }
    
    //MARK: - Theme Colors
    private func Theme_Color() {
        //BG
        settingsView.backgroundColor = Theme.current.BG_Color
        //Labels
        settingsView.AboutLabel?.textColor = Theme.current.White_Text
        settingsView.ShareLabel?.textColor = Theme.current.White_Text
        settingsView.RateLabel?.textColor = Theme.current.White_Text
        settingsView.SettingsLabel?.textColor = Theme.current.White_Text
        settingsView.NotificationLabel?.textColor = Theme.current.White_Text
        settingsView.NightModeLabel?.textColor = Theme.current.White_Text
        //Views
        settingsView.NightModeView?.backgroundColor = Theme.current.Settings_Views
        settingsView.NotificationView?.backgroundColor = Theme.current.Settings_Views
        settingsView.ShareView?.backgroundColor = Theme.current.Settings_Views
        settingsView.RateView?.backgroundColor = Theme.current.Settings_Views
        //Images
        settingsView.ShareBtn?.tintColor = Theme.current.Image_Tint
        settingsView.RateBtn?.tintColor = Theme.current.Image_Tint
        //Switches
        settingsView.Notification_Switch?.onTintColor = Theme.current.Switch_Back_On
        settingsView.Notification_Switch?.tintColor = Theme.current.Switch_back
        if settingsView.Notification_Switch?.isOn == true {
            settingsView.Notification_Switch?.thumbTintColor = Theme.current.Episode_Detail
        } else {
            settingsView.Notification_Switch?.thumbTintColor = Theme.current.R_Text
        }
        if settingsView.NightMode_Switch?.isOn == true {
            settingsView.NightMode_Switch?.thumbTintColor = Theme.current.Episode_Detail
        } else {
            settingsView.NightMode_Switch?.thumbTintColor = Theme.current.R_Text
        }
        settingsView.NightMode_Switch?.onTintColor = Theme.current.Switch_Back_On
        settingsView.NightMode_Switch?.tintColor = Theme.current.Switch_back
        //TabBar
        self.tabBarController?.tabBar.barTintColor = Theme.current.Settings_Views

    }
    
}

