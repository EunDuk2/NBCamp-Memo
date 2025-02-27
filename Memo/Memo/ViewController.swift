//
//  ViewController.swift
//  Memo
//
//  Created by Eunsung on 2/26/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var memoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        loadData()
        tableView.reloadData()
    }
    
    func saveData() {
        UserDefaults.standard.set(memoList, forKey: "memoList")
    }
    
    func loadData() {
        if let savedMemoList = UserDefaults.standard.array(forKey: "memoList") as? [String] {
            memoList = savedMemoList
        }
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
                self.saveData()
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
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { (action, view, completionHandler) in
            self.memoList.remove(at: indexPath.row) // 데이터 삭제
            tableView.deleteRows(at: [indexPath], with: .fade) // UI에서 삭제
            completionHandler(true) // 액션 완료
        }
        
        deleteAction.backgroundColor = .red // 버튼 색상 지정
        
        // 여러 개의 액션을 설정할 수 있음 (예: 즐겨찾기 추가)
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false // 전체 스와이프 시 자동 실행
        
        return config
    }
}
