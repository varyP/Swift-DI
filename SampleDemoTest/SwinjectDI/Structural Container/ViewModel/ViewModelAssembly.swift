//
//  ViewModelAssembly.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(StructuralSwinjectViewModelProtocol.self, initializer: StructuralSwinjectViewModel.init)
    }
}
