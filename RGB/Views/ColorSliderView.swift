//
//  ColorSliderView.swift
//  RGB
//
//  Created by Fouad HAMDI on 12/02/2024.
//

import SwiftUI

struct ColorIntensitySlider: View {
  var label: String
  @Binding var intensity: ColorIntensity

  var body: some View {
    Text(label)
    HStack {
      Slider(value: $intensity.value, in: 0...255)
      Text("\(intensity.rounded)")
    }
  }
}

#Preview {
  ColorIntensitySlider(label: "A color", intensity: .constant(ColorIntensity(value: 100)))
}
