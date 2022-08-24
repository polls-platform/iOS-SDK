//
//  Analytics.swift
//  
//
//  Created by Jeff Hanna on 8/24/22.
//

import Foundation

/**
 AnalyticsEvents are forwarded from the `PollViewController`
 For more information, go to https://docs.pollsplatform.com/analytics
 */
public struct AnalyticsEvent {
    
    /**
     The name of the event
     */
    public var name: String
    /**
     Parameters are a JSON Dictionary
     */
    public var parameters: [String: Any]?
}
