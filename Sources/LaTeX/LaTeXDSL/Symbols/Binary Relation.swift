//
//  Binary Relation.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct BinaryRelation: LaTeXComponent {
    
    public let latexExpression: String
    
    private init(_ latexExpression: String) {
        self.latexExpression = latexExpression
    }
    
    
    @available(*, unavailable, renamed: "lessLess")
    public static let ll = BinaryRelation("\\ll")
    
    @available(*, unavailable, renamed: "lessEqual")
    public static let le = BinaryRelation("\\le")
    
    @available(*, unavailable, renamed: "greaterEqual")
    public static let ge = BinaryRelation("\\ge")
    
    @available(*, unavailable, renamed: "greaterGreater")
    public static let gg = BinaryRelation("\\gg")
    
    @available(*, unavailable, renamed: "notEqual")
    public static let ne = BinaryRelation("\\ne")
    
    
    
    public static let less = BinaryRelation("<")
    public static let lessEqual = BinaryRelation("\\le")
    public static let lessLess = BinaryRelation("\\ll")
    public static let prec = BinaryRelation("\\prec")
    public static let precEqual = BinaryRelation("\\preceq")
    public static let subset = BinaryRelation("\\subset")
    public static let subsetEqual = BinaryRelation("\\subseteq")
    public static let sqsubset = BinaryRelation("\\sqsubset")
    public static let sqsubsetEqual = BinaryRelation("\\sqsubseteq")
    public static let `in` = BinaryRelation("\\in")
    public static let vdash = BinaryRelation("\\vdash")
    public static let mid = BinaryRelation("\\mid")
    public static let smile = BinaryRelation("\\smile")
    public static let colon = BinaryRelation(":")
    
    
    public static let greater = BinaryRelation(">")
    public static let greaterEqual = BinaryRelation("\\ge")
    public static let greaterGreater = BinaryRelation("\\gg")
    public static let succ = BinaryRelation("\\succ")
    public static let succEqual = BinaryRelation("\\succeq")
    public static let supset = BinaryRelation("\\supset")
    public static let supsetEqual = BinaryRelation("\\supseteq")
    public static let sqsupset = BinaryRelation("\\sqsupset")
    public static let sqsupsetEqual = BinaryRelation("\\sqsupseteq")
    public static let owns = BinaryRelation("\\owns")
    public static let dashv = BinaryRelation("\\dashv")
    public static let parallel = BinaryRelation("\\parallel")
    public static let frown = BinaryRelation("\\frown")
    public static let notIn = BinaryRelation("\\notin")
    
    public static let equal = BinaryRelation("=")
    public static let equiv = BinaryRelation("\\equiv")
    public static let doteq = BinaryRelation("\\doteq")
    public static let sim = BinaryRelation("\\sim")
    public static let simeq = BinaryRelation("\\simeq")
    public static let approx = BinaryRelation("\\approx")
    public static let cong = BinaryRelation("\\cong")
    public static let Join = BinaryRelation("\\Join")
    public static let bowtie = BinaryRelation("\\bowtie")
    public static let propto = BinaryRelation("\\propto")
    public static let models = BinaryRelation("\\models")
    public static let perp = BinaryRelation("\\perp")
    public static let asymp = BinaryRelation("\\asymp")
    public static let notEqual = BinaryRelation("\\ne")
}
