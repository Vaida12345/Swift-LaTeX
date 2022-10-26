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
    
    private let alignment: Alignment
    
    public var body: some View {
        LaTeXRenderer(formula: formula, alignment: alignment, width: $width, height: $height)
            .frame(width: width, height: height)
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
    
    /// Changes the alignment of the LaTeX contents.
    ///
    /// - Important: This works independently with SwiftUI.
    public func alignment(_ value: Alignment) -> LaTeXView {
        .init(formula: self.formula, alignment: value)
    }
}
