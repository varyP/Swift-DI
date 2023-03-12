//
//  ViewControllerAssembly.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation
import Swinject

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(EthereumViewController.self, initializer: EthereumViewController.init)
    }
}
