//
//  CircleView.swift
//  Circle
//
//  Created by Ibrahima Ciss on 11/3/18.
//  Copyright © 2018 KreativeLab. All rights reserved.
//

import Cocoa

class CircleView: NSView {
    
    private var shapeLayer: CAShapeLayer!
    private var trackArea: NSTrackingArea!
    
    private var strokeWidth: CGFloat { return 10 }
    
    private var squarePath: CGPath {
        let path = CGMutablePath()
        path.addRect(bounds.insetBy(dx: strokeWidth/2, dy: strokeWidth/2))
        return path
    }
    
    private var initialPath: CGPath {
        let path = CGMutablePath()
        path.addEllipse(in: bounds.insetBy(dx: strokeWidth/2, dy: strokeWidth/2))
        return path
    }
    
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
    
    override func updateLayer() {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = initialPath 
        shapeLayer.strokeColor = NSColor.red.cgColor
        shapeLayer.lineWidth = strokeWidth
        shapeLayer.fillColor =  NSColor.clear.cgColor
        layer?.addSublayer(shapeLayer)
    }
    
    override func mouseEntered(with event: NSEvent) {
        addAnimation(event: event)
        NSCursor.pointingHand.set()
    }
    
    override func mouseExited(with event: NSEvent) {
        addAnimation(event: event)
        NSCursor.arrow.set()
    }
    
    private func addAnimation(event: NSEvent) {
        let animationGroup = CAAnimationGroup()
        
        let fillColorAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.fillColor))
        switch event.type {
        case .mouseEntered:
            fillColorAnimation.toValue = NSColor(red: 1, green: 0, blue: 0, alpha: 0.3).cgColor
        case .mouseExited:
            fillColorAnimation.toValue = NSColor.clear.cgColor
        default: break
        }
        
        let pathAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
        switch event.type {
        case .mouseEntered:
            pathAnimation.toValue = squarePath
        case .mouseExited:
            pathAnimation.toValue = initialPath
        default: break
        }
        
        animationGroup.animations = [fillColorAnimation, pathAnimation]
        animationGroup.duration = 1
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationGroup.isRemovedOnCompletion = false // don't remove after finishing
        animationGroup.fillMode = .both // keep to value after finishing
        
        shapeLayer.add(animationGroup, forKey: nil)
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
