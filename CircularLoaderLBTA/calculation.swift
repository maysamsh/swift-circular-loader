//
//  calculation.swift
//  CircularLoaderLBTA
//
//  Created by Maysam Shahsavari on 15/03/2019.
//  Copyright © 2019 Maysam Shahsavari. All rights reserved.
//

import UIKit
import CoreData

protocol UpdateProgressDelegate {
    func update(progress: Float)
}

class calculation {
    var delegate: UpdateProgressDelegate?
    
    func start_Calculation() {
        DispatchQueue.global().async {
            let semaphore = DispatchSemaphore(value: 0)
            var _shouldContinue = true
            var _counter: Float = 0
            repeat {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
                    if let _delegate = self.delegate {
                        _delegate.update(progress: _counter)
                    }
                    semaphore.signal()
                }
                
                semaphore.wait()
               
                if _counter >= 1 {
                    _shouldContinue = false
                    semaphore.signal()
                }
                 _counter += 0.05
                
            } while _shouldContinue
            
        }
        
        
    }
}


extension Notification.Name {
    static let giveSignal = Notification.Name("giveSignal")

}
