//
//  MainWindowController.swift
//  TodoList
//
//  Created by Ibrahima Ciss on 9/19/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController, AlertShowable {
    
    private var todos: [String] = []
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var textField: NSTextField!
    
    override var windowNibName: NSNib.Name? { return "MainWindowController" }
    override var owner: AnyObject? { return self }

    override func windowDidLoad() {
        super.windowDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addButtonTapped(_ sender: NSButton) {
        let todo = textField.stringValue
        guard todo.count > 5 else {
            showAlert(title: "Todo too short", informativeText: "Please enter text > 5 characters")
            return
        }
        todos.insert(todo, at: 0)
        tableView.reloadData()
        textField.stringValue = ""
    }
    
}

extension MainWindowController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return todos[row]
    }
}


extension MainWindowController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {
        return true
    }
    
}
