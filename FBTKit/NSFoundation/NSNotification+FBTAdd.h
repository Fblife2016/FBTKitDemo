//
//  NSNotification+FBAdd.h
//  FBTNotificationManage
//
//  Created by FB.Luo on 16/1/28.
//  Copyright © 2016年 FB.Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (FBTAdd)
/**
 *  把对象注册为观察者
 *
 *  @param observerBlock 观察者执行的block
 *  @param name          消息的名字
 *  @param object        对观察者过滤
 */
-(void)fbt_addObserverBlock:(void(^)(NSNotification *))observerBlock name:(NSString *)name object:(id)object;
/**
 *  发送一个消息
 *
 *  @param notification 消息
 */
-(void)fbt_postNotification:(NSNotification *)notification;
/**
 *  发送一个消息
 *
 *  @param name   消息的名字
 *  @param object 对观察者过滤
 */
-(void)fbt_postNotificationName:(NSString *)name object:(id)object;
/**
 *  发送一个消息
 *
 *  @param name     消息的名字
 *  @param object   对观察者过滤
 *  @param userInfo 发送消息时附带的消息上下文
 */
-(void)fbt_postNotificationName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;
/**
 *  移除观察者
 */
-(void)fbt_removeObserver;
/**
 *  移除观察者
 *
 *  @param name   观察者的名字
 *  @param object 对观察着过滤
 */
-(void)fbt_removeObserverWithName:(NSString *)name object:(id)object;
@end

