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
    func setBackGroundColor(with colorSet: ColorSet?)
    func setHexText(with string: String?)
    func setRGBText(with string: String?)
}

protocol SpecificHueListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func onInitial(colorSet: ColorSet)
    func onExperienceChange(experience: Experience)
}

final class SpecificHueInteractor: PresentableInteractor<SpecificHuePresentable>, SpecificHueInteractable, SpecificHuePresentableListener {
    
    weak var router: SpecificHueRouting?
    weak var listener: SpecificHueListener?
    weak var colorManager: ColorManaging?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: SpecificHuePresentable, colorManager: ColorManaging) {
        self.colorManager = colorManager
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
    
    func onNewHexValue(currentString: String?, range: NSRange, string: String) -> Bool {
        guard range.location != 0, ((currentString?.count ?? 0) + string.count) <= 7 else {return false}
        
        let hexString = ((currentString ?? "") as NSString).replacingCharacters(in: range, with: string)
        let colorSet = colorManager?.getColorSetFromHex(hexString: hexString)
        let rgbString = colorManager?.getRGBFromHex(hexString: hexString)
        
        presenter.setBackGroundColor(with: colorSet)
        presenter.setHexText(with: hexString)
        presenter.setRGBText(with: rgbString)
        
        return true
    }
    
    func onNewRGBValue(currentString: String?, range: NSRange, string: String) -> Bool {
        return false
    }

    func onRandomHue() {
        listener?.onExperienceChange(experience: .randomHue)
    }
}
