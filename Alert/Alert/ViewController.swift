//
//  ViewController.swift
//  Alert
//
//  Created by Ibrahima Ciss on 11/1/18.
//  Copyright © 2018 KreativeLab. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var button: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showAlert(_ sender: Any) {
        let modal = NSAlert()
        modal.messageText = "Alert Message"
        modal.informativeText = "A more detailed description of the situation"
        modal.addButton(withTitle: "Default")
        modal.addButton(withTitle: "Alternative")
        modal.addButton(withTitle: "Other")
        /* let result = modal.runModal()
    
        switch result {
        case NSApplication.ModalResponse.abort:
            print("abort")
        case NSApplication.ModalResponse.alertFirstButtonReturn:
            print("first button")
        case NSApplication.ModalResponse.alertSecondButtonReturn:
            print("second button")
        case NSApplication.ModalResponse.alertThirdButtonReturn:
            print("third button")
        default: break
        } */
        
        modal.beginSheetModal(for: self.view.window!) { response in
            print(response)
        }
    }
    
}

