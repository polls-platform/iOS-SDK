//
//  PollResponse.swift
//  
//
//  Created by Jeff Hanna on 8/24/22.
//

import Foundation

/**
 The PollResponse object defines the structure of polls when they are returned from the SDK.
 For example, when a poll is created, the SDK will provide the poll in this structure.
 This structure is intentionally light at this moment, and will be expanded in the near future to
 include more detail about the poll
 */
public struct PollResponse {
    public let url: URL
}

/**
 The PollResponseAsync object defines the structure of polls when they are returned from the SDK.
 For example, when a poll is created, the SDK will provide the poll in this structure.
 This structure is intentionally light at this moment, and will be expanded in the near future to
 include more detail about the poll
 */
public struct PollResponseAsync {
    public let url: URL
}
