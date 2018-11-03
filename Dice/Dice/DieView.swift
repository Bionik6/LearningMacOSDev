//
//  DieView.swift
//  Dice
//
//  Created by Ibrahima Ciss on 11/3/18.
//  Copyright © 2018 KreativeLab. All rights reserved.
//

import Cocoa

class DieView: NSView {
    
    var trackArea: NSTrackingArea!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        trackArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeInKeyWindow], owner: self, userInfo: nil)
        self.addTrackingArea(trackArea)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.lightGray.set()
        NSBezierPath.fill(bounds)
        
        NSColor.green.setStroke()
        
        let path = NSBezierPath()
        path.move(to: NSPoint(x: 0, y: 0))
        path.line(to: NSPoint(x: bounds.width, y: bounds.height))
        path.stroke()
        
//        NSBezierPath.strokeLine(from: NSPoint(x: 0, y: 0), to: NSPoint(x: bounds.width, y: bounds.height))
    }
    
    override var intrinsicContentSize: NSSize {
        return NSSize(width: 100, height: 100)
    }
    
    override func mouseEntered(with event: NSEvent) {
        Swift.print(event.trackingArea?.rect)
        self.needsDisplay = true
    }
    
    override func mouseExited(with event: NSEvent) {
        Swift.print("mouse exited")
        self.needsDisplay = true
    }
    
}
