//
//  AudioManager.swift
//  testAnimasi
//
//  Created by Audrey Saudjhana on 14/11/20.
//

import Foundation
import AVFoundation
import AudioToolbox

public final class AudioPlayer: NSObject{
    //singleton
    static let shared: AudioPlayer = AudioPlayer()
    
    private var player: AVAudioPlayer? = nil
    
    func playSound(filename: String, audiotype: String){
        guard let url = Bundle.main.url(forResource: filename, withExtension: audiotype) else {return}
        
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else {return}
            player.play()
            print("\(filename).\(audiotype) is on")
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
