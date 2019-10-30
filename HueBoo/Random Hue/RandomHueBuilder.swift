//
//  RandomHueBuilder.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol RandomHueDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var colorManager: ColorManaging { get }
    var userDataManager: UserDataManaging { get }
}

final class RandomHueComponent: Component<RandomHueDependency> {

    lazy var colorManager: ColorManaging = { return dependency.colorManager }()
    lazy var userDataManager: UserDataManaging = { return dependency.userDataManager }()
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RandomHueBuildable: Buildable {
    func build(withListener listener: RandomHueListener) -> RandomHueRouting
}

final class RandomHueBuilder: Builder<RandomHueDependency>, RandomHueBuildable {

    override init(dependency: RandomHueDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: RandomHueListener) -> RandomHueRouting {
        let component = RandomHueComponent(dependency: dependency)
        let viewController = RandomHueViewController()
        let interactor = RandomHueInteractor(presenter: viewController, colorManager: component.colorManager, userDataManager: component.userDataManager)
        interactor.listener = listener
        return RandomHueRouter(interactor: interactor, viewController: viewController)
    }
}
