//
//  HYUkTextTempModel.h
//  HYUKSDK
//
//  Created by Ocean 李 on 2023/5/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <YYCategories/YYCategories.h>

NS_ASSUME_NONNULL_BEGIN

@interface HYUkTextTempModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat nameWidth;
@property (nonatomic, strong) UIFont *nameFont;
@property (nonatomic, assign) NSInteger type_id;

@end

NS_ASSUME_NONNULL_END
