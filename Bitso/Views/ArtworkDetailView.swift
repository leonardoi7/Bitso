//
//  ArtworkDetailView.swift
//  Bitso
//
//  Created by leonardo on 16/01/24.
//

import SwiftUI

struct ArtworkDetailView: View {
    let artwork: Data
    let baseURL = "https://www.artic.edu/iiif/2"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(artwork.title ?? "Unknown Title")
                .font(.headline)
            Text(artwork.artistDisplay ?? "Unknown Origin")
                .font(.subheadline)
            
            AsyncImage(url: URL(string: "\(baseURL)/\(artwork.imageID ?? "")/full/843,/0/default.jpg")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Image(systemName: "wifi.exclamationmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                }
            }
            .frame(width: 300, height: 300)
        }
        .padding()
    }
}
        
