//
//  ServiceAssembly.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation
import Swinject

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(NetworkProviding.self, initializer: NetworkProvider.init)
    }
}
