//
//  NSAttributedString+XZMessageEmoji.m
//  XZCategories-Demo
//
//  Created by niekaihua on 16/8/9.
//  Copyright © 2016年 xiaozhu. All rights reserved.
//

#import "NSAttributedString+XZMessageEmoji.h"
#import <UIKit/UIKit.h>
//#import "RegexKitLite.h"

@interface XZMessagePart : NSObject
@property (nonatomic,copy)                  NSString *text;// 某一段文字的内容
@property (nonatomic,assign)                NSRange  range;// 某一段文字的范围
@property (nonatomic,assign,getter=isEmoji) BOOL     emoji;// 是否为表情字符

@end

@implementation XZMessagePart

-(NSString *)description{    
    return [NSString stringWithFormat:@"%@--%@",self.text,NSStringFromRange(self.range)];
}

@end

@interface EmojiAttachment : NSTextAttachment

@end

@implementation EmojiAttachment
// 使表情高度和文字高度相等
- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex
{
    return CGRectMake( 0 , -3, lineFrag.size.height, lineFrag.size.height);
}

@end

@implementation NSAttributedString (XZMessageEmoji)
/*
+ (NSAttributedString *)xz_emojiStringWithString:(nonnull NSMutableAttributedString *)emojiString
{
    NSRegularExpression *regularEx = [NSRegularExpression regularExpressionWithPattern:@"e_[0-9]{3}" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSString *string = emojiString.string;
    
    NSTextCheckingResult *result = [regularEx firstMatchInString:string options:NSMatchingReportCompletion range:NSMakeRange(0, string.length)];
    
    if (result != nil) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@.png", [string substringWithRange:result.range]];
        
        EmojiAttachment *attachment = [[EmojiAttachment alloc] initWithData:nil ofType:nil];
        
        attachment.image = [UIImage imageNamed:imageName];
        
        NSAttributedString *attrString = [NSAttributedString attributedStringWithAttachment:attachment];
        
        [emojiString replaceCharactersInRange:result.range withAttributedString:attrString];
        
        // 递归
        [self emojiStringWithString:emojiString];
    } else {
        return emojiString;
    }
    
    return emojiString;
}


+ (NSAttributedString *)xz_emojiStringWithContent:(nonnull NSString *)content
{
    
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc]init];
    
    NSString *pattern = @"e_[0-9]{3}";
    
    NSMutableArray *parts = [NSMutableArray array];
    
    // 遍历出表情字符
    [content enumerateStringsMatchedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        
        if ((*capturedRanges).length == 0) return;
        
        XZMessagePart *part = [[XZMessagePart alloc]init];
        part.text  = *capturedStrings;
        part.range = *capturedRanges;
        part.emoji = YES;
        [parts addObject:part];
    }];
    
    //遍历出非表情字符
    [content enumerateStringsSeparatedByRegex:pattern usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
        
        if ((*capturedRanges).length == 0) return;
        
        XZMessagePart *part = [[XZMessagePart alloc]init];
        part.text = *capturedStrings;
        part.range = *capturedRanges;
        [parts addObject:part];
    }];
    
    [parts sortUsingComparator:^NSComparisonResult(XZMessagePart *part1, XZMessagePart *part2) {
        if (part1.range.location > part2.range.location) {
            return NSOrderedDescending;
        }else{
            return NSOrderedAscending;
        }
    }];
    
    for (XZMessagePart *part in parts) {
        
        NSAttributedString *attrString = nil;
        if (part.isEmoji) { // 表情字符
            
            NSString *imageName = [NSString stringWithFormat:@"%@.png", part.text];
            EmojiAttachment *attachment = [[EmojiAttachment alloc] initWithData:nil ofType:nil];
            attachment.image = [UIImage imageNamed:imageName];
            attrString = [NSAttributedString attributedStringWithAttachment:attachment];
            
        }else{ //文本字符
            attrString = [[NSAttributedString alloc]initWithString:part.text];
        }
        
        [attributeText appendAttributedString:attrString];
    }
    
    [attributeText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0,attributeText.length)];
    
    return attributeText;
}

*/

@end
