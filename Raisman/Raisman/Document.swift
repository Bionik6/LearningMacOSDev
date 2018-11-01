//
//  Document.swift
//  Raisman
//
//  Created by Ibrahima Ciss on 10/18/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    @IBOutlet var arrayController: NSArrayController!
    @objc var employees = [Employee]()
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override var windowNibName: NSNib.Name? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return NSNib.Name("Document")
    }
    
    @IBAction func removeEmployees(sender: NSButton) {
        let selectedPeople: [Employee] = arrayController.selectedObjects as! [Employee]
        let messageText = selectedPeople.count > 1
            ? "Do you really want to remove theses people?"
            : "Do you really want to remove this person"
        let informativeText = selectedPeople.count > 1
            ? "\(selectedPeople.count) people will be removed"
            : "\(selectedPeople.first!.name!) will be removed"
        let alert = NSAlert()
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.addButton(withTitle: "Remove")
        alert.addButton(withTitle: "Keep, but no raise")
        alert.addButton(withTitle: "Cancel")
        let window = sender.window!
        alert.beginSheetModal(for: window) { response in
            switch response {
            case NSApplication.ModalResponse.alertFirstButtonReturn:
                self.arrayController.remove(nil)
            case NSApplication.ModalResponse.alertSecondButtonReturn:
                selectedPeople.forEach { $0.raise = 0 }
            default: break
            }
        }
    }
    


}

