//
//  RootRouter.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, RandomHueListener, SpecificHueListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func animateViewControllerReplacement(viewController: UIViewController)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    var currentRIB: ViewableRouting?

    private var component: RootComponent

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, component: RootComponent) {
        self.component = component
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func prepare(experience: Experience) {
        if let currentRIB = currentRIB { detachChild(currentRIB) }
        
        switch experience {
        case .randomHue:
            currentRIB = RandomHueBuilder(dependency: component).build(withListener: interactor)
        case .specificHue:
            currentRIB = SpecificHueBuilder(dependency: component).build(withListener: interactor)
        }
        
        guard let router = currentRIB else { return }
        attachChild(router)
    }
    
    func routeToPreparedExperience() {
        guard let router = currentRIB else { return }
        viewController.animateViewControllerReplacement(viewController: router.viewControllable.uiviewController)
    }
    
//    func routeTo(experience: Experience) {
//        switch experience {
//        case .randomHue:
//            currentRIB = RandomHueBuilder(dependency: component).build(withListener: interactor)
//            print("random")
//        case .specificHue:
//            currentRIB = SpecificHueBuilder(dependency: component).build(withListener: interactor)
//            print("specific")
//        }
//        swapChildren(router: router)
//    }

}
