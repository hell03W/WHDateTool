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
- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)weekDay
{
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
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
    NSString *dateString = [self stringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
    return dateString;
}

// 返回日期 如: 2013-03-23
- (NSString *)dateString
{
    NSString *dateString = [self stringWithFormat:@"yyyy-MM-dd"];
    return dateString;
}

// 返回时间 如: 12:23:23
- (NSString *)timeString
{
    NSString *dateString = [self stringWithFormat:@"HH:mm:ss"];
    return dateString;
}


// 周日: 1,  weekday范围 1--7
+ (NSInteger)countWeekdayFrom:(NSDate *)startDate to:(NSDate *)endDate weekDay:(NSInteger)weekday {
    
    NSString *formater = @"yyyy-MM-dd";
    startDate = [[startDate stringWithFormat:formater] dateWithFormater:formater];
    endDate = [[endDate stringWithFormat:formater] dateWithFormater:formater];
    double timeInterval = [endDate timeIntervalSince1970] - [startDate timeIntervalSince1970];
    if (timeInterval <= 0) return 0;
    
    NSInteger dayInterval = timeInterval / (60.f * 60.f * 24.f) + 1;
    NSInteger startWeekday = [startDate weekDay];
    NSInteger frontDays = weekday - startWeekday;
    frontDays = (frontDays < 0) ? frontDays + 7 : frontDays;

    return (dayInterval - frontDays) / 7 + ((dayInterval - frontDays) % 7 > 0);
}

@end


@implementation NSString (WHDateTools)

- (NSDate *)dateWithFormater:(NSString *)formater
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formater;
    
    return [formatter dateFromString:self];
}

- (NSString *)dateStringFromTimestampWithFormater:(NSString *)formater
{
    NSDate *date = [self dateWithFormater:formater];
    NSString *dateString = [date stringWithFormat:formater];
    return dateString;
}

@end




/*
 year;
 month;
 day;
 hour;
 minute;
 second;
 weekDay;
 */













