//
//  PollViewController.swift
//  
//
//  Created by Jeff Hanna on 8/24/22.
//

import Foundation
import UIKit

/**
 Enum used to determine if a user is creating a poll or opening one
 */
public enum OpenPollFlow: String, Codable {
    case createPoll
    case openPoll
}

public protocol PollViewControllerDelegate: AnyObject {
    
    /**
     * This callback will fire when the user wants to view the details of one of the options.
     * When this fires, the user should be navigated to a new screen or a modal/popover should be presented.
     * Note that the user should be able to easily navigate back to the poll to complete their vote.
     */
    func didPressViewDetails(option: PollOptionResponse)
    /**
     * This callback forwards analytics events that occur within the poll.
     * For more information, go to https://docs.pollsplatform.com/analytics
     * Analytics can be forwarded to your own data warehouse such as Google Analytics.
     */
    func didReceiveAnalyticsEvent(event: AnalyticsEvent)
    
}

/**
 * The `PollViewController` is used for both creating and opening polls.
 * For more information, go to https://docs.pollsplatform.com/iOS.
 * Before navigating the user to this screen, you must have a poll URL.
 * You can create a poll using the `createPoll` and `createPollAsync` functions
 * which will respond with a URL that can be passed here.
 * Or if you already have the URL of an existing poll you can pass it
 */
public class PollViewController: UIViewController {
    
    public let pollUrl: URL
    public let flow: OpenPollFlow
    public weak var delegate: PollViewControllerDelegate?
    
    public init(pollUrl: URL,
         flow: OpenPollFlow,
         delegate: PollViewControllerDelegate?) {
        self.pollUrl = pollUrl
        self.flow = flow
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
