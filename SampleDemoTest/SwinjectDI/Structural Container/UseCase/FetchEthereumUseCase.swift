//
//  FetchEthereumUseCase.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation

protocol FetchEthereumUseCaseProtocol {
    func fetchEthereum() async
}

class FetchEthereumUseCase: FetchEthereumUseCaseProtocol {
    
    private let ethereumRepository: EthereumRepositoryProtocol
    
    init(ethereumRepository: EthereumRepositoryProtocol) {
        self.ethereumRepository = ethereumRepository
    }
    
    func fetchEthereum() async {
        await ethereumRepository.getEthereum()
    }
}
