//
//  Greek.swift
//  
//
//  Created by Vaida on 10/19/22.
//


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
