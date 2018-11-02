//
//  AppDelegate.swift
//  Chatter
//
//  Created by Ibrahima Ciss on 11/1/18.
//  Copyright © 2018 KreativeLab. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var windowsControllers: [ChatWindowController] = []

    func addWindowController() {
        let chatWC = ChatWindowController()
        chatWC.showWindow(self)
        windowsControllers.append(chatWC)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        addWindowController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func addChatWindow(_ sender: NSMenuItem) {
        addWindowController()
    }
    
}

