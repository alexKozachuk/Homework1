//
//  ViewController.swift
//  Homework1
//
//  Created by Sasha on 04/12/2020.
//

import UIKit

enum Function: String, CaseIterable {
    case factorialIterate = "Ітеративний Факторіал"
    case factorialRecturtion = "Рекурсивний Факторіал"
    case fibonachi = "Фібоначі"
    case pi = "Знаходження Pi"
}

// MARK: MainVC

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = Function.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: UITableViewDelegate

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailVC else {
            return
        }
        let item = dataSource[indexPath.row]
        vc.function = item
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: UITableViewDataSource

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        cell.textLabel?.text = item.rawValue
        return cell
    }
    
}
