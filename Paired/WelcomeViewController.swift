//
//  WelcomeViewController.swift
//  Paired
//
//  Created by Cameron Ehrlich on 8/11/15.
//  Copyright (c) 2015 Paired. All rights reserved.
//

import UIKit
import PureLayout
import Alamofire
import Parse

class WelcomeViewController: UIViewController {
    
    var createAccountButton: UIButton
    
    required init(coder aDecoder: NSCoder) {
        createAccountButton = UIButton.newAutoLayoutView()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let separatorLine = UIView.newAutoLayoutView()
        separatorLine.backgroundColor = UIColor.paired_greenColor()
        self.view.addSubview(separatorLine);
        separatorLine.autoSetDimensionsToSize(CGSizeMake(self.view.bounds.width/1.5, 5))
        separatorLine.autoCenterInSuperview()
        
        let topWelcomeLabel = UILabel.newAutoLayoutView();
        topWelcomeLabel.numberOfLines = 2
        topWelcomeLabel.textAlignment = .Center
        topWelcomeLabel.text = "Give Products Directly to the\nPeople Who Want Them"
        topWelcomeLabel.font = UIFont.systemFontOfSize(25)
        topWelcomeLabel.textColor = UIColor.paired_greyColor()
        self.view.addSubview(topWelcomeLabel)
        topWelcomeLabel.autoAlignAxisToSuperviewAxis(ALAxis.Vertical)
        topWelcomeLabel.autoPinEdge(.Bottom, toEdge: .Top, ofView: separatorLine, withOffset: -30)
        
        let bottomWelcomeLabel = UILabel.newAutoLayoutView()
        bottomWelcomeLabel.numberOfLines = 2
        bottomWelcomeLabel.textAlignment = .Center
        bottomWelcomeLabel.text = "Get Products from the Brands\nThat Want to Give Them"
        bottomWelcomeLabel.font = UIFont.systemFontOfSize(25)
        bottomWelcomeLabel.textColor = UIColor.paired_greyColor()
        self.view.addSubview(bottomWelcomeLabel)
        bottomWelcomeLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        bottomWelcomeLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: separatorLine, withOffset: 30)
        
        createAccountButton.setTitle("   Join   ", forState: .Normal)
        createAccountButton.setTitleColor(UIColor.paired_greyColor(), forState: .Normal)
        createAccountButton.showsTouchWhenHighlighted = true;
        createAccountButton.titleLabel?.font = UIFont.systemFontOfSize(30);
        createAccountButton.layer.borderWidth = 3
        createAccountButton.layer.borderColor = UIColor.paired_greenColor().CGColor
        createAccountButton.layer.cornerRadius = 3
        createAccountButton.addTarget(self, action: "handleButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(createAccountButton)
        createAccountButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 30)
        createAccountButton.autoAlignAxisToSuperviewAxis(.Vertical)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    internal func handleButtonTapped(sender :UIButton) -> Void {
        self.performSegueWithIdentifier("WelcomeToJoin", sender: self)
    }
}

