//
//  HomeViewController.swift
//  ConvenientBiZhi-Swift
//
//  Created by gozap on 16/4/20.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController,YSLDraggableCardContainerDelegate,YSLDraggableCardContainerDataSource{
    
    var container : YSLDraggableCardContainer?
    var datas : NSMutableArray?
    var itemArroy : NSMutableArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        datas = NSMutableArray()
        datas?.addObject(UIColor.redColor())
        datas?.addObject(UIColor.orangeColor())
        datas?.addObject(UIColor.greenColor())
        
        self.view.backgroundColor = UIColor.whiteColor()
        container = YSLDraggableCardContainer.init(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        container?.backgroundColor = UIColor.clearColor()
        container?.delegate = self
        container?.dataSource = self
        container!.canDraggableDirection =  [.Left,.Right,.Up,.Down]
        self.view.addSubview(container!)
//        for i in 0  ..< 4 - 1{
//            let size = self.view.frame.size.width / 4.0
//            let  view = UIView.init(frame: CGRectMake(size, self.view.frame.size.height - 150, size, size));
//            view.backgroundColor = UIColor.clearColor()
//            self.view.addSubview(view)
//        }
        self.loadDate()
        container?.reloadCardContainer()
        
        
    }
    
    func loadDate(){
        Alamofire.request(.GET, "http://m.lovebizhi.com/category/1", parameters:nil ).responseString {response in
            switch response.result {
            case .Success:
                 debugPrint(response.result)
                 let dataImage = response.result.value?.dataUsingEncoding(NSUTF8StringEncoding)
                 let xpathParser = TFHpple().dynamicType.init(HTMLData: dataImage)
                 let elements = xpathParser.searchWithXPathQuery("//html/body/div/div/ul/li/a/img")
                 if self.itemArroy  == nil{
                    self.itemArroy = NSMutableArray()
                 }
                 for  temp  in elements{
                    print(temp)
                 }
                break
            case .Failure(let error):
                debugPrint(error)
                break
            }
        }
    }
    
    func cardContainerViewNumberOfViewInIndex(index: Int) -> Int {
        return 3
    }

    func cardContainerViewNextViewWithIndex(index: Int) -> UIView! {
      let color = datas![index] as! UIColor
      let view  = CardView.init(frame: CGRectMake(20, 64,UIScreen.mainScreen().bounds.size.width - 40,UIScreen.mainScreen().bounds.size.height - 200))
        view.backgroundColor = color
        return view
    }
    
    func cardContainerView(cardContainerView: YSLDraggableCardContainer!, didEndDraggingAtIndex index: Int, draggableView: UIView!, draggableDirection: YSLDraggableDirection) {
        
        if draggableDirection == .Left {
            cardContainerView.movePositionWithDirection(draggableDirection, isAutomatic: false)
        }
        if draggableDirection == .Right {
            cardContainerView.movePositionWithDirection(draggableDirection, isAutomatic: false)
        }
        if draggableDirection == .Down {
            cardContainerView.movePositionWithDirection(draggableDirection, isAutomatic: false)
        }
        if draggableDirection == .Up {
            cardContainerView.movePositionWithDirection(draggableDirection, isAutomatic: false)
        }
    }
    
    func cardContainderView(cardContainderView: YSLDraggableCardContainer!, updatePositionWithDraggableView draggableView: UIView!, draggableDirection: YSLDraggableDirection, widthRatio: CGFloat, heightRatio: CGFloat) {
        
        let view  = draggableView as! CardView
        
        if draggableDirection == .Default {
            view.selectedView.alpha = 0.0
        }
        
        if draggableDirection == .Left {
            view.selectedView.backgroundColor = UIColor.orangeColor()
            view.selectedView.alpha = widthRatio > 0.8 ? 0.8 :widthRatio
        }
        
        if draggableDirection == .Right {
            view.selectedView.backgroundColor = UIColor.blackColor()
            view.selectedView.alpha = widthRatio > 0.8 ? 0.8 :widthRatio
        }
        if draggableDirection == .Up {
            view.selectedView.backgroundColor = UIColor.blueColor()
            view.selectedView.alpha = widthRatio > 0.8 ? 0.8 :widthRatio
        }
        if draggableDirection == .Down {
            view.selectedView.backgroundColor = UIColor.brownColor()
            view.selectedView.alpha = widthRatio > 0.8 ? 0.8 :widthRatio
        }
    }
    
    func cardContainerViewDidCompleteAll(container: YSLDraggableCardContainer!) {
        container.reloadCardContainer()
    }
    
    func cardContainerView(cardContainerView: YSLDraggableCardContainer!, didSelectAtIndex index: Int, draggableView: UIView!) {
        print(index)
    }
    
}
