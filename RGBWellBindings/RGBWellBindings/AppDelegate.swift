//
//  AppDelegate.swift
//  RGBWellBindings
//
//  Created by Ibrahima Ciss on 10/14/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var mainWindowController: MainWindowController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWindowController = MainWindowController()
        mainWindowController.showWindow(self)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}
