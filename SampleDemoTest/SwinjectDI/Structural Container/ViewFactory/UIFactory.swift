//
//  UIFactory.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import UIKit
import Swinject

protocol UIFactoryProtocol {
    func resolveViewController<T: UIViewController>(_ type: T.Type) -> T?
}

class UIFactory: UIFactoryProtocol {
    
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func resolveViewController<T: UIViewController>(_ type: T.Type) -> T? {
        return resolver.resolve(type)
    }
}

class UIFactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UIFactoryProtocol.self) { resolver in
            UIFactory(resolver: resolver)
        }
    }
}
