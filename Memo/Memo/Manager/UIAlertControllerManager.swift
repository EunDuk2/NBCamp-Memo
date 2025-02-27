//
//  UIAlertControllerManager.swift
//  Memo
//
//  Created by Eunsung on 2/27/25.
//

import UIKit

class UIAlertControllerManager {
    
    static func createMemoAlert(title: String, message: String?, cancelTitle: String, confirmTitle: String, confirmHandler: @escaping ((String) -> Void)) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Type here..."
        }
        
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default, handler: {_ in 
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                confirmHandler(text)
            }
        })
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        return alert
    }
}
