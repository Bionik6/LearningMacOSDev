//
//  Document.swift
//  Raisman
//
//  Created by Ibrahima Ciss on 10/18/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
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
    
    
    
    


}

