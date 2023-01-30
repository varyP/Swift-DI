//
//  InjectSubViewController.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 24/1/23.
//

import UIKit

class InjectSubViewController: UIViewController {
    
    @Injected(\.identifier) var identifier: String
    @Injected(\.networkProvider) var network: Networking
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        makeNetworkCall()
    }
    
    func makeNetworkCall() {
        network.request(from: EthereumServiceConfiguration.ethereum) { _, _ in
            print("InjectSubViewController - API Response")
        }
    }
}
