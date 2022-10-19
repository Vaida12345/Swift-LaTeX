//
//  Binary Operator.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct BinaryOperator: LaTeXComponent {
    
    public let latexExpression: String
    
    private init(_ latexExpression: String) {
        self.latexExpression = latexExpression
    }
    
    
    @available(*, unavailable, renamed: "plusMinus")
    public static let pm = BinaryOperator("\\pm")
    
    @available(*, unavailable, renamed: "minusPlus")
    public static let mp = BinaryOperator("\\mp")
    
    @available(*, unavailable, renamed: "divide")
    public static let div = BinaryOperator("\\div")
    
    
    public static let plus = BinaryOperator("+")
    public static let plusMinus = BinaryOperator("\\pm")
    public static let cdot = BinaryOperator("\\cdot")
    public static let times = BinaryOperator("\\times")
    public static let cup = BinaryOperator("\\cup")
    public static let sqcup = BinaryOperator("\\sqcup")
    public static let vee = BinaryOperator("\\vee")
    public static let oplus = BinaryOperator("\\oplus")
    public static let odot = BinaryOperator("\\odot")
    public static let otimes = BinaryOperator("\\otimes")
    public static let bigtriangleup = BinaryOperator("\\bigtriangleup")
    public static let lhd = BinaryOperator("\\lhd")
    public static let unlhd = BinaryOperator("\\unlhd")
    
    public static let minus = BinaryOperator("-")
    public static let minusPlus = BinaryOperator("\\mp")
    public static let divide = BinaryOperator("\\div")
    public static let setMinus = BinaryOperator("\\setminus")
    public static let cap = BinaryOperator("\\cap")
    public static let sqcap = BinaryOperator("\\sqcap")
    public static let wedge = BinaryOperator("\\wedge")
    public static let land = BinaryOperator("\\land")
    public static let ominus = BinaryOperator("\\ominus")
    public static let oslash = BinaryOperator("\\oslash")
    public static let bigcirc = BinaryOperator("\\bigcirc")
    public static let bigtriangledown = BinaryOperator("\\bigtriangledown")
    public static let rhd = BinaryOperator("\\rhd")
    public static let unrhd = BinaryOperator("\\unrhd")
    
    public static let triangleleft = BinaryOperator("\\triangleleft")
    public static let triangleright = BinaryOperator("\\triangleright")
    public static let star = BinaryOperator("\\star")
    public static let ast = BinaryOperator("\\ast")
    public static let circ = BinaryOperator("\\circ")
    public static let bullet = BinaryOperator("\\bullet")
    public static let diamond = BinaryOperator("\\diamond")
    public static let uplus = BinaryOperator("\\uplus")
    public static let amalg = BinaryOperator("\\amalg")
    public static let dagger = BinaryOperator("\\dagger")
    public static let ddagger = BinaryOperator("\\ddagger")
    public static let wr = BinaryOperator("\\wr")
}
