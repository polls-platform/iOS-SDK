//
//  Config.swift
//  
//
//  Created by Jeff Hanna on 8/24/22.
//

import Foundation

/**
 * Config
 */
public struct Config {
    public init(apiKey: String,
                domainConfig: DomainConfig,
                environment: Environment = .production) {
        self.apiKey = apiKey
        self.domainConfig = domainConfig
        self.environment = environment
    }
    
    let apiKey: String
    let domainConfig: DomainConfig
    /**
     * default: production
     */
    let environment: Environment
}

/**
 * default: production
 */
public enum Environment: String {
    case qa
    case production
}

/**
 * The domain config determines the structure of Poll URLs and how users
 * will be navigated when opening a poll on mobile or desktop web.
 * The default configuration type is subdomain, where your polls will be hosted at a subdomain
 * such as `{subdomain}.pollsplatform.com`
 */
public enum DomainConfig {
    /**
     * When using subdomain config, polls will be hosted at `{subdomain}.pollsplatform.com`
     */
    case subdomain(subdomain: String)
}

/**
 Configure the Polls SDK.
 Must be performed before interacting with the SDK.
 Any attempts to interact with the SDK before initializing will result
 in an error.
 The SDK can be initialized multiple times and will always used the latest config.
 */
public func setConfig(config: Config) {
    // TODO: Implement
}
