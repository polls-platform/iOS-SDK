//
//  ViewController.swift
//  Polls Platform Example iOS App
//
//  Created by Jeff Hanna on 8/23/22.
//

import UIKit
import PollsPlatform

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites List"
        
        
        // configure Polls Platform SDK
        
        let config = PollsPlatform.Config(apiKey: "iSSKPmkrX07yePanHbtWb7BFqzBuEG2Uah999FKM",
                                          domainConfig: .subdomain(subdomain: "demo"),
                                          environment: .production)
        
        PollsPlatform.setConfig(config: config)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.didPressCreatePollButton()
        }
        
    }
    
    // MARK: - actions
    
    @IBAction func didPressCreatePollButton() {
        
        
        // poll title
        
        let title = "Where should we go for dinner?"
        
        // poll settings
        
        let settings = PollSettings(multipleVotes: true,
                                    postVoteAction: .none)
        
        // poll options (choices)
        
        let options = [
            PollOption.default(title: "The Stinger Cocktail Bar and Kitchen",
                               subtitle: "$$$ | American, Upscale, Cocktails",
                               details: "★★★☆☆",
                               imageUrl:
                                URL(string: "https://storage.googleapis.com/voco_main_bucket/images/2842946/original/6a345e95493cc7ea.jpg")!,
                               url: URL(string: "https://seated.app.link/7PGrs2DOWsb")!,
                               resourceId: "seated1"
            ),
            PollOption.default(title: "Empire Steakhouse - Midtown West",
                               subtitle: "$$$ | Extensive Wine List, Upscale",
                               details: "★★★★☆",
                               imageUrl:
                                URL(string: "https://storage.googleapis.com/voco_main_bucket/images/3114377/original/979eb75e535828de.png")!,
                               url: URL(string: "https://seated.app.link/pmVMP4lUWsb")!,
                               resourceId: "seated2"),
            PollOption.default(title: "Hide-Chan Ramen, West Side",
                               subtitle: "$$ | Ramen, Sushi Bar, Bars",
                               details: "★★★★☆",
                               imageUrl:
                                URL(string: "https://storage.googleapis.com/voco_main_bucket/images/3270853/original/c4a6077781c6116a.jpg")!,
                               url: URL(string: "https://seated.app.link/V0D7ovKUWsb")!,
                               resourceId: "seated3")
        ]
        
        // all together
        
        let poll = Poll(ownerId: User.current.id,
                        settings: settings,
                        title: title,
                        options: options)
        
        let response = PollsPlatform.createPoll(poll: poll)!
        
        let pollViewController = PollViewController(pollUrl: response.url,
                                                    flow: .openPoll,
                                                    delegate: self)
        navigationController?.pushViewController(pollViewController, animated: true)
        
    }
    
}

extension ViewController: PollViewControllerDelegate {
    func didPressViewDetails(option: PollsPlatform.PollOptionResponse) {
        let detailViewController = DetailViewController(resourceId: option.resourceId)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func didReceiveAnalyticsEvent(event: AnalyticsEvent) {
        // TODO: make this optional
    }
    
}

