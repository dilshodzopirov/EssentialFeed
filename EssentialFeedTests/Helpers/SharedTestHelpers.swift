//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Dilshod Zopirov on 3/13/23.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 1)
}

func anyURL() -> URL {
    return URL(string: "https://a-url.com")!
}
