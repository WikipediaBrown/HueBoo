//
//  RootBuilder.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootComponent: Component<RootDependency>, RandomHueDependency, SpecificHueDependency {
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    lazy var colorManager: ColorManaging = ColorManager()
    lazy var userDataManager: UserDataManaging = {
        let manager = UserDataManager()
        if manager.isEmpty {
            manager.add(colorSet: colorManager.getRandomColor())
        }
        return manager
    }()
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController, userDataManager: component.userDataManager)
        return RootRouter(interactor: interactor, viewController: viewController, component: component)
    }
}
