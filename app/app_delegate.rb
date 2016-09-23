class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'UnivLinks'
    rootViewController.view.backgroundColor = UIColor.whiteColor
    rootViewController.view.addSubview(label)

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end

  def application(application, continueUserActivity: userActivity, restorationHandler: restorationHandler)
    if userActivity.activityType.isEqualToString(NSUserActivityTypeBrowsingWeb)
      puts userActivity.webpageURL
    end

    true
  end
  
  def label
    tap_recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action: 'label_pressed:')
    tap_recognizer.numberOfTapsRequired = 1
    
    @label ||= UILabel.alloc.initWithFrame(CGRectMake(0, 100, 375, 21))
    @label.text = 'http://id.crowdvoice.me:3000/@apinrdw'
    @label.textColor = UIColor.blueColor
    @label.textAlignment = NSTextAlignmentCenter
    @label.userInteractionEnabled = true
    @label.addGestureRecognizer(tap_recognizer)
  end
  
  def label_pressed(recognizer)
    url = NSURL.URLWithString(@label.text)
    UIApplication.sharedApplication.openURL(url)
  end
end
