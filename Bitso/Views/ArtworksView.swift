//
//  ArtworksView.swift
//  Bitso
//
//  Created by leonardo on 15/01/24.
//

import SwiftUI

struct ArtworksView: View {
    @ObservedObject var viewModel: ArtworksViewModel
    @State private var selectedArtwork: Data?
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.artworks, id: \.id) { artwork in
                Text(artwork.title ?? "Unknown Title")
                    .onTapGesture {
                        selectedArtwork = artwork
                    }
                    .onAppear {
                        if viewModel.shouldPreloadNextPage(currentArtwork: artwork) {
                            viewModel.loadArtworks()
                        }
                    }
            }
            .navigationTitle("Artworks")
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .onReceive(viewModel.$error) { error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            }
        }
        .refreshable {
            viewModel.refreshArtworks()
        }
        .sheet(item: $selectedArtwork) { artwork in
            ArtworkDetailView(artwork: artwork)
        }
    }
}

