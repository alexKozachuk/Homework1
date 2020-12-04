//
//  DetailVC.swift
//  Homework1
//
//  Created by Sasha on 04/12/2020.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var label: UILabel!
    let math = MathService.share
    var function: Function?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    func setupNavBar() {
        guard let function = function else { return }
        navigationItem.title = function.rawValue
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let function = function else { return }
        guard let text = textFiled.text else { return }
        guard let number = Int(text) else { return }
        var answer = ""
        
        switch function {
        case .factorialIterate:
            answer = "\(math.factorialIterate(n: number))"
        case .factorialRecturtion:
            answer = "\(math.factorialRecurtion(n: number))"
        case .fibonachiIterate:
            answer = "\(math.fibonachiIterate(n: number))"
        case .fibonachiRecturtion:
            answer = "\(math.fibonachiRecurtion(n: number))"
        case .pi:
            answer = "\(math.pi(n: number))"
        }
        label.alpha = 0
        UIView.animate(withDuration: 1) { [weak self] in
            self?.label.alpha = 1
            self?.label.text = answer
        }
        
    }
    
}
