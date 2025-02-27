//
//  MemoController.swift
//  Memo
//
//  Created by Eunsung on 2/27/25.
//

import UIKit

class MemoController {
    private var memoList: [MemoModel]
    
    init(memoList: [MemoModel]) {
        self.memoList = memoList
    }
    
    func getMemoList() -> [MemoModel] {
        return memoList
    }
    
    func getMemoText(at index: Int) -> String? {
        guard index >= 0 && index < memoList.count else { return nil }
        return memoList[index].text
    }
    
    func appendMemo(text: String) {
        memoList.append(MemoModel(text: text))
        saveMemoList()
    }
    
    func removeMemo(at index: Int) {
        guard index >= 0 && index < memoList.count else { return }
        memoList.remove(at: index)
        saveMemoList()
    }
    
    func createMemoAlert(on viewController: UIViewController, completion: @escaping () -> Void) {
        let alert = UIAlertControllerManager.createMemoAlert(title: "메모 추가", message: "추가할 메모를 입력해 주세요", cancelTitle: "취소", confirmTitle: "확인", confirmHandler: { text in
            self.appendMemo(text: text)
            completion()
        })
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private func saveMemoList() {
        UserDefaultsManager.shared.saveCodable(self.memoList, forKey: "memoList")
    }
    
    func loadMemoList() {
        if let savedMemoList = UserDefaultsManager.shared.loadCodable(forKey: "memoList", type: [MemoModel].self) {
            self.memoList = savedMemoList
        }
    }
}
