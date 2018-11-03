//
//  MainWindowController.swift
//  Dice
//
//  Created by Ibrahima Ciss on 11/3/18.
//  Copyright © 2018 KreativeLab. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    override var windowNibName: NSNib.Name? {
        return String(describing: MainWindowController.self)
    }
    
    override var owner: AnyObject? {
        return self
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
    }
    
}
