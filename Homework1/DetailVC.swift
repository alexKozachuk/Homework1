//
//  DetailVC.swift
//  Homework1
//
//  Created by Sasha on 04/12/2020.
//

import UIKit

// MARK: DetailVC

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
        case .fibonachi:
            answer = math.fibonachi(n: number).map { String($0) }.joined(separator: ", ")
        case .pi:
// 1 Спосіб
//          var string = String(format: "%.\(number + 1)f", math.pi(n: 1000))
//          string.removeLast()
//          guard let item = string.last else { return }
//          answer = String(item)
// 2 Спосіб
            var item = math.pi(n: 1000)
            for _ in 0..<number {
                item *= 10
            }
            answer = "\(Int(item) % 10)"
        }
        label.alpha = 0
        label.text = answer
        UIView.animate(withDuration: 1) { [weak self] in
            self?.label.alpha = 1
        }
        
    }
    
}
