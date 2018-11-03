//
//  CircleView.swift
//  Circle
//
//  Created by Ibrahima Ciss on 11/3/18.
//  Copyright © 2018 KreativeLab. All rights reserved.
//

import Cocoa

class CircleView: NSView {
    
    var trackArea: NSTrackingArea!
    var bezierPath: NSBezierPath!
    private var context: NSGraphicsContext!
    var showFill = false { didSet { needsDisplay = true } }
    
    var shapeLayer: CAShapeLayer!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.wantsLayer = true
        trackArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeInKeyWindow], owner: self, userInfo: nil)
        self.addTrackingArea(trackArea)
    }
    
    override var intrinsicContentSize: NSSize {
        return NSSize(width: 100, height: 100)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        shapeLayer = CAShapeLayer()
        let strokeWidth: CGFloat = 10.0
        let bezierPath = NSBezierPath(ovalIn: dirtyRect.insetBy(dx: strokeWidth/2, dy: strokeWidth/2))
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.strokeColor = NSColor.red.cgColor
        shapeLayer.lineWidth = strokeWidth
        shapeLayer.fillColor =  NSColor.clear.cgColor
        layer?.addSublayer(shapeLayer)
    }
    
    override func mouseEntered(with event: NSEvent) {
        addAnimation(event: event)
    }
    
    override func mouseExited(with event: NSEvent) {
        addAnimation(event: event)
    }
    
    private func addAnimation(event: NSEvent) {
        let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.fillColor))
        switch event.type {
        case .mouseEntered:
            animation.fromValue = NSColor.clear.cgColor
            animation.toValue = NSColor(red: 1, green: 0, blue: 0, alpha: 0.3).cgColor
        case .mouseExited:
            animation.fromValue = NSColor(red: 1, green: 0, blue: 0, alpha: 0.3).cgColor
            animation.toValue = NSColor.clear.cgColor
        default: break
        }
        animation.duration = 0.3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shapeLayer.add(animation, forKey: nil)
    }
}




extension NSBezierPath {
    
    public var cgPath: CGPath {
        let path = CGMutablePath()
        var points = [CGPoint](repeating: .zero, count: 3)
        for i in 0 ..< self.elementCount {
            let type = self.element(at: i, associatedPoints: &points)
            switch type {
            case .moveTo: path.move(to: points[0])
            case .lineTo: path.addLine(to: points[0])
            case .curveTo: path.addCurve(to: points[2], control1: points[0], control2: points[1])
            case .closePath: path.closeSubpath()
            }
        }
        return path
    }
}
