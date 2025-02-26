//
//  ViewController.swift
//  Memo
//
//  Created by Eunsung on 2/26/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
    }

    @IBAction func didTapPlusBarButton(_ sender: Any) {
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoTableCell") as! MemoTableCell
        
        cell.label.text = "Hello, World!"
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
