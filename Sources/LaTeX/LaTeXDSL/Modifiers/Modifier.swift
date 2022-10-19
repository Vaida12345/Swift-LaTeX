//
//  LaTeX Modifier.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public protocol LaTeXModifier {
    
    func modify(_ component: some LaTeXComponent) -> String
    
}

public extension LaTeXComponent {
    
    func modifier<Modifier: LaTeXModifier>(_ modifier: Modifier) -> LaTeXModifiedContent<Self, Modifier> {
        LaTeXModifiedContent(content: self, modifier: modifier)
    }
    
}
