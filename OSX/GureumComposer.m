//
//  GureumComposer.m
//  CharmIM
//
//  Created by youknowone on 11. 9. 16..
//  Copyright 2011 youknowone.org. All rights reserved.
//

#import "GureumComposer.h"

#import "CIMConfiguration.h"
#import "GureumAppDelegate.h"

#define DEBUG_GUREUM FALSE
#define DEBUG_SHORTCUT FALSE

NSString *kGureumInputSourceIdentifierQwerty = @"org.youknowone.inputmethod.Gureum.qwerty";
// NSString *kGureumInputSourceIdentifierDvorak = @"org.youknowone.inputmethod.Gureum.dvorak";
// NSString *kGureumInputSourceIdentifierDvorakQwertyCommand = @"org.youknowone.inputmethod.Gureum.dvorakq";
// NSString *kGureumInputSourceIdentifierColemak = @"org.youknowone.inputmethod.Gureum.colemak";
// NSString *kGureumInputSourceIdentifierColemakQwertyCommand = @"org.youknowone.inputmethod.Gureum.colemakq";

NSString *kGureumInputSourceIdentifierHan2 = @"org.youknowone.inputmethod.Gureum.han2";
NSString *kGureumInputSourceIdentifierHan2NoShift = @"org.youknowone.inputmethod.Gureum.han2noshift";
NSString *kGureumInputSourceIdentifierHan2Classic = @"org.youknowone.inputmethod.Gureum.han2classic";
NSString *kGureumInputSourceIdentifierHan2N9256 = @"org.youknowone.inputmethod.Gureum.han2n9256";
NSString *kGureumInputSourceIdentifierHan32 = @"org.youknowone.inputmethod.Gureum.han32";

NSString *kGureumInputSourceIdentifierHan389 = @"org.youknowone.inputmethod.Gureum.han389";
NSString *kGureumInputSourceIdentifierHan390 = @"org.youknowone.inputmethod.Gureum.han390";
NSString *kGureumInputSourceIdentifierHan391 = @"org.youknowone.inputmethod.Gureum.han391";
NSString *kGureumInputSourceIdentifierHan391NoShift = @"org.youknowone.inputmethod.Gureum.han391noshift";

NSString *kGureumInputSourceIdentifierHan3Sun90 = @"org.youknowone.inputmethod.Gureum.han3s90";
NSString *kGureumInputSourceIdentifierHan393Classic = @"org.youknowone.inputmethod.Gureum.han393classic";

NSString *kGureumInputSourceIdentifierHanRoman = @"org.youknowone.inputmethod.Gureum.hanroman";
NSString *kGureumInputSourceIdentifierHanAhnmatae = @"org.youknowone.inputmethod.Gureum.hanahnmatae";
NSString *kGureumInputSourceIdentifierHan3Ahnmatae = @"org.youknowone.inputmethod.Gureum.han3ahnmatae";

NSString *kGureumInputSourceIdentifierHan3_2011 = @"org.youknowone.inputmethod.Gureum.han3-2011";
NSString *kGureumInputSourceIdentifierHan3_2011Classic = @"org.youknowone.inputmethod.Gureum.han3-2011classic";
NSString *kGureumInputSourceIdentifierHan3_2012 = @"org.youknowone.inputmethod.Gureum.han3-2012";
NSString *kGureumInputSourceIdentifierHan3_2012Classic = @"org.youknowone.inputmethod.Gureum.han3-2012classic";
NSString *kGureumInputSourceIdentifierHan3_2014 = @"org.youknowone.inputmethod.Gureum.han3-2014";
NSString *kGureumInputSourceIdentifierHan3_2014Classic = @"org.youknowone.inputmethod.Gureum.han3-2014classic";

NSString *kGureumInputSourceIdentifierHan3_2015 = @"org.youknowone.inputmethod.Gureum.han3-2015";
NSString *kGureumInputSourceIdentifierHan3_2015Classic = @"org.youknowone.inputmethod.Gureum.han3-2015classic";
NSString *kGureumInputSourceIdentifierHan3_2015M = @"org.youknowone.inputmethod.Gureum.han3-2015m";
NSString *kGureumInputSourceIdentifierHan3_2015P = @"org.youknowone.inputmethod.Gureum.han3-2015p";
NSString *kGureumInputSourceIdentifierHan3_2015PClassic = @"org.youknowone.inputmethod.Gureum.han3-2015pclassic";
NSString *kGureumInputSourceIdentifierHan3_P2 = @"org.youknowone.inputmethod.Gureum.han3-p2";
NSString *kGureumInputSourceIdentifierHan3_P3 = @"org.youknowone.inputmethod.Gureum.han3-p3";
NSString *kGureumInputSourceIdentifierHan314Proposal = @"org.youknowone.inputmethod.Gureum.han314proposal";

