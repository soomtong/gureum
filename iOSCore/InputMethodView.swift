//
//  InputMethodView.swift
//  iOS
//
//  Created by Jeong YunWon on 8/3/14.
//  Copyright (c) 2014 youknowone.org. All rights reserved.
//

import UIKit

class InputMethodViewController: UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {
    var layouts: [KeyboardLayout] = []
    @IBOutlet var logTextView: UITextView!

    @IBOutlet var leftSwipeRecognizer: UIGestureRecognizer!
    @IBOutlet var rightSwipeRecognizer: UIGestureRecognizer!
    @IBOutlet var upSwipeRecognizer: UIGestureRecognizer!
    @IBOutlet var downSwipeRecognizer: UIGestureRecognizer!

    var inputMethodView: InputMethodView! {
        get {
            return self.view as InputMethodView!
        }
    }

    var selectedLayoutContext: UnsafeMutablePointer<()> {
        get {
            let context = self.layouts[self.selectedLayoutIndex].context
            assert(context != nil)
            return context
        }
    }

    func resetContext() {
        for layout in self.layouts {
            if layout.context != nil {
                context_truncate(layout.context)
            }
        }
    }

    func keyboardLayoutForLayoutName(name: String, frame: CGRect) -> KeyboardLayout {
        switch name {
        case "qwerty":
            return QwertyKeyboardLayout()
        case "ksx5002":
            return KSX5002KeyboardLayout()
        default:
            return NoKeyboardLayout()
        }
    }

    override func viewDidLoad()  {
        super.viewDidLoad()
        self.loadFromPreferences()
    }

    func loadFromPreferences() {
        assert(self.inputMethodView != nil)

        let layoutsView = self.inputMethodView.layoutsView
        for view in layoutsView.subviews {
            view.removeFromSuperview()
        }

//        원근 모드
//        let image = preferences.theme.backgroundImage
//        if image != nil {
//            self.inputMethodView.backgroundImageView.image = image
//        }

        assert(preferences.themeResources.count > 0)
        self.layouts.removeAll(keepCapacity: true)

        let layoutNames = preferences.layouts
        for (i, name) in enumerate(layoutNames) {
            assert(self.view.bounds.height > 0)
            assert(self.view.bounds.width > 0)
            let layout = self.keyboardLayoutForLayoutName(name, frame: self.view.bounds)
            self.layouts.append(layout)
            layout.view.frame.origin.x = CGFloat(i) * self.view.frame.width
            layoutsView.addSubview(layout.view)
        }

        self.inputMethodView.pageControl.numberOfPages = layouts.count
        self.selectLayoutByIndex(preferences.defaultLayoutIndex, animated: false)
    }

    func transitionViewToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator!) {
        let themeTrait = preferences.theme.traitForSize(size)
        let layoutIndex = self.selectedLayoutIndex
        self.view.frame.size = size
        self.inputMethodView.layoutsView.contentSize = CGSizeMake(size.width * CGFloat(self.layouts.count), 0)
        for (i, layout) in enumerate(self.layouts) {
            layout.view.backgroundImageView.image = themeTrait.backgroundImage
            layout.view.foregroundImageView.image = themeTrait.foregroundImage
            layout.view.frame.origin.x = CGFloat(i) * size.width
            layout.view.frame.size.width = size.width
            layout.transitionViewToSize(size, withTransitionCoordinator: coordinator)
        }
        self.selectLayoutByIndex(layoutIndex, animated: false)
    }

    var selectedLayoutIndex: Int {
        get {
            let layoutsView = self.inputMethodView.layoutsView
            var page = Int(layoutsView.contentOffset.x / layoutsView.frame.size.width + 0.5)
            if page < 0 {
                page = 0
            }
            else if page >= self.inputMethodView.pageControl.numberOfPages {
                page = self.layouts.count - 1
            }
            return page
        }
    }

    func selectLayoutByIndex(index: Int, animated: Bool) {
        self.inputMethodView.layoutsView.contentSize = CGSizeMake(self.inputMethodView.frame.width * CGFloat(self.layouts.count), 0)

        self.inputMethodView.pageControl.currentPage = index
        let offset = CGPointMake(CGFloat(index) * self.inputMethodView.layoutsView.frame.width, 0)
        self.inputMethodView.layoutsView.setContentOffset(offset, animated: animated)

        self.inputMethodView.pageControl.alpha = 1.0
        UIView.animateWithDuration(0.72, animations: { self.inputMethodView.pageControl.alpha = 0.0 })
    }

    @IBAction func leftForSwipeRecognizer(recognizer: UISwipeGestureRecognizer!) {
        let index = self.selectedLayoutIndex
        if index > 0 {
            self.selectLayoutByIndex(index - 1, animated: true)
        }
    }

    @IBAction func rightForSwipeRecognizer(recognizer: UISwipeGestureRecognizer!) {
        let index = self.selectedLayoutIndex
        if index < self.layouts.count - 1 {
            self.selectLayoutByIndex(index + 1, animated: true)
        }
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        self.inputMethodView.pageControl.alpha = 1.0
    }

    func scrollViewDidScroll(scrollView: UIScrollView!) {
        self.inputMethodView.pageControl.currentPage = self.selectedLayoutIndex
    }
}

class InputMethodView: UIView {
    @IBOutlet var layoutsView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    let backgroundImageView: UIImageView = UIImageView()
}
