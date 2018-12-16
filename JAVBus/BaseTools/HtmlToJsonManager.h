//
//  HtmlToJsonManager.h
//  JAVBus
//
//  Created by mgfjx on 2018/12/13.
//  Copyright © 2018 mgfjx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HtmlToJsonManager : NSObject

+ (instancetype)manager ;

/**
 有码女优列表

 @param page 分页
 */
- (void)parseActressDataByPage:(NSInteger)page callback:(void (^)(NSArray *array))callback  ;

@end
