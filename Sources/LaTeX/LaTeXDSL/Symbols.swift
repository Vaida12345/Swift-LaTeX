//
//  LaTeX Symbols.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct LaTeXSymbols {
    
    /// The Greek symbols.
    public struct Greek: LaTeXComponent {
        
        public let latexExpression: String
        
        private init(_ latexExpression: String) {
            self.latexExpression = latexExpression
        }
        
        
        public static let alpha = Greek("\\alpha")
        public static let beta  = Greek("\\beta")
        public static let gamma = Greek("\\gamma")
        public static let delta = Greek("\\delta")
        public static let epsilon = Greek("\\epsilon")
        public static let varepsilon = Greek("\\varepsilon")
        public static let zeta = Greek("\\zeta")
        public static let eta = Greek("\\eta")
        
        public static let theta = Greek("\\theta")
        public static let vartheta = Greek("\\vartheta")
        public static let iota = Greek("\\iota")
        public static let kappa = Greek("\\kappa")
        public static let lambda = Greek("\\lambda")
        public static let mu = Greek("\\mu")
        public static let nu = Greek("\\nu")
        public static let xi = Greek("\\xi")
        
        public static let o = Greek("o")
        public static let pi = Greek("\\pi")
        public static let varpi = Greek("\\varpi")
        public static let rho = Greek("\\rho")
        public static let varrho = Greek("\\varrho")
        public static let sigma = Greek("\\sigma")
        public static let varsigma = Greek("\\varsigma")
        public static let tau = Greek("\\tau")
        
        public static let upsilon = Greek("\\upsilon")
        public static let phi = Greek("\\phi")
        public static let varphi = Greek("\\varphi")
        public static let chi = Greek("\\chi")
        public static let psi = Greek("\\psi")
        public static let omega = Greek("\\omega")
        
        
        public static let Gamma = Greek("\\Gamma")
        public static let Delta = Greek("\\Delta")
        public static let Theta = Greek("\\Theta")
        public static let Lambda = Greek("\\Lambda")
        public static let Xi = Greek("\\Xi")
        public static let Pi = Greek("\\Pi")
        
        public static let Sigma = Greek("\\Sigma")
        public static let Upsilon = Greek("\\Upsilon")
        public static let Phi = Greek("\\Phi")
        public static let Psi = Greek("\\Psi")
        public static let Omega = Greek("\\Omegab")
    }
    
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
    
    private init() {  }
    
}
