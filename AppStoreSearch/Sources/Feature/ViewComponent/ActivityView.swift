//
//  ActivityView.swift
//  AppStoreSearch
//
//  Created by Mason Kim on 2023/08/25.
//

import UIKit
import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
  let text: String

  func makeUIViewController(
    context: UIViewControllerRepresentableContext<ActivityView>
  ) -> UIActivityViewController {
    return UIActivityViewController(
      activityItems: [text],
      applicationActivities: nil
    )
  }

  func updateUIViewController(
    _ uiViewController: UIActivityViewController,
    context: UIViewControllerRepresentableContext<ActivityView>
  ) { }
}
