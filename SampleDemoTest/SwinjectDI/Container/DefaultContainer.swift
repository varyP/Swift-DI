//
//  DefaultContainer.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 29/12/22.
//

import Swinject

class DefaultContainer {
    
    static let sharedContainer = DefaultContainer()
    
    let container = Container()
    
    private init() {
        setupDefaultContainers()
    }
    
    private func setupDefaultContainers() {
        
        container.register(Networking.self, factory: { _ in
            print("Will resolve HTTPNetworking")
            return HTTPNetworking()
        })
        
    }
}

