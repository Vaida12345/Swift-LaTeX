//
//  LaTeX Argument Matrix.swift
//  
//
//  Created by Vaida on 10/20/22.
//


public struct LaTeXArgumentMatrix: LaTeXComponent {
    
    let contents: LaTeXMatrix
    let rhs: LaTeXMatrix
    
    public var latexExpression: String {
        "\\left[" + contents.latexExpression + "\\left| \\," + rhs.latexExpression + "\\right. \\right]"
    }
    
    public init( contents: () -> [[any LaTeXComponent]], rhs: () -> [any LaTeXComponent]) {
        self.contents = LaTeXMatrix(isBounded: false, contents: contents)
        self.rhs = LaTeXMatrix(isBounded: false, contents: { rhs().map { [$0] } })
    }
    
}
