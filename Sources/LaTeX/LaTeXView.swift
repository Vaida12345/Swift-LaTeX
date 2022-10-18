//
//  LaTeXView.swift
//  
//
//  Created by Vaida on 10/18/22.
//


import SwiftUI
import Support


public struct LaTeXView: View {
    
    @State private var width: CGFloat?
    @State private var height: CGFloat?
    
    let formula: String
    
    public var body: some View {
        LaTeXRenderer(formula: formula, width: $width, height: $height)
            .frame(width: width, height: height)
    }
    
    public init(formula: String) {
        self.formula = formula
    }
}

struct LaTeXView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView {
            LaTeXView(formula: "\\pi = 3.14")
        }
    }
}
