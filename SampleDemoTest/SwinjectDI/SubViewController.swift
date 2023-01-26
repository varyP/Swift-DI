//
//  SubViewController.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 29/12/22.
//

import UIKit
import Swinject

class SubViewController: UIViewController {
    var service: Networking?
    let container: Container?
    
    init(container: Container) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        print("SubVC network response")
        makeNetworkCall()
    }
    
    func makeNetworkCall() {
        service?.request(from: EthereumServiceConfiguration.ethereum, completion: { _,_  in
            print("SubViewController - API Response")
        })
    }
}
