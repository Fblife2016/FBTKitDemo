//
//  NSNotification+FBAdd.m
//  FBTNotificationManage
//
//  Created by FB.Luo on 16/1/28.
//  Copyright © 2016年 FB.Luo. All rights reserved.
//

#import "NSNotification+FBTAdd.h"
#import <objc/runtime.h>
static NSString *const k_FBTAdd_NotificationBlock = @"k_FBTAdd_NotificationBlock";
static inline NSNotificationCenter *DefaultNotificationCenter() {
    return [NSNotificationCenter defaultCenter];
}
@interface NSObject ()
@property (nonatomic, copy) void(^_fbt_ExecSelectorBlock)(id object);
@end

@implementation NSObject (FBTAdd)
- (void)fbt_ExecSelector:(NSNotification *)notification {
    !self._fbt_ExecSelectorBlock ?: self._fbt_ExecSelectorBlock(notification);
}

-(void)fbt_addObserverBlock:(void(^)(NSNotification *))observerBlock name:(NSString *)name object:(id)object{

    self._fbt_ExecSelectorBlock = observerBlock;
    [DefaultNotificationCenter() addObserver:self selector:@selector(fbt_ExecSelector:) name:name object:object];
}
-(void)fbt_postNotification:(NSNotification *)notification {
    [DefaultNotificationCenter() postNotification:notification];
}
-(void)fbt_postNotificationName:(NSString *)name object:(id)object {
    [DefaultNotificationCenter() postNotificationName:name object:object];
}
-(void)fbt_postNotificationName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
    [DefaultNotificationCenter() postNotificationName:name object:object userInfo:userInfo];
}

-(void)fbt_removeObserver {
    [DefaultNotificationCenter() removeObserver:self];
    
}
-(void)fbt_removeObserverWithName:(NSString *)name object:(id)object {
    [DefaultNotificationCenter() removeObserver:self name:name object:object];
 
}

- (void (^)(id))_fbt_ExecSelectorBlock{
    return objc_getAssociatedObject(self, &k_FBTAdd_NotificationBlock);
}
- (void)set_fbt_ExecSelectorBlock:(void (^)(id))_fbt_ExecSelectorBlock{
    objc_setAssociatedObject(self, &k_FBTAdd_NotificationBlock, _fbt_ExecSelectorBlock, OBJC_ASSOCIATION_COPY);
}
@end
