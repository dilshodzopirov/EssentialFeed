//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Dilshod Zopirov on 2/21/23.
//

import XCTest

class FeedStore {
    var deleteCachedFeedCallCount: Int = 0
}

class LocalFeedLoader {
    let store: FeedStore
    
    init(store: FeedStore) {
        self.store = store
    }
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
    
}
