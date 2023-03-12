//
//  RepositoryAssembly.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(EthereumRepositoryProtocol.self, initializer: EthereumRepository.init)
    }
}
