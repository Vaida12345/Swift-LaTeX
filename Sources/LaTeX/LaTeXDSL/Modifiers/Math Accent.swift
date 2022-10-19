//
//  Math Accent.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct MathAccentModifier: LaTeXModifier {
    
    private let symbolName: String
    
    public func modify(_ component: some LaTeXComponent) -> String {
        "\\\(symbolName){\(component.latexExpression)}"
    }
    
    internal init(_ symbolName: String) {
        self.symbolName = symbolName
    }
    
    
    public static let hat = MathAccentModifier("hat")
    public static let grave = MathAccentModifier("grave")
    public static let bar = MathAccentModifier("bar")
    public static let check = MathAccentModifier("check")
    public static let dot = MathAccentModifier("dot")
    public static let vec = MathAccentModifier("vec")
    
    public static let tilde = MathAccentModifier("tilde")
    public static let ddot = MathAccentModifier("ddot")
    public static let widehat = MathAccentModifier("widehat")
    public static let acute = MathAccentModifier("acute")
    public static let breve = MathAccentModifier("breve")
    public static let widetilde = MathAccentModifier("widetilde")
}

public extension LaTeXComponent {
    
    /// The math accent modifier for a LaTeX component.
    ///
    /// - Parameters:
    ///   - modifier: The accent modifier.
    func accent(_ modifier: MathAccentModifier) -> LaTeXModifiedContent<Self, MathAccentModifier> {
        .init(content: self, modifier: modifier)
    }
    
}
