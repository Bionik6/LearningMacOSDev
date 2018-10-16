//
//  MainWindowController.swift
//  RGBWellBindings
//
//  Created by Ibrahima Ciss on 10/14/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @objc dynamic private var rValue: CGFloat = 1.0 { didSet { updateColor() } }
    @objc dynamic private var gValue: CGFloat = 0.5 { didSet { updateColor() } }
    @objc dynamic private var bValue: CGFloat = 0.0 { didSet { updateColor() } }
    
    @objc dynamic private lazy var color = NSColor(calibratedRed: rValue, green: gValue, blue: bValue, alpha: 1.0)
    
    func updateColor() {
        self.color = NSColor(calibratedRed: rValue, green: gValue, blue: bValue, alpha: 1.0)
    }
    
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
