//
//  RootInteractor.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func prepare(experience: Experience)
    func routeToPreparedExperience()
}

protocol RootPresentable: Presentable {
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    var listener: RootPresentableListener? { get set }
    func present(initialColor colorSet: ColorSet)
}

protocol RootListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?
    
    private let userDataManager: UserDataManaging
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: RootPresentable, userDataManager: UserDataManaging) {
        self.userDataManager = userDataManager
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        let experience = userDataManager.retrieveCurrentExperience()
        router?.prepare(experience: experience)
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func onInitial(colorSet: ColorSet) {
        presenter.present(initialColor: colorSet)
    }
    
    func onCompletion() {
        router?.routeToPreparedExperience()
    }
    
    func onExperienceChange(experience: Experience) {
        router?.prepare(experience: experience)
        router?.routeToPreparedExperience()
    }
    
}
