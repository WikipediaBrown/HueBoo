//
//  RandomHueRouter.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol RandomHueInteractable: Interactable {
    var router: RandomHueRouting? { get set }
    var listener: RandomHueListener? { get set }
}

protocol RandomHueViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RandomHueRouter: ViewableRouter<RandomHueInteractable, RandomHueViewControllable>, RandomHueRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: RandomHueInteractable, viewController: RandomHueViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
