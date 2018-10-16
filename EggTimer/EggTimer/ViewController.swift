//
//  ViewController.swift
//  EggTimer
//
//  Created by Ibrahima Ciss on 10/5/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var timeLeftField: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startButtonClicked(_ sender: NSButton) {
    }
    
    @IBAction func stopButtonClicked(_ sender: NSButton) {
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
    }
}

