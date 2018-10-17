//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

final class CustomView: NSView {
    
    var shapeLayer: CAShapeLayer!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
//        let strokeWidth: CGFloat = 20.0
//        let halfStrokeWidth = strokeWidth / 2
//
//        let path = NSBezierPath.init(ovalIn: dirtyRect.insetBy(dx: halfStrokeWidth, dy: halfStrokeWidth))
//
//        NSColor.red.setStroke()
//        path.lineWidth = strokeWidth
//        path.stroke()
        
//
//
        shapeLayer = CAShapeLayer()
        shapeLayer.borderColor = NSColor.green.cgColor
        shapeLayer.borderWidth = 10

        let newPath = CGMutablePath.init()
        newPath.addEllipse(in: dirtyRect.insetBy(dx: 10/2, dy: 10/2))
        shapeLayer.path = newPath

        self.layer?.addSublayer(shapeLayer)
    }
}

let view = CustomView(frame: NSRect.init(x: 0, y: 0, width: 300, height: 300))
view.wantsLayer = true
view.layer?.backgroundColor = NSColor.lightGray.cgColor
PlaygroundPage.current.liveView = view
