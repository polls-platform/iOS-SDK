
import Foundation

/**
 Error that might occur when creating a poll
 */
public struct CreatePollError: Error {
    
}

/**
 Result of the create poll operation
 */
public enum CreatePollAsyncResult {
    case success(poll: PollResponse)
    case failure(error: CreatePollError)
}

/**
 Creates a poll and instantly provides a Poll URL that can be opened in the browser or inside of a `PollViewController` component.
 This is the simplest way to create a poll. Loading and failure states will be handled by the `PollViewController` component
 */
public func createPoll(poll: Poll) -> PollResponse? {
    
    // TODO: impelement
    
    return nil
    
}

/**
 Asynchronously creates a poll and provides a Poll URL that can be opened in the browser or inside of a `PollViewController` component.
 When using this function, you must handle loading and failure states.
 For a more simple approach, see the `createPoll` function
 */
public func createPollAsync(poll: Poll, completionBlock: (_ result: CreatePollAsyncResult) -> ()) {
    
    // TODO: implement
    
}
