//
//  ChatWindowController.swift
//  Chatter
//
//  Created by Ibrahima Ciss on 11/1/18.
//  Copyright © 2018 KreativeLab. All rights reserved.
//

import Cocoa

@objcMembers
class ChatWindowController: NSWindowController {
    
    private let ChatWindowControllerDidSendMessageNotification = "co.kreativelab.chatter.ChatWindowControllerDidSendMessageNotification"
    private let ChatWindowControllerMessageKey = "co.kreativelab.ChatWindowControllerMessageKey"
    
    dynamic var log: NSAttributedString = NSAttributedString(string: "")
    dynamic var message: String?
    
    @IBOutlet var textView: NSTextView!
    
    @IBOutlet weak var textField: NSTextField!
    
    override var windowNibName: NSNib.Name? { return NSNib.Name("ChatWindowController") }

    override func windowDidLoad() {
        super.windowDidLoad()
        textField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(receiveDidSendMessageNotification(notification:)), name: NSNotification.Name(ChatWindowControllerDidSendMessageNotification), object: nil)
    }

    @IBAction func sender(_ sender: NSButton) {
        sender.window?.endEditing(for: nil)
        if let message = message {
            let userInfos = [ChatWindowControllerMessageKey: message]
            let notificationCenter = NotificationCenter.default
            notificationCenter.post(name: NSNotification.Name(ChatWindowControllerDidSendMessageNotification), object: self, userInfo: userInfos)
        }
        message = nil
    }
    
    func receiveDidSendMessageNotification(notification: NSNotification) {
        let mutableLog = log.mutableCopy() as! NSMutableAttributedString
        if log.length > 0 { mutableLog.append(NSAttributedString(string: "\n")) }
        let userInfos = notification.userInfo as! [String:String]
        let message = userInfos[ChatWindowControllerMessageKey]!
        
        let logLine = NSAttributedString(string: message)
        mutableLog.append(logLine)
        
        log = mutableLog.copy() as! NSAttributedString
        textView.scrollRangeToVisible(NSRange(location: log.length, length: 0))
    }
    
    deinit { NotificationCenter.default.removeObserver(self) }
    
}
