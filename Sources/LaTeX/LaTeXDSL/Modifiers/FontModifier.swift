//
//  Font Modifier.swift
//  
//
//  Created by Vaida on 10/21/22.
//


public struct FontModifier: LaTeXModifier {
    
    private let font: Font
    
    fileprivate init(font: Font) {
        self.font = font
    }
    
    public func modify(_ component: some LaTeXComponent) -> String {
        "\\\(font.rawValue){\(component.latexExpression)}"
    }
    
    public func evaluated<Content: LaTeXComponent>(_ component: Content) -> EvaluatedResult<LaTeXModifiedContent<Content, Self>> {
        guard let component = component.evaluated().numericValue else { return .symbolic(component.modifier(self)) }
        
        return .numeric(component)
    }
    
    public enum Font: String {
        case mathcal
        case mathrm
        case mathbf
        case mathsf
        case mathtt
        case mathnormal
        case mathit
    }
    
}


public extension LaTeXComponent {
    
    func font(_ font: FontModifier.Font) -> some LaTeXComponent {
        self.modifier(FontModifier(font: font))
    }
    
}
