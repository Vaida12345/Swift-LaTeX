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
public struct LaTeXRenderer: NSViewRepresentable {
    
    public typealias NSViewType = WKWebView
    
    let formula: String
    
    @Binding var width: CGFloat?
    @Binding var height: CGFloat?
    
    @Environment(\.colorScheme) var colorScheme
    
    public init(formula: String, width: Binding<CGFloat?>, height: Binding<CGFloat?>) {
        self.formula = formula
        
        self._width = width
        self._height = height
    }
    
    public func makeNSView(context: Context) -> WKWebView {
        let view = WKWebView()
        
        updateNSView(view, context: context)
        return view
    }
    
    public func updateNSView(_ view: WKWebView, context: Context) {
        let htmlValue = LaTeXRenderer.content.replacingOccurrences(of: "## The body of equal goes here ## Vaida ##", with: "$" + formula + "$")
            .replacingOccurrences(of: "## foreground color ##", with: "#" + Color.foreground(for: colorScheme).hexDescription)
            .replacingOccurrences(of: "## background color ##", with: "#" + Color.background(for: colorScheme).hexDescription)
        let webViewBaseUrl = URL(fileURLWithPath: FinderItem.bundleDirectory.path, isDirectory: true)
        
        view.loadHTMLString(htmlValue, baseURL: webViewBaseUrl)
        
        DispatchQueue.main.delay(seconds: 0.5) {
            Task {
                let width = try! await view.evaluateJavaScript("document.getElementById('LaTeXView').clientWidth") as! Int
                let height = try! await view.evaluateJavaScript("document.getElementById('LaTeXView').clientHeight") as! Int
                
                self.width = CGFloat(width)
                self.height = CGFloat(height)
            }
        }
    }
    
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
            tex: {
                    inlineMath: [['$', '$'], ['\\(', '\\)']]
                }
          };
      </script>

      <script id="MathJax-script" async src="Contents/Resources/LaTeX_LaTeX.bundle/Contents/Resources/MathJax/es5/tex-chtml.js"></script>

        <style>
            body {
                background: ## background color ##;
                color: ## foreground color ##;
            }

            #LaTeXView {
                display: inline-block;
                min-height: 0px;
                min-width: 0px;
                overflow: hidden;
                white-space: pre-line;
                padding: 0px;
            }
        </style>
    </head>

    <body>
        <div id='LaTeXView'>
            ## The body of equal goes here ## Vaida ##
        </div>
    </body>
</html>
"""
    
}


extension Color {
    
    static func background(for colorScheme: ColorScheme) -> Color {
        return .black
        
        if colorScheme == .dark {
            return Color(.displayP3, red: 30 / 255, green: 30 / 255, blue: 30 / 255)
        } else {
            return Color(.displayP3, red: 234 / 255, green: 234 / 255, blue: 234 / 255)
        }
    }
    
    static func foreground(for colorScheme: ColorScheme) -> Color {
        if colorScheme == .dark {
            return Color(.displayP3, red: 220 / 255, green: 220 / 255, blue: 220 / 255)
        } else {
            return Color(.displayP3, red: 36 / 255, green: 36 / 255, blue: 36 / 255)
        }
    }
    
}


struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LaTeXView(formula: "1234567")
        }
        .preferredColorScheme(.light)
    }
}