NSString *kGureumInputSourceIdentifierHan3Moa2014 = @"org.youknowone.inputmethod.Gureum.han3moa2014";
NSString *kGureumInputSourceIdentifierHan3Moa2015 = @"org.youknowone.inputmethod.Gureum.han3moa2015";
NSString *kGureumInputSourceIdentifierHan3Moa2016 = @"org.youknowone.inputmethod.Gureum.han3moa2016";
NSString *kGureumInputSourceIdentifierHan3Moa2017 = @"org.youknowone.inputmethod.Gureum.han3moa2017";

NSString *kGureumInputSourceIdentifierHan3Sun2014 = @"org.youknowone.inputmethod.Gureum.han3s2014";
NSString *kGureumInputSourceIdentifierHan3GimKuk38AClassic = @"org.youknowone.inputmethod.Gureum.han3k38aclassic";
NSString *kGureumInputSourceIdentifierHan3Shin1995 = @"org.youknowone.inputmethod.Gureum.han3shin1995";
NSString *kGureumInputSourceIdentifierHan3Shin2003 = @"org.youknowone.inputmethod.Gureum.han3shin2003";
NSString *kGureumInputSourceIdentifierHan3Shin2012 = @"org.youknowone.inputmethod.Gureum.han3shin2012";
NSString *kGureumInputSourceIdentifierHan3Shin2015 = @"org.youknowone.inputmethod.Gureum.han3shin2015";
NSString *kGureumInputSourceIdentifierHan3ShinM = @"org.youknowone.inputmethod.Gureum.han3shinm";
NSString *kGureumInputSourceIdentifierHan3ShinP = @"org.youknowone.inputmethod.Gureum.han3shinp";
NSString *kGureumInputSourceIdentifierHan3ShinPClassic = @"org.youknowone.inputmethod.Gureum.han3shinpclassic";
NSString *kGureumInputSourceIdentifierHan3ShinP2 = @"org.youknowone.inputmethod.Gureum.han3shinp2";
NSString *kGureumInputSourceIdentifierHan3ShinP2Classic = @"org.youknowone.inputmethod.Gureum.han3shinp2classic";

#import "RomanComposer.h"
#import "HangulComposer.h"

@implementation GureumComposer

- (id)init
{
    self = [super init];
    if (self) {
        self->romanComposer = [[RomanComposer alloc] init];
        self->hangulComposer = [[HangulComposer alloc] init];
        self->hanjaComposer = [[HanjaComposer alloc] init];
        self->hanjaComposer.delegate = self->hangulComposer;
        self.delegate = self->romanComposer;
    }
    return self;
}

- (void)dealloc
{
    self.inputMode = nil;
    [self->romanComposer release];
    [self->hangulComposer release];
    [self->hanjaComposer release];
    [super dealloc];
}

