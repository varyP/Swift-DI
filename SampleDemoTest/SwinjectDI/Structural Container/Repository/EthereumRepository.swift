//
//  EthereumRepository.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import Foundation

protocol EthereumRepositoryProtocol {
    func getEthereum() async
}

class EthereumRepository: EthereumRepositoryProtocol {
    func getEthereum() async {
        print("getEthereum repository")
    }
}
