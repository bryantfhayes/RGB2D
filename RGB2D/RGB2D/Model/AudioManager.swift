//
//  AudioManager.swift
//  RGB2D
//
//  Created by Bryant Hayes on 12/18/17.
//  Copyright © 2017 Bryant Hayes. All rights reserved.
//

import Foundation

class AudioManager {
    static let instance = AudioManager()
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(tileSelectSuccess(_:)), name: TileSelectedSuccessNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tileSelectSuccess(_:)), name: TileSelectedFailedNotification, object: nil)
    }
    
    @objc func tileSelectSuccess(_: Notification) {
        playSound(soundFile: "failed.wav")
    }
    
    @objc func tileSelectFailed(_: Notification) {
        playSound(soundFile: "success.wav")
    }
    
    func playSound(soundFile: String) {
        // TODO: Play the given sound file
    }
}
