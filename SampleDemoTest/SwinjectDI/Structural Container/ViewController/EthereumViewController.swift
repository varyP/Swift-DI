//
//  EthereumViewController.swift
//  SampleDemoTest
//
//  Created by Wang Kunzhen on 30/1/23.
//

import UIKit

class EthereumViewController: UIViewController {
    
    private let viewModel: StructuralSwinjectViewModelProtocol
    private let uiFactory: UIFactoryProtocol
    
    init(uiFactory: UIFactoryProtocol, viewModel: StructuralSwinjectViewModelProtocol) {
        self.viewModel = viewModel
        self.uiFactory = uiFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let tapGR = UITapGestureRecognizer()
        tapGR.addTarget(self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGR)
    }
    
    @objc
    private func didTapView() {
        viewModel.didTapLoadButton()
        
        guard let vc = uiFactory.resolveViewController(EthereumViewController.self) else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
