//
//  AlertMessages.swift
//  Cool Kids
//
//  Created by Eslam on 4/5/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class Alert {
    static let activityVC = UIViewController()
    init() {
        initActivityIndicator()
    }
    static func alertMessageToast(message:String , inView: UIViewController)
    {
        let alert = UIAlertController(title: message ,
                                      message:nil , preferredStyle: .alert)
        let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        
        let _ = keyWindow!.rootViewController! as UIViewController
        inView.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2))
        {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    static func showAlert(message: String,title:String, inView: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "تم", style: .default, handler: nil))
        inView.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - display "no internet connection message" to the user when no connection
    static func noInternetConnection(_ inView: UIViewController,_ completion: @escaping () ->()) {
        let alert = UIAlertController(title: "خطأ", message: Constants.no_internet, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "تم", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "حاول مجددا", style: .default, handler: { (alert) in
            completion()
        }))
        inView.present(alert, animated: true, completion: nil)
    }
    
    static func connectionFaildAlert(inView: UIViewController) {
        let alert = UIAlertController(title: "خطأ", message: "يوجد مشكلة فى الوصول الى API", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "تم" , style: .default, handler: nil))
        inView.present(alert, animated: true, completion: nil)
    }
    
    func initActivityIndicator() {
        Alert.activityVC.view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        Alert.activityVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height:80))
        //loadingIndicator.activityIndicatorViewStyle = .UIActivityIndicatorView.Style.large
        loadingIndicator.style = .large
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating();
        
        let myView : UIView = UIView()
        let label = UILabel.init(frame: CGRect(x: 5, y: 70, width: 100, height: 20))
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textAlignment = NSTextAlignment.center
        label.text = " إنتظار...."
        
        myView.frame = CGRect(x: (UIScreen.main.bounds.size.width - 100)/2, y: (UIScreen.main.bounds.size.height - 100)/2, width: 100, height: 100)
        
        myView.backgroundColor = UIColor.init(white: 0.0, alpha: 0.7)
        myView.layer.cornerRadius = 5
        myView.addSubview(loadingIndicator)
        myView.addSubview(label)
        myView.isHidden = false
        Alert.activityVC.view.addSubview(myView)
    }
    

}