NSDictionary *GureumInputSourceToHangulKeyboardIdentifierTable = nil;
+ (void)initialize {
    GureumInputSourceToHangulKeyboardIdentifierTable = [[NSDictionary alloc] initWithObjectsAndKeys:
                                                        @"", kGureumInputSourceIdentifierQwerty,
                                                        @"2", kGureumInputSourceIdentifierHan2,
                                                        @"2noshift", kGureumInputSourceIdentifierHan2NoShift,
                                                        @"2y", kGureumInputSourceIdentifierHan2Classic,
                                                        @"2n9256", kGureumInputSourceIdentifierHan2N9256,
                                                        @"32", kGureumInputSourceIdentifierHan32,
                                                        @"3-89", kGureumInputSourceIdentifierHan389,
                                                        @"3-90", kGureumInputSourceIdentifierHan390,
                                                        @"3-91", kGureumInputSourceIdentifierHan391,
                                                        @"3-91-noshift", kGureumInputSourceIdentifierHan391NoShift,
                                                        @"3sun-1990", kGureumInputSourceIdentifierHan3Sun90,
                                                        @"3-93-yet", kGureumInputSourceIdentifierHan393Classic,
                                                        @"ro", kGureumInputSourceIdentifierHanRoman,
                                                        @"ahn", kGureumInputSourceIdentifierHanAhnmatae,
                                                        @"3ahn", kGureumInputSourceIdentifierHan3Ahnmatae,
                                                        @"3-2011", kGureumInputSourceIdentifierHan3_2011,
                                                        @"3-2011-yet", kGureumInputSourceIdentifierHan3_2011Classic,
                                                        @"3-2012", kGureumInputSourceIdentifierHan3_2012,
                                                        @"3-2012-yet", kGureumInputSourceIdentifierHan3_2012Classic,
                                                        @"3-2014", kGureumInputSourceIdentifierHan3_2014,
                                                        @"3-2014-yet", kGureumInputSourceIdentifierHan3_2014Classic,
                                                        @"3-2015", kGureumInputSourceIdentifierHan3_2015,
                                                        @"3-2015-yet", kGureumInputSourceIdentifierHan3_2015Classic,
                                                        @"3-2015-metal", kGureumInputSourceIdentifierHan3_2015M,
                                                        @"3-2015-patal", kGureumInputSourceIdentifierHan3_2015P,
                                                        @"3-2015-patal-yet", kGureumInputSourceIdentifierHan3_2015PClassic,
                                                        @"3-p2", kGureumInputSourceIdentifierHan3_P2,
                                                        @"3-p3", kGureumInputSourceIdentifierHan3_P3,
                                                        @"3-14-proposal", kGureumInputSourceIdentifierHan314Proposal,
                                                        @"3moa-semoe-2014", kGureumInputSourceIdentifierHan3Moa2014,
                                                        @"3moa-semoe-2015", kGureumInputSourceIdentifierHan3Moa2015,
                                                        @"3moa-semoe-2016", kGureumInputSourceIdentifierHan3Moa2016,
                                                        @"3moa-semoe-2017", kGureumInputSourceIdentifierHan3Moa2017,
                                                        @"3sun-2014", kGureumInputSourceIdentifierHan3Sun2014,
                                                        @"3gimguk-38a-yet", kGureumInputSourceIdentifierHan3GimKuk38AClassic,
                                                        @"3shin-1995", kGureumInputSourceIdentifierHan3Shin1995,
                                                        @"3shin-2003", kGureumInputSourceIdentifierHan3Shin2003,
                                                        @"3shin-2012", kGureumInputSourceIdentifierHan3Shin2012,
                                                        @"3shin-2015", kGureumInputSourceIdentifierHan3Shin2015,
                                                        @"3shin-m", kGureumInputSourceIdentifierHan3ShinM,
                                                        @"3shin-p", kGureumInputSourceIdentifierHan3ShinP,
                                                        @"3shin-p-yet", kGureumInputSourceIdentifierHan3ShinPClassic,
                                                        @"3shin-p2", kGureumInputSourceIdentifierHan3ShinP2,
                                                        @"3shin-p2-yet", kGureumInputSourceIdentifierHan3ShinP2Classic,
                                                        nil];
}

- (void)setInputMode:(NSString *)newInputMode {
    dlog(DEBUG_GUREUM, @"** GureumComposer -setLayoutIdentifier: from input mode %@ to %@", self.inputMode, newInputMode);
    if (self.inputMode == newInputMode || [self.inputMode isEqualToString:newInputMode]) return;

    NSString *keyboardIdentifier = GureumInputSourceToHangulKeyboardIdentifierTable[newInputMode];
    if (keyboardIdentifier.length == 0) {
        self.delegate = self->romanComposer;
    } else {
        self.delegate = self->hangulComposer;
        // 단축키 지원을 위해 마지막 자판을 기억
        [self->hangulComposer setKeyboardWithIdentifier:keyboardIdentifier];
        CIMConfigurationSetObjectForField(CIMSharedConfiguration, newInputMode, lastHangulInputMode);
        [CIMSharedConfiguration saveConfigurationForStringField:&CIMSharedConfiguration->lastHangulInputMode];
    }

    [super setInputMode:newInputMode];
}

