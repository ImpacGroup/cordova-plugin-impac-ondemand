//
//  IMPResourceManager.swift
//  Cordova Plugin OnDemand
//
//  Created by Felix Nievelstein on 22.06.20.
//  Copyright © 2020 Impac Gmbh. All rights reserved.
//

import Foundation

@objc (ImpacOnDemand) class ImpacOnDemand: CDVPlugin {
 
    @objc(loadResource:) func loadResource(command: CDVInvokedUrlCommand) {
        
        if command.arguments.count == 1, let tags = command.arguments[0] as? [String] {
            
            IMPOdrManager.shared.requestFiles(tags: Set(tags), onSuccess: {
                let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Loaded")
                self.commandDelegate.send(result, callbackId: command.callbackId)
            }) { (error) in
                let result = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                self.commandDelegate.send(result, callbackId: command.callbackId)
            }
        } else {
            let result = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Missing Tags")
            self.commandDelegate.send(result, callbackId: command.callbackId)
        }
    }
    
    @objc(getPath:) func getPath(command: CDVInvokedUrlCommand) {
        
        if command.arguments.count == 2, let fileName = command.arguments[0] as? String, let fileExt = command.arguments[1] as? String {
            
            if let path = Bundle.main.path(forResource: fileName, ofType: fileExt) {
                let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: path)
                self.commandDelegate.send(result, callbackId: command.callbackId)
            } else {
                let result = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Not found")
                self.commandDelegate.send(result, callbackId: command.callbackId)
            }
        } else {
            let result = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Missing file name")
            self.commandDelegate.send(result, callbackId: command.callbackId)
        }
    }
}
