//
//  AppComponent.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
            
    init() {
        super.init(dependency: EmptyComponent())
    }
}
