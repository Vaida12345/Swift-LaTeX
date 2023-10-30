//
//  LaTeX Modified Content.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct LaTeXModifiedContent<Content, Modifier> {
    
    public let content: Content
    
    public let modifier: Modifier
    
}

extension LaTeXModifiedContent: LaTeXComponent where Content: LaTeXComponent, Modifier: LaTeXModifier {
    
    public var latexExpression: String {
        self.modifier.modify(self.content)
    }
    
    public var pyDescription: String {
        fatalError("Attempting to generate python syntax for non mathematical expression")
    }
    
    public func evaluated() -> EvaluatedResult<LaTeXModifiedContent<Content, Modifier>> {
        self.modifier.evaluated(self.content)
    }
    
}
