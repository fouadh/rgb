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
      .foregroundColor(Color("TitleColor"))
  }
}

struct ColorText: View {
  var label: String

  var body: some View {
    Text(label)
  }
}

struct IntensityText: View {
  @Binding var value: ColorIntensity

  var body: some View {
    Text("\(value.rounded)")
  }
}

#Preview {
  VStack {
    TitleText(title: "a title")
    ColorText(label: "a color")
    IntensityText(value: .constant(ColorIntensity(value: 100.123)))
  }
}

#Preview {
  VStack {
    TitleText(title: "a title")
    ColorText(label: "a color")
    IntensityText(value: .constant(ColorIntensity(value: 100.123)))
  }.preferredColorScheme(.dark)
}
