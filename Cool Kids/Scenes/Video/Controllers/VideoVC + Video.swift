//
//  VideoVC + Video.swift
//  Cool Kids
//
//  Created by Eslam on 4/15/20.
//  Copyright © 2020 ioslam. All rights reserved.
//
import UIKit

extension VideoVC {
    //MARK: - PanGesture
    @objc func PanGestureFunc(recognizer : UIPanGestureRecognizer) {
        
        switch recognizer.state {
            
            //MARK: - Pan Began
        case .began :
            Animation(to: currentState, duration: 0.5)
            for animator in animations {
                animator.pauseAnimation()
                progress = animator.fractionComplete
            }
            
            //MARK: - Pan Changed
        case .changed :
            let translation = recognizer.translation(in: self.videoView.BottomView).y
            var fraction = translation / self.videoView.BottomView!.bounds.height
            if currentState == .closed { fraction *= -1 }
            for animator in animations {
                animator.fractionComplete = fraction + progress
            }
            
            //MARK: - Pan Ended
        case .ended :
            let translation = recognizer.translation(in: self.videoView.BottomView).y
            for animator in animations {
                switch currentState {
                case .opened :
                    if translation < 32 {
                        animator.isReversed = !animator.isReversed
                    }
                case .closed :
                    if (translation * -1) < 32 {
                        animator.isReversed = !animator.isReversed
                    }
                }
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            }
        default :
            ()
        }
    }
    
    //MARK: - Begin Animation Func
    func Animation(to : State , duration : TimeInterval) {
        let state = to.opposite
        let transitionAnimation = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) { [weak self] in
            switch state {
            case .opened :
                self?.openCase()
            case .closed :
                self?.closeCase()
            }
            self?.view.layoutIfNeeded()
        }
        
        transitionAnimation.addCompletion {[weak self] (position) in
            switch position {
            case .current :
                ()
            case .start :
                self?.currentState = state.opposite
            case .end :
                self?.currentState = state
            @unknown default:
                ()
            }
            
            switch self!.currentState {
            case .opened :
                self?.openCase()
            case .closed :
                self?.closeCase()
            }
            
            self?.animations.removeAll()
        }
        
        transitionAnimation.startAnimation()
        animations.append(transitionAnimation)
    }
    
    func openCase() {
        self.videoView.BottomViewConstant!.constant = 0
        self.videoView.videoSlider!.alpha = 0
        self.videoView.Start_Pause!.alpha = 0
        self.videoView.FullLabel!.alpha = 0
        self.videoView.CurrentLabel!.alpha = 0
        self.videoView.BackWardButton!.alpha = 0
        self.videoView.ForwardButton!.alpha = 0
    }
    
    func closeCase() {
        self.videoView.BottomViewConstant!.constant = 130
        self.videoView.videoSlider!.alpha = 1
        self.videoView.Start_Pause!.alpha = 1
        self.videoView.FullLabel!.alpha = 1
        self.videoView.CurrentLabel!.alpha = 1
        self.videoView.BackWardButton!.alpha = 1
        self.videoView.ForwardButton!.alpha = 1
    }
}
