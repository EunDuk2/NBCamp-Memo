//
//  ViewController.swift
//  Memo
//
//  Created by Eunsung on 2/26/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var controller: MemoManager = MemoManager(memoList: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        controller.loadMemoList()
        tableView.reloadData()
    }

    @IBAction func didTapPlusBarButton(_ sender: Any) {
        let alert = UIAlertControllerManager.createMemoAlert(title: "메모 추가", message: "추가할 메모를 입력해 주세요", cancelTitle: "취소", confirmTitle: "확인", confirmHandler: { text in
            self.controller.appendMemo(text: text)
            self.tableView.reloadData()
        })
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getMemoList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoTableCell") as! MemoTableCell
        
        cell.label.text = controller.getMemoText(at: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            controller.removeMemo(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
