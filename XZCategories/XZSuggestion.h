//
//  XZSuggestion.h
//  XZTenant
//
//  Created by niekaihua on 16/8/2.
//  Copyright © 2016年 xiaozhu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FilterType) {
    FilterType_error,
    FilterType_fujin,
    FilterType_xingzhengqu,
    FilterType_ditiexianlu,
    FilterType_chezhanjichang,
    FilterType_shangquan,
    FilterType_yiyuan,
    FilterType_jingdian,
    FilterType_gaoxiao,
    FilterType_ditiezhan
};


@interface XZSuggestionFilter : NSObject

@property (nonatomic, copy)                     NSString    *filterKey;
@property (nonatomic, copy,  readonly)          NSString    *filterName;
@property (nonatomic, assign,readonly)          FilterType  filterType;

@property (nonatomic, assign)                   NSInteger   nodeLevel;
@property (nonatomic, strong)                   NSArray     *subResults;
@property (nonatomic, assign, getter=isUnfold)  BOOL        unfold;
@property (nonatomic, assign, readonly)         BOOL        existSubNode;

@end


typedef NS_ENUM(NSInteger, SuggestionType)
{
    SuggestionNone,
    SuggestionCity,             //城市
    SuggestionDistrict,         //行政区
    SuggestionLandmark,         //地标点
    SuggestionNearby,           //附近
    SuggestionDistrictLandmark, //行政区+地标点
    SuggestionSubway,           //地铁线
};

@protocol XZSuggestionProtocol <NSObject>

@required

- (instancetype) initWithDict: (NSDictionary *)dict;
@property (nonatomic, readonly) NSDictionary *dict;
@property (nonatomic, readonly) NSString * type;
@property (nonatomic, readonly) NSString * displayName;
@property (nonatomic, readonly) NSString * pinyin;
@property (nonatomic, readonly) SuggestionType suggestionType;

@property (nonatomic, readonly) NSString * cityId;
@property (nonatomic, readonly) NSString * cityName;

@optional

@property (nonatomic, readonly) NSString * distId;
@property (nonatomic, readonly) NSString * distName;

@property (nonatomic, readonly) NSString * locId;
@property (nonatomic, readonly) NSString * locName;

// 这里的经纬度可以和城市、行政区、地标点组合
@property (nonatomic, readonly) NSString * longitude;
@property (nonatomic, readonly) NSString * latitude;

@property (nonatomic, readonly) NSString * xianluId;
@property (nonatomic, readonly) NSString * xianluName;

@property (nonatomic, readonly) BOOL       isDistrict;

- (BOOL)isCoordinateValid;
@end




@interface XZSuggestion : NSObject<XZSuggestionProtocol,NSCoding>

@property (nonatomic, strong) XZSuggestionFilter *filter;

@end

@interface XZCitySuggestion     : XZSuggestion

@end

@interface XZHotCitySuggestion  : XZCitySuggestion

@property (nonatomic, copy)                     NSString *cityIcon;
@property (nonatomic, assign, getter=isNearby)  BOOL nearBy;
- (void)setNearbyCityId:(NSString *)cityId CityName:(NSString *)cityName;
- (void)setNearbyLongitude:(NSString *)longitude Latitude:(NSString *)latitude;
@end

@interface XZDistrictSuggestion : XZSuggestion

@end

@interface XZLandmarkSuggestion : XZSuggestion

@end

@interface XZDistrictLandmarkSuggestion : XZSuggestion

@end


// 注意这里只是线路名，不是具体站名
@interface XZSubwaySuggestion : XZSuggestion
@end


@interface XZNearbySuggestion : XZSuggestion

//- (void)setNearbyCityId:(NSString *)cityId CityName:(NSString *)cityName;
- (void)setNearbyLongitude:(NSString *)longitude Latitude:(NSString *)latitude;

@end
