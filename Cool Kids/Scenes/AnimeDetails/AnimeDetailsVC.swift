//
//  AnimeDetailsVC.swift
//  Cool Kids
//
//  Created by lodex solutions on 3/18/20.
//  Copyright © 2020 ioslam. All rights reserved.
//

import UIKit

class AnimeDetailsVC: UIViewController {
    lazy var scrollView : UIScrollView = {
       var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    lazy var containerView : UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var scrollViewHeight : NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.layoutUserInterface()
    }
    private func addSubView(){
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.containerView)
    }
    private func layoutUserInterface() {
        self.addSubView()
        self.layoutScrollView()
        self.layoutContainerView()
    }
    private func layoutScrollView(){
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    private func layoutContainerView(){
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        ])
        self.scrollViewHeight = self.containerView.heightAnchor.constraint(equalToConstant: 2000)
        self.scrollViewHeight?.isActive = true
    }
//    override func viewDidAppear(_ animated: Bool) {
//        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3) {
//            self.scrollViewHeight?.isActive = false
//            self.scrollViewHeight = self.containerView.heightAnchor.constraint(equalToConstant: 1000)
//            self.scrollViewHeight?.isActive = true
//
//        }
//    }
    

  

}
