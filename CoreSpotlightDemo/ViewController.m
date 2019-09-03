//
//  ViewController.m
//  CoreSpotlightDemo
//
//  Created by yangrui on 2019/9/3.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "ViewController.h"
// 导入框架
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSearchalbeItem:@"mg1" imageIndex:1];
    [self addSearchalbeItem:@"mg2" imageIndex:2];
    [self addSearchalbeItem:@"mg3"imageIndex:3];
 
}

-(void)addSearchalbeItem:(NSString *)title imageIndex:(int)index{
    
    // 1. 根据类型创建 搜索属性集合
    CSSearchableItemAttributeSet * attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*) kUTTypeImage];
    
 
   // 2. 设置属性集合的 属性
    attributeSet.title = title;  // 标题就是搜索关键字
    attributeSet.contentDescription = @"芒果真的很好吃";
    attributeSet.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:[NSString stringWithFormat:@"%d.png",index]]);
    
    //3. 指定 唯一标识,  域名标识, 属性集合, 创建 索索条目
    CSSearchableItem *searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:title domainIdentifier:@"123" attributeSet:attributeSet];

    //4. 保存, 关联索性条目
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[searchableItem] completionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%s, %@", __FUNCTION__, [error localizedDescription]);
        }
    }];
    
}



@end
