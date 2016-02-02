//
//  NSDate+WHDateTools.m
//  日期工具类
//
//  Created by  www.6dao.cc on 15/12/29.
//  Copyright © 2015年 www.6dao.com. All rights reserved.
//

#import "NSDate+WHDateTools.h"



@implementation NSDate (WHDateTools)

#pragma mark - 获取 一个日期所属的年月日时分秒,日期,时间等属性
- (NSInteger)year
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] month];
}

- (NSInteger)day
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] day];
}

- (NSInteger)hour
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] hour];
}

- (NSInteger)minute
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] minute];
}

- (NSInteger)second
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] second];
}

- (NSInteger)weekDay
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] weekday];
}


- (BOOL)isLeapYear
{
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday
{
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isYesterday
{
    NSDate *added = [self dateByAddingDays:1];
    return [added isToday];
}

#pragma mark - 修改日期 

- (NSDate *)dateByAddingYears:(NSInteger)years
{
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger)days
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingHours:(NSInteger)hours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingSeconds:(NSInteger)seconds
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}



- (NSString *)stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

- (NSString *)stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone)
        [formatter setTimeZone:timeZone];
    if (locale)
        [formatter setLocale:locale];
    return [formatter stringFromDate:self];
}


#pragma mark - 日期格式转换
// 返回指定格式的 日期时间字符串 如: 2015-07-29 12:23:34
- (NSString *)fullDateString
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    if (!self.dateFormater) {
        dateFormater.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }else{
        dateFormater.dateFormat = self.dateFormater;
    }
    
    NSString *dateString = [dateFormater stringFromDate:self];
    
    return dateString;
}

// 返回日期 如: 2013-03-23
- (NSString *)dateString
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateString = [dateFormater stringFromDate:self];
    
    return dateString;
}

// 返回时间 如: 12:23:23
- (NSString *)timeString
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = @"HH:mm:ss";
    NSString *dateString = [dateFormater stringFromDate:self];
    
    return dateString;
}


@end


@implementation NSString (WHDateTools)

- (NSDate *)dateWithFormater:(NSString *)formater
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formater;
    
    return [formatter dateFromString:formater];
}

@end




/*year;
 month;
 day;
 hour;
 minute;
 second;
 weekDay;*/













