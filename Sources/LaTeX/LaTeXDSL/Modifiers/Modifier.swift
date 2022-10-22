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

public extension LaTeXComponent {
    
    func power(_ value: some LaTeXComponent) -> some LaTeXComponent {
        Power {
            self
        } with: {
            value
        }

    }
    
    func `subscript`(_ value: some LaTeXComponent) -> some LaTeXComponent {
        Subscript {
            self
        } with: {
            value
        }
        
    }
    
    func transposed(_ value: some LaTeXComponent) -> some LaTeXComponent {
        self.power("T")
    }
    
    func primed() -> some LaTeXComponent {
        Group {
            self
            prime
        }
    }
    
}
