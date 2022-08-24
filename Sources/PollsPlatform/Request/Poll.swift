//
//  Poll.swift
//
//
//  Created by Jeff Hanna on 8/23/22.
//

import Foundation

/**
 The `Poll` object is used to create a poll.
 Details are provided below for each property
 */
public struct Poll: Codable {
    
    public init(id: UUID = UUID(),
                ownerId: String,
                settings: PollSettings,
                title: String,
                options: [PollOptionProtocol],
                state: PollState = .live,
                customData: PollCustomData? = nil) {
        self.id = id
        self.ownerId = ownerId
        self.settings = settings
        self.title = title
        self.options = options
        self.state = state
        self.customData = customData
    }
    
    /**
     The ID of the poll in UUID v4 format. You do not need to provide this.
     The Poll ID will be automatically generated if it is not provided.
     Creating the poll will fail if the ID provided is already in use.
     */
    public let id: UUID
    /**
     The `ownerId` is the identifier in your system for the user that is creating the poll.
     This can be used later on to recognize if the current user is the owner of the poll
     */
    public let ownerId: String
    /**
     See `PollSettings` for details on each setting
     */
    public let settings: PollSettings
    /**
     Title of the poll.
     1-500 characters
     UI will truncate text with ellipses if it doesn't fit
     */
    public let title: String
    /**
     Array of the options (choices) in the poll.
     Options can be created via helper methods on the `PollOption` abstract class,
     or by initializing a concrete type such as `PollOptionDefault`.
     */
    public let options: [PollOptionProtocol]
    /**
     The poll state determines if the poll will be live instantly,
     or if the user will be able to edit before publishing
     default: `live`
     */
    public let state: PollState
    /**
     Please contact support if you need to inlclude a custom payload in the poll
     */
    public let customData: PollCustomData?
    
}

// Codable
extension Poll {
    
    public func encode(to encoder: Encoder) throws {
        // TODO: implement
    }
    
    public init(from decoder: Decoder) throws {
        // TODO: implement
        throw CreatePollError()
    }
    
}

/**
 Please contact support if you need to inlclude a custom payload in the poll
 */
public typealias PollCustomData = [String: Any]

/**
 Settings of the poll, see details below on each property
 */
public struct PollSettings: Codable {
    public init(multipleVotes: Bool,
                postVoteAction: PostVoteAction) {
        self.multipleVotes = multipleVotes
        self.postVoteAction = postVoteAction
    }
    
    /**
     This setting determines if users can vote on more than one option in the list.
     From our research, most users (>80%) prefer to allowing users to multi-vote
     */
    public let multipleVotes: Bool
    /**
     This setting determines what happens after users submit their vote.
     See the description of each enum value for details
     */
    public let postVoteAction: PostVoteAction
}

/**
 The poll state determines if the poll will be live instantly,
 or if the user will be able to edit before publishing
 */
public enum PollState: String, Codable {
    /**
     Draft polls can still be opened in the browser or in a `PollViewController` component.
     If the poll state is set to draft, the user will be given the option of editing the poll
     before publishing. For example the user can select which of the options they want to include.
     */
    case draft
    /**
     Live polls are instantly published and cannot be edited.
     */
    case live
}

/**
 This enum determines what happens after users submit their vote.
 See the description of each enum value for details.
 If you would like a different post-vote behavior, please contact support.
 */
public enum PostVoteAction: String, Codable {
    /**
     if set to none, after voting users will simply see a confirmation check mark
     */
    case none
    /**
     if set to shareVote, after voting users will be prompted to share their vote back to the group
     */
    case shareVote
}

