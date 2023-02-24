//
//  FeedStoreSpy.swift
//  EssentialFeedTests
//
//  Created by Dilshod Zopirov on 2/24/23.
//

import Foundation
import EssentialFeed

class FeedStoreSpy: FeedStore {
    enum ReceivedMessage: Equatable {
        case deletedCacheFeed
        case insert([LocalFeedImage], Date)
    }
    
    var deletionCompletions: [DeletionCompletion] = []
    var insertionCompletions: [InsertionCompletion] = []
    private(set) var receivedMessages: [ReceivedMessage] = []
    
    func deleteCacheFeed(completion: @escaping DeletionCompletion) {
        deletionCompletions.append(completion)
        receivedMessages.append(.deletedCacheFeed)
    }
    
    func completeDeletion(with error: Error, at index: Int = 0) {
        deletionCompletions[index](error)
    }
    
    func completeDeletionSuccessfully(at index: Int = 0) {
        deletionCompletions[index](nil)
    }
    
    func insert(_ items: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        receivedMessages.append(.insert(items, timestamp))
        insertionCompletions.append(completion)
    }

    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletions[index](error)
    }
    
    func completeInsertionSuccessfully(at index: Int = 0) {
        insertionCompletions[index](nil)
    }
}
