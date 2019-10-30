//
//  SpecificHueViewController.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol SpecificHuePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SpecificHueViewController: UIViewController, SpecificHuePresentable, SpecificHueViewControllable {

    weak var listener: SpecificHuePresentableListener?
}
