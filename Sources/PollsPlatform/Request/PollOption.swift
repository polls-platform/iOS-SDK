//
//  PollOption.swift
//  
//
//  Created by Jeff Hanna on 8/24/22.
//

import Foundation

/**
 The OptionRequest object is used when creating a poll.
 Please see the details below for each property
 */
public protocol PollOptionProtocol: Codable {
    
    /**
     URL to navigate to when users tap "view details" on this option
     It is recommended to add tracking parameters such as UTM to track users
     that arrive on your website or application from a poll
     */
    var url: URL { get }
    /**
     The ID for the resource in your system which is represented by this option
     When a user taps 'View Details' on an option in the poll, this ID can be used
     To navigate the user to the appropriate content
     */
    var resourceId: String { get }
    /**
     Options can have various content types.
     The content determines the fields and visual layout of the option cards
     */
    var contentType: PollOptionContentType { get }
    
}

/**
 Options can have various content types.
 The content determines the fields and visual layout of the option cards.
 This property can be used to safely retrieve the a concrete type such as `PollOptionDefault`
 from the abstract type `PollOptionProtocol`
 */
public enum PollOptionContentType {
    case `default`(option: PollOptionDefault)
}

/**
 This struct is the standard way to create an option in a `Poll`.
 See details below for each property
 */
public struct PollOptionDefault: PollOptionProtocol, Codable {
    
    public init(title: String,
                subtitle: String? = nil,
                details: String? = nil,
                imageUrl: URL,
                url: URL,
                resourceId: String) {
        self.title = title
        self.subtitle = subtitle
        self.details = details
        self.imageUrl = imageUrl
        self.url = url
        self.resourceId = resourceId
    }
    
    /**
     Options can have various content types.
     The content determines the fields and visual layout of the option cards
     */
    public var contentType: PollOptionContentType { return .default(option: self) }
    /**
     title of the option, 1-500 characters, UI will truncate text with ellipses if it doesn't fit
     */
    public let title: String
    /**
     optional, 0-500 characters
     UI will truncate text with ellipses if it doesn't fit
     */
    public let subtitle: String?
    /**
     optional, 0-500 characters
     UI will truncate text with ellipses if it doesn't fit
     */
    public let details: String?
    /**
     URL for thumbnail image
     */
    public let imageUrl: URL
    /**
     URL to navigate to when users tap "view details" on this option
     It is recommended to add tracking parameters such as UTM to track users
     that arrive on your website or application from a poll
     */
    public let url: URL
    /**
     The ID for the resource in your system which is represented by this option
     When a user taps 'View Details' on an option in the poll, this ID can be used
     To navigate the user to the appropriate content
     */
    public let resourceId: String
    
}

/**
 The `PollOption` class is an abstract class which contains helper methods
 for creating concrete instances of the `PollOptionProtocol`
 */
public class PollOption {
    
    private init() {}
    
    /**
     Convenience function to create a `PollOptionDefault` instance.
     */
    public static func `default`(title: String,
                                 subtitle: String? = nil,
                                 details: String? = nil,
                                 imageUrl: URL,
                                 url: URL,
                                 resourceId: String) -> PollOptionDefault {
        return PollOptionDefault(title: title,
                                 subtitle: subtitle,
                                 details: details,
                                 imageUrl: imageUrl,
                                 url: url,
                                 resourceId: resourceId)
    }
    
}
