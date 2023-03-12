//
//  StructuralSwinjectViewModel.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation

protocol StructuralSwinjectViewModelProtocol {
    func didTapLoadButton()
}

class StructuralSwinjectViewModel: StructuralSwinjectViewModelProtocol {
    
    private let fetchEthereumUseCase: FetchEthereumUseCaseProtocol
    
    init(fetchEthereumUseCase: FetchEthereumUseCaseProtocol) {
        self.fetchEthereumUseCase = fetchEthereumUseCase
    }
    
    func didTapLoadButton() {
        Task {
            await fetchEthereumUseCase.fetchEthereum()
        }
    }
}
