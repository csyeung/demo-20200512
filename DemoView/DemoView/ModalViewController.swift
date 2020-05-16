//
// Created by Jonathan YEUNG on 16/5/2020.
// DemoView
// Copyright © 2020 Jonathan Yeung. All rights reserved.
// 

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var summaryLabel: UILabel!
    var summary: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.summaryLabel.text = self.summary
        
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissScreen))
        self.view.addGestureRecognizer(tapScreen)
    }
    
    @objc func dismissScreen() {
        self.dismiss(animated: false, completion: nil)
    }
}
