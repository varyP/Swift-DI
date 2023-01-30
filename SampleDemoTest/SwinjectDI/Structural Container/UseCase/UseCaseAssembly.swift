//
//  UseCaseAssembly.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation
import Swinject

class UseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(FetchEthereumUseCaseProtocol.self, initializer: FetchEthereumUseCase.init)
    }
    
}
