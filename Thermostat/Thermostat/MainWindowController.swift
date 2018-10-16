//
//  MainWindowController.swift
//  Thermostat
//
//  Created by Ibrahima Ciss on 9/26/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa


class MainWindowController: NSWindowController {
    
    @IBOutlet weak var slider: NSSlider!
    
    private let temperatureKeyPath = #keyPath(MainWindowController.temperature)
    
    @IBOutlet weak var stateButton: NSButton!
    
//    @objc dynamic var temperature = 68 {
//        willSet { if temperature < 0 { temperature = 0 } }
//    }
    
    private var privateTemp = 70
    
    @objc dynamic var temperature: Int {
        set {
            print("set temperature to \(newValue)")
            privateTemp = newValue
        }
        get {
            print("get temperature")
            return privateTemp
        }
    }
    
    @objc dynamic private var state = true {
        didSet { stateButton.title = state == true ? "On" : "Off" }
    }
    
    override var windowNibName: NSNib.Name? {
        return String(describing: MainWindowController.self)
    }
    
    override var owner: AnyObject? {
        return self
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        // Creating binding programmatically
        slider.bind(.enabled, to: self, withKeyPath: "state", options: nil)
    }
    
    @IBAction private func makeWarmer(button: NSButton) {
        temperature += 1
    }
    
    @IBAction private func makeCooler(button: NSButton) {
        temperature -= 1
    }
    
    // Methods to override if a value of a binding is nil
    override func setNilValueForKey(_ key: String) {
        switch key {
        case temperatureKeyPath: temperature = 68
        default: super.setNilValueForKey(key)
        }
    }
    
}
