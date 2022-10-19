//
//  Misc Symbols.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct MiscSymbols: LaTeXComponent {
    
    public let latexExpression: String
    
    private init(_ latexExpression: String) {
        self.latexExpression = latexExpression
    }
    
    
    @available(*, unavailable, renamed: "Real")
    public static let Re = MiscSymbols("\\Re")
    
    @available(*, unavailable, renamed: "Imaginary")
    public static let Im = MiscSymbols("\\Im")
    
    
    @available(*, unavailable, renamed: "infinity")
    public static let infty = MiscSymbols("\\infty")
    
    
    public static let dots = MiscSymbols("\\dots")
    public static let hBar = MiscSymbols("\\hbar")
    public static let Real = MiscSymbols("\\Re")
    public static let forAll = MiscSymbols("\\forall")
    public static let apostrophe = MiscSymbols("\'")
    public static let nabla = MiscSymbols("\\nabla")
    public static let bot = MiscSymbols("\\bot")
    public static let diamondSuit = MiscSymbols("\\diamondsuit")
    public static let neg = MiscSymbols("\\neg")
    
    public static let cDots = MiscSymbols("\\cdots")
    public static let imath = MiscSymbols("\\imath")
    public static let Imaginary = MiscSymbols("\\Im")
    public static let exists = MiscSymbols("\\exists")
    public static let prime = MiscSymbols("\\prime")
    public static let triangle = MiscSymbols("\\triangle")
    public static let top = MiscSymbols("\\top")
    public static let heartSuit = MiscSymbols("\\heartsuit")
    public static let flat = MiscSymbols("\\flat")
    
    public static let vdots = MiscSymbols("\\vdots")
    public static let jmath = MiscSymbols("\\jmath")
    public static let aleph = MiscSymbols("\\aleph")
    public static let mho = MiscSymbols("\\mho")
    public static let emptySet = MiscSymbols("\\emptyset")
    public static let Box = MiscSymbols("\\Box")
    public static let angle = MiscSymbols("\\angle")
    public static let clubSuit = MiscSymbols("\\clubsuit")
    public static let natural = MiscSymbols("\\natural")
    
    public static let ddots = MiscSymbols("\\ddots")
    public static let ell = MiscSymbols("\\ell")
    public static let wp = MiscSymbols("\\wp")
    public static let partial = MiscSymbols("\\partial")
    public static let infinity = MiscSymbols("\\infty")
    public static let Diamond = MiscSymbols("\\Diamond")
    public static let surd = MiscSymbols("\\surd")
    public static let spadeSuit = MiscSymbols("\\spadesuit")
    public static let sharp = MiscSymbols("\\sharp")
    
}
