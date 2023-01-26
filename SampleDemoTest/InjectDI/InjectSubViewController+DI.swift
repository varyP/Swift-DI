//
//  InjectSubViewController+DI.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 24/1/23.
//

import Foundation

extension InjectedValues {
    var identifier: String {
        get { Self[IDKey.self] }
        set { Self[IDKey.self] = newValue }
    }
}

private struct IDKey: InjectionKey {
    static var currentValue: String = "RecommendationService()"
}


private struct NetworkProviderKey: InjectionKey {
    static var currentValue: Networking = HTTPNetworking()
}

extension InjectedValues {
    var networkProvider: Networking {
        get { Self[NetworkProviderKey.self] }
        set { Self[NetworkProviderKey.self] = newValue }
    }
}
