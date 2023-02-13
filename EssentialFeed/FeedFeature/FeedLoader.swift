//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by dilshodzopirov on 13/02/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
