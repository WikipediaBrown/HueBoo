//
//  SpecificHueBuilder.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

protocol SpecificHueDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var colorManager: ColorManaging { get }
}

final class SpecificHueComponent: Component<SpecificHueDependency> {
    lazy var colorManager: ColorManaging = { return dependency.colorManager }()
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SpecificHueBuildable: Buildable {
    func build(withListener listener: SpecificHueListener) -> SpecificHueRouting
}

final class SpecificHueBuilder: Builder<SpecificHueDependency>, SpecificHueBuildable {

    override init(dependency: SpecificHueDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SpecificHueListener) -> SpecificHueRouting {
        let component = SpecificHueComponent(dependency: dependency)
        let viewController = SpecificHueViewController()
        let interactor = SpecificHueInteractor(presenter: viewController, colorManager: component.colorManager)
        interactor.listener = listener
        return SpecificHueRouter(interactor: interactor, viewController: viewController)
    }
}
