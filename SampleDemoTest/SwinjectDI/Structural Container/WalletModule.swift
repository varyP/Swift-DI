//
//  WalletModule.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation
import Swinject

class OKGWalletModule {
    static let shared = OKGWalletModule()
    
    /**
     Some benefits of this approach:
     
     Containers enable different object scope to be defined. In this example:
     - Services are .container scoped => same instance can be returned for all resolving under the same container.
     - Other layers like repositories etc are transient, as desired.
     
     The hierarchy (parent-child relationship) is set up so that the code structure is forced to be layered. In this case:
     - repositories instances can not depend on any use case instances
     - use cases cannot depend on view models
     - view models cannot depend on view controllers
     
     The assembler approach also enables the clustering of relevant codes while separating distant code from each other.
     
     The UIFactory is designed for cases that if a view controller needs to resolve another view controller internally, it's able to do so by having the factory injected. See `EthereumViewController` for example. Of course, it could have been solved with the router pattern, which is not discussed here.
     */
    private let serviceAssembler = Assembler([
        ServiceAssembly()
    ], parent: nil, defaultObjectScope: .container)
    
    private lazy var repositoryAssembler = Assembler(
        [RepositoryAssembly()],
        parent: serviceAssembler,
        defaultObjectScope: .transient
    )
    
    private lazy var usecaseAssembler = Assembler(
        [UseCaseAssembly()],
        parent: repositoryAssembler,
        defaultObjectScope: .transient
    )
    
    private lazy var viewModelAssembler = Assembler(
        [ViewModelAssembly()],
        parent: usecaseAssembler,
        defaultObjectScope: .transient
    )
    
    private lazy var viewControllerAssembler = Assembler(
        [UIFactoryAssembly(), ViewControllerAssembly()],
        parent: viewModelAssembler,
        defaultObjectScope: .transient
    )
    
    var uiFactory: UIFactoryProtocol {
        return UIFactory(resolver: viewControllerAssembler.resolver)
    }
}
