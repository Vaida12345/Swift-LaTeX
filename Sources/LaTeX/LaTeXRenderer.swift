//
//  LaTeX Renderer.swift
//  
//
//  Created by Vaida on 10/18/22.
//


import SwiftUI
import WebKit
import Support


/// A view that supports LaTeX.
public struct LaTeXView: NSViewRepresentable {
    
    public typealias NSViewType = WKWebView
    
    let formula: String
    
    private static let content =
"""
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width">
  <title>MathJax v3 with TeX input and HTML output</title>
  <script>
  MathJax = {
    tex: {inlineMath: [['$', '$'], ['\\(', '\\)']]}
  };
  </script>
  <script id="MathJax-script" async src="Contents/Resources/LaTeX_LaTeX.bundle/Contents/Resources/MathJax/es5/tex-chtml.js"></script>
</head>
<body>
     ## The body of equal goes here ## Vaida ##
</body>
</html>

"""
    
    public init(formula: String) {
        self.formula = formula
    }
    
    public func makeNSView(context: Context) -> WKWebView {
        let htmlValue = LaTeXView.content.replacingOccurrences(of: "## The body of equal goes here ## Vaida ##", with: "$" + formula + "$")
        let webViewBaseUrl = URL(fileURLWithPath: FinderItem.bundleDirectory.path, isDirectory: true)
        print(webViewBaseUrl)
        
        let view = WKWebView()
        view.loadHTMLString(htmlValue, baseURL: webViewBaseUrl)
        
        return view
    }
    
    public func updateNSView(_ view: WKWebView, context: Context) {
        let htmlValue = LaTeXView.content.replacingOccurrences(of: "## The body of equal goes here ## Vaida ##", with: "$" + formula + "$")
        let webViewBaseUrl = URL(fileURLWithPath: FinderItem.bundleDirectory.path, isDirectory: true)
        
        view.loadHTMLString(htmlValue, baseURL: webViewBaseUrl)
    }
    
}
