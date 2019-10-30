//
//  SpecificHueRouter.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol SpecificHueInteractable: Interactable {
    var router: SpecificHueRouting? { get set }
    var listener: SpecificHueListener? { get set }
}

protocol SpecificHueViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SpecificHueRouter: ViewableRouter<SpecificHueInteractable, SpecificHueViewControllable>, SpecificHueRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SpecificHueInteractable, viewController: SpecificHueViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
