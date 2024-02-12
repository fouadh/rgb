//
//  TextViews.swift
//  RGB
//
//  Created by Fouad HAMDI on 12/02/2024.
//

import SwiftUI

struct TitleText: View {
  var title: String

  var body: some View {
    Text(title)
      .font(.largeTitle)
  }
}

struct ColorText: View {
  var label: String

  var body: some View {
    Text(label)
  }
}

#Preview {
  VStack {
    TitleText(title: "a title")
    ColorText(label: "a color")
  }
}
