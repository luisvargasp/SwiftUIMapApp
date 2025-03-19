//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by FerVP on 18/03/25.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    @State private var vm = LocationViewModel()

    var body: some Scene {
        WindowGroup {
            LocationView()
                .environment(vm)
        }
    }
}
