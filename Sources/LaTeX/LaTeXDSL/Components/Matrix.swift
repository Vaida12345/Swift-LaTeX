//
//  LaTeX Matrix.swift
//  
//
//  Created by Vaida on 10/20/22.
//


public struct LaTeXMatrix: LaTeXComponent {
    
    let isBounded: Bool
    let contents: [[any LaTeXComponent]]
    
    public var latexExpression: String {
        let matrixName = isBounded ? "bmatrix" : "matrix"
        
        var result = "\\begin{\(matrixName)}\n"
        
        result += contents.map {
            $0.map(\.latexExpression).joined(separator: " & ")
        }.joined(separator: " \\\\\n ")
        
        return result + "\n\\end{\(matrixName)}\n"
    }
    
    public var pyDescription: String {
        fatalError("Attempting to generate python syntax for non mathematical expression")
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        .symbolic(self)
    }
    
    public init(isBounded: Bool = true, contents: () -> [[any LaTeXComponent]]) {
        self.isBounded = isBounded
        self.contents = contents()
    }
    
}
