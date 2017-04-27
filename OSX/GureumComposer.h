//
//  GureumComposer.h
//  CharmIM
//
//  Created by youknowone on 11. 9. 16..
//  Copyright 2011 youknowone.org. All rights reserved.
//

#import "CIMComposer.h"

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierQwerty;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierDvorak;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierDvorakQwertyCommand;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierColemak;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierColemakQwertyCommand;

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan2;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan2NoShift;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan2Classic;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan2N9256;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan32;

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan389;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan390;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan391;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan391NoShift;

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Sun90;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan393Classic;

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHanRoman;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHanAhnmatae;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Ahnmatae;

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2011;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2011Classic;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2012;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2012Classic;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2014;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2014Classic;

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2015;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2015Classic;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2015M;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2015P;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_2015PClassic;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_P2;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3_P3;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan314Proposal;

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Moa2014;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Moa2015;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Moa2016;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Moa2017;

FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Sun2014;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3GimKuk38AClassic;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Shin1995;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Shin2003;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Shin2012;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3Shin2015;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3ShinM;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3ShinP;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3ShinPClassic;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3ShinP2;
FOUNDATION_EXTERN NSString *kGureumInputSourceIdentifierHan3ShinP2Classic;

@class RomanComposer;
@class HangulComposer;
@class HanjaComposer;
/*!
    @brief  구름 입력기의 합성기

    입력 모드에 따라 libhangul을 이용하여 문자를 합성해 준다.
*/
@interface GureumComposer : CIMComposer {
  @private
    RomanComposer *romanComposer;
    HangulComposer *hangulComposer;
    HanjaComposer *hanjaComposer;

    NSUInteger lastModifier;
}

@end
