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
    
    private let formula: String
    
    private let alignment: Alignment
    
    public var body: some View {
        LaTeXRenderer(formula: formula, alignment: alignment)
            .disabled(true)
    }
    
    private init(formula: String, alignment: Alignment) {
        self.formula = formula
        self.alignment = alignment
    }
    
    /// Initialize a new LaTeX View.
    ///
    /// - parameters:
    ///   - formula: The formula in LaTeX to be displayed.
    public init(formula: String) {
        self.init(formula: formula, alignment: .center)
    }
    
    public init(formula: some LaTeXComponent) {
        self.init(formula: formula.latexExpression)
    }
    
    public init(@LaTeXBuilder formula: () -> some LaTeXComponent) {
        self.init(formula: formula().latexExpression)
    }
}


#Preview {
    LaTeXView(formula: "\\beta")
}
