//
//  LaTeX Renderer.swift
//  
//
//  Created by Vaida on 10/18/22.
//


import SwiftUI
import WebKit


internal struct LaTeXRenderer: NSViewRepresentable {
    
    typealias NSViewType = WKWebView
    
    private let formula: String
    private let alignment: Alignment
    
    @Binding var width: CGFloat?
    @Binding var height: CGFloat?
    
    @Environment(\.colorScheme) var colorScheme
    
    init(formula: String, alignment: Alignment, width: Binding<CGFloat?>, height: Binding<CGFloat?>) {
        self.formula = formula
        self.alignment = alignment
        
        self._width = width
        self._height = height
    }
    
    func makeNSView(context: Context) -> WKWebView {
        let view = WKWebView()
        
        updateNSView(view, context: context)
        return view
    }
    
    private func updateSize(view: WKWebView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            Task {
                guard let width = try? await view.evaluateJavaScript("document.getElementById('LaTeXView').clientWidth") as? Int,
                      let height = try? await view.evaluateJavaScript("document.getElementById('LaTeXView').clientHeight") as? Int else {
                    print("LaTeX Render: Update size failure, retry")
                    updateSize(view: view)
                    return
                }
                
                self.width = CGFloat(width)
                self.height = CGFloat(height)
            }
        }
    }
    
    func updateNSView(_ view: WKWebView, context: Context) {
        let htmlValue = LaTeXRenderer.content
            .replacingOccurrences(of: "## The body of equal goes here ##", with: formula.components(separatedBy: "\\\\").map { "$$" + $0 + "$$" }.joined(separator: "\n"))
            .replacingOccurrences(of: "## foreground color ##", with: "#" + Color.foreground(for: colorScheme).hexDescription)
            .replacingOccurrences(of: "## background color ##", with: "#" + Color.background(for: colorScheme))
            .replacingOccurrences(of: "## text alignment ##", with: self.alignment.htmlAlignment.text)
            .replacingOccurrences(of: "## vertical alignment ##", with: self.alignment.htmlAlignment.vertical)
        let webViewBaseUrl = URL(fileURLWithPath: Bundle.main.bundlePath, isDirectory: true)
        
        print(htmlValue)
        
        view.loadHTMLString(htmlValue, baseURL: webViewBaseUrl)
        
        updateSize(view: view)
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

      <script id="MathJax-script" async src="Contents/Resources/Swift-LaTeX_LaTeX.bundle/Contents/Resources/MathJax/es5/tex-chtml.js"></script>

        <style>
            body {
                background: ## background color ##;
                color: ## foreground color ##;
                text-align: center;
                vertical-align: middle;
            }

            * {
                margin: 0;
                padding: 0;
                border: 0;
                outline: 0;
                font-size: 100%;
                text-align: ## text alignment ##;
                background: transparent;
                vertical-align: ## vertical alignment ##;
            }

            #LaTeXView {
                display: inline-block;
                min-height: 0px;
                min-width: 0px;
                overflow: hidden;
                padding: 0px;
                text-align: ## text alignment ##;
                vertical-align: ## vertical alignment ##;
            }
        </style>
    </head>

    <body>
        <div id='LaTeXView'>
            ## The body of equal goes here ##
        </div>
    </body>
</html>
"""
    
}


internal extension Color {
    
    var animatableData: [Double] {
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
        let color = NSColor(self).usingColorSpace(.displayP3)!
        return [color.redComponent, color.greenComponent, color.blueComponent, color.alphaComponent]
#elseif canImport(UIKit)
        let color = UIColor(self).cgColor.converted(to: CGColorSpace(name: CGColorSpace.displayP3)!, intent: .defaultIntent, options: nil)!
        return color.components!.map { Double($0) } + [color.alpha]
#endif
    }
    
    /// The Hexadecimal description of the image
    ///
    /// **Example**
    ///
    ///     Color.white.hexDescription // "ffffff"
    var hexDescription: String {
        let vector = self.animatableData
        
        var red   = String(Int(vector[0] * 255), radix: 16, uppercase: false)
        var green = String(Int(vector[1] * 255), radix: 16, uppercase: false)
        var blue  = String(Int(vector[2]  * 255), radix: 16, uppercase: false)
        
        if red.count   == 1 { red.insert("0",   at: red.startIndex) }
        if green.count == 1 { green.insert("0", at: green.startIndex) }
        if blue.count  == 1 { blue.insert("0",  at: blue.startIndex) }
        
        return red + green + blue
    }
    
    static func background(for colorScheme: ColorScheme) -> String {
        var red   = ""
        var green = ""
        var blue  = ""
        
        if colorScheme == .dark {
            red   = String(29, radix: 16, uppercase: false)
            green = String(28, radix: 16, uppercase: false)
            blue  = String(28, radix: 16, uppercase: false)
        } else {
            red   = String(235, radix: 16, uppercase: false)
            green = String(234, radix: 16, uppercase: false)
            blue  = String(234, radix: 16, uppercase: false)
        }
        
        if red.count   == 1 { red.insert("0",   at: red.startIndex) }
        if green.count == 1 { green.insert("0", at: green.startIndex) }
        if blue.count  == 1 { blue.insert("0",  at: blue.startIndex) }
        
        return red + green + blue
    }
    
    static func foreground(for colorScheme: ColorScheme) -> Color {
        if colorScheme == .dark {
            return Color(.displayP3, red: 220 / 255, green: 220 / 255, blue: 220 / 255)
        } else {
            return Color(.displayP3, red: 36 / 255, green: 36 / 255, blue: 36 / 255)
        }
    }
    
}


private extension Alignment {
    
    var htmlAlignment: (text: String, vertical: String) {
        var textAlignment: String {
            switch self {
            case .leading, .topLeading, .bottomLeading:
                return "left"
            case .center, .top, .bottom:
                return "center"
            case .trailing, .topTrailing, .trailing:
                return "right"
            default:
                return "center"
            }
        }
        
        var verticalAlignment: String {
            switch self {
            case .top, .topLeading, .topTrailing:
                return "top"
            case .center, .leading, .trailing:
                return "middle"
            case .bottom, .bottomLeading, .bottomTrailing:
                return "bottom"
            default:
                return "middle"
            }
        }
        
        return (textAlignment, verticalAlignment)
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
