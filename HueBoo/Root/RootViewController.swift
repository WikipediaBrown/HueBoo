//
//  RootViewController.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func onCompletion()
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    private let gradient = CAGradientLayer()
    private let gradientList = GradientList()
    private let displayCount = 2
    
    private var initialColor: CGColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func animateViewControllerReplacement(viewController: UIViewController){
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
//        self.addChild(viewController)
//        self.view.insertSubview(viewController.view, belowSubview: menuView)
//        viewController.didMove(toParent: self)
//
//        let origin = CGPoint(x: 0, y: UIScreen.main.bounds.height)
//        viewController.view.frame = CGRect(origin: origin, size: UIScreen.main.bounds.size)
//
//        UIView.animate(withDuration: Constants.Root.TimeIntervals.menuSwapDuration, animations: {
//            viewController.view.center.y = UIScreen.main.bounds.height/2
//            self.currentViewController?.view.center.y = UIScreen.main.bounds.height*1.5
//            self.setNeedsStatusBarAppearanceUpdate()
//        }) { (true) in
//            self.currentViewController?.willMove(toParent: nil)
//            self.currentViewController?.view.removeFromSuperview()
//            self.currentViewController?.removeFromParent()
//            self.currentViewController = viewController
//        }
    }
    
    func present(initialColor colorSet: ColorSet) {
        initialColor = UIColor(hue: colorSet.hue, saturation: colorSet.saturation, brightness: colorSet.brightness, alpha: colorSet.alpha).cgColor
    }

    private func setupViews() {
        
        gradient.frame = UIScreen.main.bounds
        gradient.colors = gradientList.getListOfColors(displayCount)
        
        gradient.startPoint = CGPoint(x:0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.drawsAsynchronously = true
        
        view.layer.addSublayer(gradient)
        animateColors(gradient: gradient)
        
    }
    
    private func animateColors(gradient: CAGradientLayer) {
        
        gradientList.progress()
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 1
        gradientAnimation.toValue = gradientList.getListOfColors(displayCount)
        
        gradientAnimation.fillMode = .both
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.delegate = self
        
        gradient.add(gradientAnimation, forKey: "colorChange")

    }
}

extension RootViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard
            gradientList.current?.color != gradientList.current?.next?.color,
            flag == true
        else { listener?.onCompletion(); return }
        
        gradient.colors = gradientList.getListOfColors(displayCount)
        
        if let color = initialColor { gradientList.current?.color = color }
        animateColors(gradient: gradient)
    }

}


class SwapAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
