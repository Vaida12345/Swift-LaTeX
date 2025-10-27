//
//  LaTeXView.swift
//  
//
//  Created by Vaida on 10/18/22.
//

import WebKit
import SwiftUI


/// A view that can display LaTeX formulas.
///
/// This package uses web hosted MathJAX for math rendering.
///
/// ```swift
/// LaTeXView {
///     """
///     \\begin{bmatrix}
///     10 \\\\
///     20
///     \\end{bmatrix}
///     """
/// }
/// ```
///
/// > Limitation:
/// > This view is unable to infer the size of its contents before the content is displayed, hence the size of this view is always `infinity`.
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
