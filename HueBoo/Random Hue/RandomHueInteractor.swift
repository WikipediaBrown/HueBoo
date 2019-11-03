//
//  RandomHueInteractor.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift

protocol RandomHueRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol RandomHuePresentable: Presentable {
    var listener: RandomHuePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func insertColorSet(at indexPath: IndexPath)
}

protocol RandomHueListener: class {
    func onInitial(colorSet: ColorSet)
    func onExperienceChange(experience: Experience)
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RandomHueInteractor: PresentableInteractor<RandomHuePresentable>, RandomHueInteractable, RandomHuePresentableListener {

    weak var router: RandomHueRouting?
    weak var listener: RandomHueListener?

    private let colorManager: ColorManaging
    private let userDataManager: UserDataManaging
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: RandomHuePresentable, colorManager: ColorManaging, userDataManager: UserDataManaging) {
        self.colorManager = colorManager
        self.userDataManager = userDataManager
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        getRecentHue()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
        
    func onHeroTile() {
        let indexPath = IndexPath(item: userDataManager.count, section: 0)
        let colorSet = colorManager.getRandomColor()
        userDataManager.add(colorSet: colorSet)
        presenter.insertColorSet(at: indexPath)
    }
    
    func onSpecificHue() {
        listener?.onExperienceChange(experience: .specificHue)
    }
    
    func colorSet(at indexPath: IndexPath) -> ColorSet? {
        guard indexPath.item < userDataManager.count else { return nil }
        return userDataManager.hueFor(index: indexPath.item)
    }
    
    func onCountRequest() -> Int {
        return userDataManager.count
    }
    
    private func getRecentHue() {
        if let colorSet = userDataManager.recentHue() {
            listener?.onInitial(colorSet: colorSet)
        } else {
            userDataManager.add(colorSet: colorManager.getRandomColor())
            guard let colorSet = userDataManager.recentHue() else { return }
            listener?.onInitial(colorSet: colorSet)
        }
    }
}
