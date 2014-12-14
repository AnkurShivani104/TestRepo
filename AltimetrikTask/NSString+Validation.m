//
//  NSString+Validation.m
//  AltimetrikTask
//
//  Created by ANKUR on 13/12/14.
//  Copyright (c) 2014 ANKUR SHIVANI. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

-(BOOL)isValid {
    NSString *regex = @"[A-Z0-9a-z]*";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailPredicate evaluateWithObject:self];
}
@end
