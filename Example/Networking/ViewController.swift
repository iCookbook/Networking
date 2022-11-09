//
//  ViewController.swift
//  Networking
//
//  Created by htmlprogrammist on 11/03/2022.
//  Copyright (c) 2022 htmlprogrammist. All rights reserved.
//

import UIKit
import Networking

class ViewController: UIViewController {
    
    private lazy var textView = UITextView(frame: view.bounds)
    
    private let networkManager: NetworkManagerProtocol = NetworkManager(session: URLSession(configuration: URLSessionConfiguration.default))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = NetworkRequest(endpoint: Endpoint.random())
        networkManager.getResponse(request: request) { [unowned self] (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.textView.text = "\(response)"
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.textView.text = error.localizedDescription
                }
            }
        }
    }
}
