//
//  MemoManager.swift
//  Memo
//
//  Created by Eunsung on 2/27/25.
//

import UIKit

class MemoManager {
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
    
    private func saveMemoList() {
        UserDefaultsManager.shared.saveCodable(self.memoList, forKey: "memoList")
    }
    
    func loadMemoList() {
        if let savedMemoList = UserDefaultsManager.shared.loadCodable(forKey: "memoList", type: [MemoModel].self) {
            self.memoList = savedMemoList
        }
    }
}
