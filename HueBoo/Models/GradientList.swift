//
//  GradientList.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class GradientList {
    
    private var count: Int
    var current: GradientNode?

    init(count: Int? = nil) {
        let colors: [ColorApproximation] = [.red, .orange, .yellow, .green, .blue, .indigo, .violet]
        let head: GradientNode = GradientNode(with: colors[0])
        
        self.count = count ?? colors.count
        self.current = head
        
        for index in 1..<self.count {
            self.current?.next = GradientNode(with: colors[index])
            self.current = self.current?.next
        }
        
        self.current?.next = head
    }
    
    func progress() {
        current = current?.next
    }
    
    func getListOfColors(_ length: Int? = nil) -> [CGColor] {
        var list = [CGColor]()
        var currentNode = current
        for _ in 0..<(length ?? count) {
            guard let color = currentNode?.color else { continue }
            list.append(color)
            currentNode = currentNode?.next
        }
        return list
    }
    
}
