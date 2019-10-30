//
//  UserDefaultsManager.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import Foundation

protocol UserDataManaging {
    var count: Int { get }
    func add(colorSet: ColorSet)
    func hueFor(index: Int) -> ColorSet?
    func retrieveCurrentExperience() -> Experience
    func retrieveQueue()
    func save(experience: Experience)
}

class UserDataManager: UserDataManaging {
    
    var count: Int { hueQueue.count }
    var isEmpty: Bool { hueQueue.isEmpty }

    private var hueQueue = HueQueue<ColorSet>()
    
    init() {
        retrieveQueue()
    }
    
    func add(colorSet: ColorSet) {
        hueQueue.enqueue(colorSet)
        saveQueue()
    }
        
    func hueFor(index: Int) -> ColorSet? {
        return hueQueue.element(at: index)
    }
    
    func retrieveQueue() {
        guard
            let data = UserDefaults.standard.data(forKey: Constants.Strings.queueName),
            let hueQueue = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? HueQueue<ColorSet>
        else { return }
        self.hueQueue = hueQueue
        print(hueQueue.count)
    }
    
    func retrieveCurrentExperience() -> Experience {
        let experience = UserDefaults.standard.integer(forKey: Constants.Strings.currentExperience)
        return Experience.returnCase(from: experience)
    }
    
    func save(experience: Experience) {
        let index = Experience.returnIndex(from: experience)
        UserDefaults.standard.set(index, forKey: Constants.Strings.currentExperience)
    }
    
    func saveQueue() {
        guard
            let data = try? NSKeyedArchiver.archivedData(withRootObject: hueQueue, requiringSecureCoding: true)
        else { return }
        
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: Constants.Strings.queueName)
        
    }
    
}
