//
//  LaTeX Modified Content.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct LaTeXModifiedContent<Content, Modifier> {
    
    let content: Content
    
    let modifier: Modifier
    
}

extension LaTeXModifiedContent: LaTeXComponent where Content: LaTeXComponent, Modifier: LaTeXModifier {
    
    public var latexExpression: String {
        self.modifier.modify(self.content)
    }
    
}
