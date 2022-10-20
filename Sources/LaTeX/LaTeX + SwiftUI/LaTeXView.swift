//
//  LaTeXView.swift
//  
//
//  Created by Vaida on 10/18/22.
//


import SwiftUI


/// A view that can display LaTeX formulas.
///
/// - Note: Outgoing network Connections needs to be enabled in Project Sandbox.
public struct LaTeXView: View {
    
    @State private var width: CGFloat?
    @State private var height: CGFloat?
    
    private let formula: String
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(.clear)
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            LaTeXRenderer(formula: formula, width: $width, height: $height)
                .frame(width: width, height: height)
        }
        .disabled(true)
    }
    
    /// Initialize a new LaTeX View.
    ///
    /// - parameters:
    ///   - formula: The formula in LaTeX to be displayed.
    public init(formula: String) {
        self.formula = formula
    }
    
    public init(formula: some LaTeXComponent) {
        self.formula = formula.latexExpression
    }
    
    public init(@LaTeXBuilder formula: () -> some LaTeXComponent) {
        self.formula = formula().latexExpression
    }
}
