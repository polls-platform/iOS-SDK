//
//  PollOptionResponse.swift
//  
//
//  Created by Jeff Hanna on 8/24/22.
//

import Foundation

/**
 The PollOptionResponse object is the structure of options when they are returned from the SDK.
 For example, when a user taps view details on an option, the SDK will provide the option in this structure
 */
public protocol PollOptionResponse: Codable {
    
    /**
     The ID of the option
     */
    var id: UUID { get }
    /**
     The URL of the option which was provided when creating the poll
     */
    var url: URL { get }
    /**
     The Resource ID of the option if one was provided when creating the poll
     */
    var resourceId: String { get }
}
