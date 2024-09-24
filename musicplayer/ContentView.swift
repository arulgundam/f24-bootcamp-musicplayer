//
//  ContentView.swift
//  musicplayer
//
//  Created by Arul Gundam on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying: Bool = false
    @State private var currentTime: Double = 30.0 // Example value
    @State private var totalTime: Double = 206.0 // Example total time for demo
    @State private var isShuffled: Bool = false
    @State private var isRepeated: Bool = false
    @State private var isLiked: Bool = false

    var body: some View {
        VStack {
            // Header with back button and options menu
            HStack {
                Button(action: {
                    // Action for dismissing the player
                }) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("panda")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    // Action for more options
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top, 100) // Adjust for top safe area
            
            Spacer()
            
            // Album cover
            Image("panda")
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(radius: 10)
            
            // Song info
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("panda")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("panda")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer() // This spacer pushes the text to the left while centering it vertically
            }
            .padding(.top, 20)
            .padding(.leading, 20) // Add padding to the left for spacing
            .frame(maxWidth: .infinity) // Allow HStack to take the full width
            
            // Player controls (like, slider, etc.)
            VStack(spacing: 20) {
                HStack {
                    Spacer() // heart button on the right
                    Button(action: {
                        // Like button action
                        isLiked.toggle()
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .green : .white)
                    }
                    
                }
                .padding(.horizontal)
                
                // Progress bar and timer
                VStack {
                    Slider(value: $currentTime, in: 0...totalTime)
                        .accentColor(.white)
                    
                    HStack {
                        Text(timeFormatted(currentTime))
                            .font(.caption)
                            .foregroundColor(.white)
                        Spacer()
                        Text(timeFormatted(totalTime))
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
            }
            
            // Playback controls
            HStack(spacing: 40) {
                Button(action: {
                    isShuffled.toggle()
                }) {
                    Image(systemName: "shuffle")
                        .foregroundColor(isShuffled ? .green : .white)
                }
                
                Button(action: {
                    // Action for going to the previous track
                }) {
                    Image(systemName: "backward.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    isPlaying.toggle()
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    // Action for going to the next track
                }) {
                    Image(systemName: "forward.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    isRepeated.toggle()
                }) {
                    Image(systemName: "repeat")
                        .foregroundColor(isRepeated ? .green : .white)
                }
            }
            .padding(.vertical, 20)
            
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.6), Color.black]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
    
    // Helper function to format the time in minutes and seconds
    func timeFormatted(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
