//
//  NSDate+WHDateTools.h
//  日期工具类
//
//  Created by  www.6dao.cc on 15/12/29.
//  Copyright © 2015年 www.6dao.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WHDateTools)

// 日期格式
//@property (nonatomic, strong) NSString *dateFormater;

// 用来获取年月日,时分秒,和星期
@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;
@property (nonatomic, readonly) NSInteger weekDay;



// 一个NSDate类型数据,加上一个时间段
- (NSDate *)dateByAddingYears:(NSInteger)years;
- (NSDate *)dateByAddingMonths:(NSInteger)months;
- (NSDate *)dateByAddingWeeks:(NSInteger)weeks;
- (NSDate *)dateByAddingDays:(NSInteger)days;
- (NSDate *)dateByAddingHours:(NSInteger)hours;
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (NSDate *)dateByAddingSeconds:(NSInteger)seconds;


// 时间格式转换
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;


//获取日期,时间,日期时间
- (NSString *)fullDateString; //2014-12-12 12:23:23
- (NSString *)dateString; //2014-12-12
- (NSString *)timeString; //12:23:23


@end

@interface NSString (WHDateTools)

// NSString 类型转换成NSDate类型
- (NSDate *)dateWithFormater:(NSString *)formater;

// 将字符串类型的时间戳转换成指定日期格式的日期字符串
- (NSString *)dateStringFromTimestampWithFormater:(NSString *)formater;

@end





