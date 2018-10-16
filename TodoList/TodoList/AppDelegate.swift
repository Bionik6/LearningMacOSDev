//
//  AppDelegate.swift
//  TodoList
//
//  Created by Ibrahima Ciss on 9/17/18.
//  Copyright © 2018 Ibrahima Ciss. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var mainWC: MainWindowController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWC = MainWindowController()
        mainWC.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

