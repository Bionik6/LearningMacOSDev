//
//  AppDelegate.swift
//  Dice
//
//  Created by Ibrahima Ciss on 11/3/18.
//  Copyright © 2018 KreativeLab. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    var mainWC: MainWindowController!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWC = MainWindowController()
        mainWC.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

