//
//  SpecificHueInteractor.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift

protocol SpecificHueRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SpecificHuePresentable: Presentable {
    var listener: SpecificHuePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SpecificHueListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func onInitial(colorSet: ColorSet)
    func onExperienceChange(experience: Experience)
}

final class SpecificHueInteractor: PresentableInteractor<SpecificHuePresentable>, SpecificHueInteractable, SpecificHuePresentableListener {

    weak var router: SpecificHueRouting?
    weak var listener: SpecificHueListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SpecificHuePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func onRandomHue() {
        listener?.onExperienceChange(experience: .randomHue)
    }
}
