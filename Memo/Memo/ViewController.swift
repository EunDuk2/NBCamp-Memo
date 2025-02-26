//
//  ViewController.swift
//  Memo
//
//  Created by Eunsung on 2/26/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var memoList: [String] = ["first", "second", "third"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
    }

    @IBAction func didTapPlusBarButton(_ sender: Any) {
        let alert = UIAlertController(title: "메모 추가", message: "추가할 메모를 입력해 주세요", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Type here..."
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            if let text = alert.textFields?.first?.text {
                print("Entered text: \(text)")
                self.memoList.append(text)
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoTableCell") as! MemoTableCell
        
        cell.label.text = memoList[indexPath.row]
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
