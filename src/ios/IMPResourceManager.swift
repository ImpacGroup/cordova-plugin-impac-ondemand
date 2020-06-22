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
        if command.arguments.count == 1, let tag = command.arguments[0] as? String {
            IMPOdrManager.shared.requestFiles(tag: tag, onSuccess: {
                let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Loaded")
                self.commandDelegate.send(result, callbackId: command.callbackId)
            }) { (error) in
                let result = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: error.localizedDescription)
                self.commandDelegate.send(result, callbackId: command.callbackId)
            }
        }
    }
}
