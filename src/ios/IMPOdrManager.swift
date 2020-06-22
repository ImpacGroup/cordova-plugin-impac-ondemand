//
//  IMPOdrManager.swift
//  Cordova Plugin OnDemand
//
//  Created by Felix Nievelstein on 22.06.20.
//  Copyright © 2020 Impac Gmbh. All rights reserved.

//

import Foundation

class IMPOdrManager {

    static let shared = IMPOdrManager()
    var currentRequest: NSBundleResourceRequest?
    
    func requestFiles(tag: String, onSuccess: @escaping () -> Void, onFailure: @escaping (NSError) -> Void) {
        
        currentRequest = NSBundleResourceRequest(tags: [tag])
        
        guard let request = currentRequest else { return }
        
        request.conditionallyBeginAccessingResources { (available) in
            if available {
                onSuccess()
            } else {
                request.beginAccessingResources { (error: Error?) in
                    if let error = error {
                        onFailure(error as NSError)
                    } else {
                        onSuccess()
                    }
                }
            }
        }
    }
}
