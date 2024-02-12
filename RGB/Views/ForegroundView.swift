//
//  ForegroundView.swift
//  RGB
//
//  Created by Fouad HAMDI on 12/02/2024.
//

import SwiftUI

struct ForegroundView: View {
  @Binding var color: Color

  var body: some View {
    RoundedRectangle(cornerRadius: 0)
      .foregroundColor(color)
      .border(.black)
  }
}

#Preview {
  ForegroundView(color: .constant(Color.blue))
}
