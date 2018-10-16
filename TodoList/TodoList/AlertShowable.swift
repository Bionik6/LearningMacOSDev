//
//  AlertShowable.swift
//  TodoList
//
//  Created by Ibrahima Ciss on 9/19/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa

protocol AlertShowable: AnyObject {
    func showAlert(title: String, informativeText: String)
}

extension AlertShowable where Self: NSWindowController {
    func showAlert(title: String, informativeText: String) {
        let alert = NSAlert()
        alert.informativeText = informativeText
        alert.messageText = title
        guard let window = self.window else { return }
        alert.beginSheetModal(for: window, completionHandler: nil)
    }
}
