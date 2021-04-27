//
//  ViewExtensions.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 19/04/2021.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    func hideRowSeparator(insets: EdgeInsets = .defaultListRowInsets, background: Color = .white) -> some View {
        modifier(HideRowSeparatorModifier(insets: insets, background: background))
    }
    func hiddenNavigationBarStyle() -> some View {
        modifier(HiddenNavigationBar())
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct HideRowSeparatorModifier: ViewModifier {
    static let defaultListRowHeight: CGFloat = 44
    var insets: EdgeInsets
    var background: Color
    
    init(insets: EdgeInsets, background: Color) {
        self.insets = insets
        var alpha: CGFloat = 0
        UIColor(background).getWhite(nil, alpha: &alpha)
        assert(alpha == 1, "Setting background to a non-opaque color will result in separators remaining visible.")
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
                minWidth: 0, maxWidth: .infinity,
                minHeight: Self.defaultListRowHeight,
                alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(background)
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}
