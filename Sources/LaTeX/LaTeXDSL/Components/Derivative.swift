//
//  Derivative Component.swift
//  
//
//  Created by Vaida on 10/22/22.
//


public struct Derivative<Base: LaTeXComponent, Content: LaTeXComponent>: LaTeXComponent {
    
    private let base: Base
    
    private let isCompact: Bool
    
    private let isPartial: Bool
    
    private let content: Content
    
    public var latexExpression: String {
        let symbol: any LaTeXComponent = isPartial ? "\\partial" : "d".font(.mathrm).latexExpression
        if self.isCompact {
            return "\\frac{\(symbol)\\,\(self.content.latexExpression)}{\(symbol) \(base.latexExpression)}"
        } else {
            return "{\\frac{\(symbol)}{\(symbol) \(base.latexExpression)}\(self.content.latexExpression)}"
        }
    }
    
    private init(_ content: Content, against base: Base, isCompact: Bool, isPartial: Bool) {
        self.content = content
        self.base = base
        self.isCompact = isCompact
        self.isPartial = isPartial
    }
    
    public init(@LaTeXBuilder content: () -> Content, @LaTeXBuilder against base: () -> Base) {
        self.init(content(), against: base(), isCompact: false, isPartial: false)
    }
    
    public func compact() -> Derivative<Base, Content> {
        .init(self.content, against: self.base, isCompact: true, isPartial: self.isPartial)
    }
    
    public func partial() -> Derivative<Base, Content> {
        .init(self.content, against: self.base, isCompact: self.isCompact, isPartial: true)
    }
    
}
