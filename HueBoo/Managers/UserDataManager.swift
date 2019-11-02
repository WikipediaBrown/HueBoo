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
    func recentHue() -> ColorSet?
    func retrieveCurrentExperience() -> Experience
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
    
    func recentHue() -> ColorSet? {
        return hueQueue.back
    }
    
    func removeAll() {
        hueQueue.removeAll()
        saveQueue()
    }
    
    private func retrieveQueue() {
        guard
            let data = UserDefaults.standard.data(forKey: Constants.Strings.queueName),
            let hueQueue = try? JSONDecoder().decode(HueQueue<ColorSet>.self, from: data)
        else { return }
        
        self.hueQueue = hueQueue
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
        guard let data = try? JSONEncoder().encode(hueQueue) else { return }
        UserDefaults.standard.set(data, forKey: Constants.Strings.queueName)
        UserDefaults.standard.synchronize()
    }
    
}
