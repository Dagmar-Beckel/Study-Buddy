//
//  PomoViewModel.swift
//  Study Buddy
//
//  Created by Dagmar Beckel on 7/20/23.
//

import Foundation

class PomoViewModel: ObservableObject {
    
    @Published var progress = Double(0)
    
    var timer = Timer()
    @Published var timerActive = false
    @Published var duration = 0.0
    
    @Published var showPickerSheet = false
    
    init() { }
    
    func setTimer(hours: Int, minutes: Int, seconds: Int) {
        let hrs = hours * 3600, mins = minutes * 60, secs = seconds
        let seconds = secs + mins + hrs
        self.duration = Double(seconds)
    }
    
    func displayPickerSheet() {
        if duration == 0 { showPickerSheet = true }
    }
    
    func dismissPickerSheet() { showPickerSheet = false }
    
    func startTimerButt(hours: Int, mins: Int, secs: Int) {
        if hours != 0 || mins != 0 || secs != 0 {
            setTimer(hours: hours, minutes: mins, seconds: secs)
            enableTimerMethod()
            showPickerSheet = false
        }
    }
    
    func enableTimerMethod() {
        timerActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.duration -= 1
            let seconds = Int(self.duration) % 60
            self.progress = 100 - Double((Double(seconds)/60) * 100)
            if self.duration <= 0 { self.stopTimerButton() }
        }
    }
    
    func timerActionButton() {
        if timerActive {
            timerActive = false
            timer.invalidate()
        } else { enableTimerMethod() }
    }
    
    func stopTimerButton() {
        timerActive = false; timer.invalidate()
        progress = 0; duration = 0
    }
}