- (CIMInputTextProcessResult)inputController:(CIMInputController *)controller commandString:(NSString *)string key:(NSInteger)keyCode modifiers:(NSUInteger)flags client:(id)sender {
    NSInteger inputModifier = flags & NSDeviceIndependentModifierFlagsMask & ~NSAlphaShiftKeyMask;
    BOOL need_exchange = NO;
    BOOL need_hanjamode = NO;
//    if (string == nil) {
//        NSUInteger modifierKey = flags & 0xff;
//        if (self->lastModifier != 0 && modifierKey == 0) {
//            dlog(DEBUG_SHORTCUT, @"**** Trigger modifier: %lx ****", self->lastModifier);
//            NSDictionary *correspondedConfigurations = @{
//                                                         @(0x01): @(CIMSharedConfiguration->leftControlKeyShortcutBehavior),
//                                                         @(0x20): @(CIMSharedConfiguration->leftOptionKeyShortcutBehavior),
//                                                         @(0x08): @(CIMSharedConfiguration->leftCommandKeyShortcutBehavior),
//                                                         @(0x10): @(CIMSharedConfiguration->leftCommandKeyShortcutBehavior),
//                                                         @(0x40): @(CIMSharedConfiguration->leftOptionKeyShortcutBehavior),
//                                                         };
//            for (NSNumber *marker in @[@(0x01), @(0x20), @(0x08), @(0x10), @(0x40)]) {
//                if (self->lastModifier == marker.unsignedIntegerValue ) {
//                    NSInteger configuration = [correspondedConfigurations[marker] integerValue];
//                    switch (configuration) {
//                        case 0:
//                            break;
//                        case 1: {
//                            dlog(DEBUG_SHORTCUT, @"**** Layout exchange by exchange modifier ****");
//                            need_exchange = YES;
//                        }   break;
//                        case 2: {
//                            dlog(DEBUG_SHORTCUT, @"**** Hanja mode by hanja modifier ****");
//                            need_hanjamode = YES;
//                        }   break;
//                        case 3: if (self.delegate == self->hangulComposer) {
//                            dlog(DEBUG_SHORTCUT, @"**** Layout exchange by change to english modifier ****");
//                            need_exchange = YES;
//                        }   break;
//                        case 4: if (self.delegate == self->romanComposer) {
//                            dlog(DEBUG_SHORTCUT, @"**** Layout exchange by change to korean modifier ****");
//                            need_exchange = YES;
//                        }   break;
//                        default:
//                            dassert(NO);
//                            break;
//                    }
//                }
//            }
//        } else {
//            self->lastModifier = modifierKey;
//            dlog(DEBUG_SHORTCUT, @"**** Save modifier: %lx ****", self->lastModifier);
//        }
//    } else
    {
        dlog(DEBUG_SHORTCUT, @"**** Reset modifier ****");
        self->lastModifier = 0;

        if (inputModifier == CIMSharedConfiguration->inputModeExchangeKeyModifier && keyCode == CIMSharedConfiguration->inputModeExchangeKeyCode) {
            dlog(DEBUG_SHORTCUT, @"**** Layout exchange by exchange shortcut ****");
            need_exchange = YES;
        }
        else if (self.delegate == self->hangulComposer && inputModifier == CIMSharedConfiguration->inputModeEnglishKeyModifier && keyCode == CIMSharedConfiguration->inputModeEnglishKeyCode) {
            dlog(DEBUG_SHORTCUT, @"**** Layout exchange by change to english shortcut ****");
            need_exchange = YES;
        }
        else if (self.delegate == self->romanComposer && inputModifier == CIMSharedConfiguration->inputModeKoreanKeyModifier && keyCode == CIMSharedConfiguration->inputModeKoreanKeyCode) {
            dlog(DEBUG_SHORTCUT, @"**** Layout exchange by change to korean shortcut ****");
            need_exchange = YES;
        }

        if (inputModifier == CIMSharedConfiguration->inputModeHanjaKeyModifier && keyCode == CIMSharedConfiguration->inputModeHanjaKeyCode) {
            dlog(DEBUG_SHORTCUT, @"**** Layout exchange by hanja shortcut ****");
            need_hanjamode = YES;
        }
    }

    if (need_exchange) {
        dlog(DEBUG_GUREUM, @"***** Try to change layout *****");
        // 한영전환을 위해 현재 입력 중인 문자 합성 취소
        [self.delegate cancelComposition];
        if (self.delegate == self->romanComposer) {
            NSString *lastHangulInputMode = CIMSharedConfiguration->lastHangulInputMode;
            if (lastHangulInputMode == nil) lastHangulInputMode = kGureumInputSourceIdentifierHan2;
            [sender selectInputMode:lastHangulInputMode];
        } else {
            [sender selectInputMode:kGureumInputSourceIdentifierQwerty];
        }
        dassert(manager);
        manager.needsFakeComposedString = YES;
        return CIMInputTextProcessResultProcessed;
    }

    if (self.delegate == self->hanjaComposer) {
        if (!self->hanjaComposer.mode && self->hanjaComposer.composedString.length == 0 && self->hanjaComposer.commitString.length == 0) {
            // 한자 입력이 완료되었고 한자 모드도 아님
            self.delegate = self->hangulComposer;
        }
    }

    if (self.delegate == self->hangulComposer) {
        if (need_hanjamode) {
            // 현재 조합 중 여부에 따라 한자 모드 여부를 결정
            BOOL isComposing = self->hangulComposer.composedString.length > 0;
            self->hanjaComposer.mode = !isComposing; // 조합 중이 아니면 1회만 사전을 띄운다
            self.delegate = self->hanjaComposer;
            [self.delegate composerSelected:self];
            [self->hanjaComposer updateFromController:controller];
            return CIMInputTextProcessResultProcessed;
        }
        // Vi-mode: esc로 로마자 키보드로 전환
        if (CIMSharedConfiguration->romanModeByEscapeKey && (keyCode == kVK_Escape || (0))) {
            dlog(DEBUG_GUREUM, @"**** Keyboard Changed by Vi-mode");
            [self.delegate cancelComposition];
            [sender selectInputMode:kGureumInputSourceIdentifierQwerty];
            return CIMInputTextProcessResultNotProcessedAndNeedsCommit;
        }
    }
    return CIMInputTextProcessResultNotProcessed;
}

@end
