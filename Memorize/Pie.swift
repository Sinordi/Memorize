//
//  Pie.swift
//  Memorize
//
//  Created by Сергей Кривошапко on 27.01.2021.
//

import SwiftUI


struct Pie: Shape {
    
    var startAngle: Angle
    var endAngel: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.x + radius * cos(CGFloat(startAngle.radians))
        )
        
        
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngel, clockwise: clockwise)
        p.addLine(to: center)
        
        
        return p
    }
    
    
}
