//
//  XZSuggestion.m
//  XZTenant
//
//  Created by niekaihua on 16/8/2.
//  Copyright © 2016年 xiaozhu.com. All rights reserved.
//

#import "XZSuggestion.h"
#import <CoreLocation/CoreLocation.h>

@implementation XZSuggestionFilter

- (void)setFilterKey:(NSString *)filterKey
{
    _filterKey = filterKey;
    if([self.filterKey isEqualToString:@"fujin"]){
        
        _filterName = @"查看附近";
        _filterType = FilterType_fujin;
        
    }else if ([self.filterKey isEqualToString:@"xingzhengqu"]) {
        _filterName = @"行政区域";
        _filterType = FilterType_xingzhengqu;
        
    } else if ([self.filterKey isEqualToString:@"ditiexianlu"]) {
        _filterName = @"地铁线路";
        _filterType = FilterType_ditiexianlu;
        
    } else if ([self.filterKey isEqualToString:@"chezhanjichang"]) {
        _filterName = @"车站机场";
        _filterType = FilterType_chezhanjichang;
        
    } else if ([self.filterKey isEqualToString:@"shangquan"]) {
        _filterName = @"商圈";
        _filterType = FilterType_shangquan;
        
    } else if ([self.filterKey isEqualToString:@"yiyuan"]) {
        _filterName = @"医院";
        _filterType = FilterType_yiyuan;
        
    } else if ([self.filterKey isEqualToString:@"jingdian"]) {
        _filterName = @"景点";
        _filterType = FilterType_jingdian;
        
    } else if ([self.filterKey isEqualToString:@"gaoxiao"]) {
        _filterName = @"高校";
        _filterType = FilterType_gaoxiao;
        
    } else {
        _filterType = FilterType_error;
    }
}


- (BOOL)existSubNode
{
    if (self.nodeLevel == 0) {
        if ([self.filterKey length]) {
            return YES;
        } else {
            return NO;
        }
    } else if (self.nodeLevel == 1) {
        if (self.filterType == FilterType_ditiexianlu) {
            return YES;
        } else {
            return NO;
        }
    } else {
        // 如果有2级及以上节点，暂时统一默认NO
        return NO;
    }
}

@end





@implementation XZSuggestion
{
    NSMutableDictionary * _dict;
}

// required 

-(NSDictionary *)dict
{
    return _dict;
}

-(NSString *)cityId
{
    return _dict[@"cityId"];
}

-(NSString *)cityName
{
    return _dict[@"cityName"];
}

-(NSString *)pinyin
{
    return _dict[@"pinyin"];
}
-(NSString *)displayName
{
    return _dict[@"displayName"];
}

-(NSString *)type
{
    return _dict[@"type"];
}

-(SuggestionType)suggestionType
{
    return SuggestionNone;
}

// optional

-(NSString *)distId
{
    return _dict[@"distId"];
}
-(NSString *)distName
{
    return _dict[@"distName"];
}

-(NSString *)locId
{
    return _dict[@"locId"];
}
-(NSString *)locName
{
    return _dict[@"locName"];
}

-(NSString *)longitude
{
    return _dict[@"longitude"];
}
-(NSString *)latitude
{
    return _dict[@"latitude"];
}

-(NSString *)xianluId
{
    return _dict[@"xianluId"];
}
-(NSString *)xianluName
{
    return _dict[@"xianluName"];
}

-(BOOL)isDistrict
{
    return [_dict[@"isDistrict"] boolValue];
}

- (BOOL)isCoordinateValid
{
    if ([self.latitude length] && [self.longitude length] && ![self.latitude isEqualToString:@"0"] && ![self.longitude isEqualToString:@"0"]) {
        CLLocationDegrees        latitude  = [self.latitude doubleValue];
        CLLocationDegrees        longitude = [self.longitude doubleValue];
        CLLocationCoordinate2D  coordinate =  CLLocationCoordinate2DMake(latitude,longitude);
        return CLLocationCoordinate2DIsValid(coordinate);
    }else{
        return NO;
    }
}


- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super init]) {
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])){
        NSString *cityId        = [decoder decodeObjectForKey:@"cityId"]        ?:@"";
        NSString *cityName      = [decoder decodeObjectForKey:@"cityName"]      ?:@"";
        NSString *pinyin        = [decoder decodeObjectForKey:@"pinyin"]        ?:@"";
        NSString *displayName   = [decoder decodeObjectForKey:@"displayName"]   ?:@"";
        NSString *type          = [decoder decodeObjectForKey:@"type"]          ?:@"";
        _dict = [NSMutableDictionary dictionaryWithDictionary:@{@"cityId":cityId,
                                                                @"cityName":cityName,
                                                                @"pinyin":pinyin,
                                                                @"displayName":displayName,
                                                                @"type":type,
                                                                }];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.cityId forKey:@"cityId"];
    [encoder encodeObject:self.cityName forKey:@"cityName"];
    [encoder encodeObject:self.pinyin forKey:@"pinyin"];
    [encoder encodeObject:self.displayName forKey:@"displayName"];
    [encoder encodeObject:self.type forKey:@"type"];
}


@end

// -------------------------------------------

@implementation XZCitySuggestion
{
    NSMutableDictionary * _dict;
}

-(SuggestionType)suggestionType
{
    return SuggestionCity;
}
-(NSString *)displayName
{
    return _dict[@"cityName"];
}

- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super initWithCoder:decoder])){
        _dict = [NSMutableDictionary dictionaryWithDictionary:super.dict];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
}

@end

// -------------------------------------------

@implementation XZHotCitySuggestion
{
    NSMutableDictionary * _dict;
}

-(SuggestionType)suggestionType
{
    if (self.isNearby){
        return SuggestionNearby;
    }else{
        return SuggestionCity;
    }
}

-(NSString *)displayName
{
    return _dict[@"cityName"];
}

- (void)setNearbyCityId:(NSString *)cityId CityName:(NSString *)cityName
{
    if (self.isNearby){
        [_dict setObject:cityId forKey:@"cityId"];
        [_dict setObject:cityName forKey:@"cityName"];
    }
}

-(NSString *)cityId{
    return _dict[@"cityId"];
}

-(NSString *)cityName
{
    return _dict[@"cityName"];
}


-(NSString *)longitude
{
    if (self.isNearby){
        return _dict[@"longitude"];
    }else{
        return @"";
    }
}
-(NSString *)latitude
{
    if (self.isNearby){
        return _dict[@"latitude"];
    }else{
        return @"";
    }
}

- (void)setNearbyLongitude:(NSString *)longitude Latitude:(NSString *)latitude
{
    if (self.isNearby){
        [_dict setObject:longitude forKey:@"longitude"];
        [_dict setObject:latitude forKey:@"latitude"];
    }
}

- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super initWithCoder:decoder])){
        _dict = [NSMutableDictionary dictionaryWithDictionary:super.dict];
        self.cityIcon = [decoder decodeObjectForKey:@"cityIcon"];
        self.nearBy = [decoder decodeObjectForKey:@"nearBy"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.cityIcon forKey:@"cityIcon"];
    [encoder encodeBool:self.nearBy forKey:@"nearBy"];
    // 注意这里并没有给nearby的longitude、latitude进行归档
}
@end

// -------------------------------------------

@implementation XZDistrictSuggestion
{
    NSMutableDictionary * _dict;
}

-(NSString *)distId
{
    return _dict[@"distId"];
}
-(NSString *)distName
{
    return _dict[@"distName"];
}
-(SuggestionType)suggestionType
{
    return SuggestionDistrict;
}

-(NSString *)displayName
{
    return _dict[@"distName"];
}

-(BOOL)isDistrict
{
    return YES;
}

- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super initWithCoder:decoder])){
        _dict = [NSMutableDictionary dictionaryWithDictionary:super.dict];
        NSString *distId = [decoder decodeObjectForKey:@"distId"] ?:@"" ;
        NSString *distName = [decoder decodeObjectForKey:@"distName"] ?:@"" ;
        [_dict setObject:distId forKey:@"distId"];
        [_dict setObject:distName forKey:@"distName"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.distId forKey:@"distId"];
    [encoder encodeObject:self.distName forKey:@"distName"];
}
@end

// -------------------------------------------

@implementation XZLandmarkSuggestion
{
    NSMutableDictionary * _dict;
}

-(NSString *)locId
{
    return _dict[@"locId"];
}
-(NSString *)locName
{
    return _dict[@"locName"];
}

-(NSString *)longitude
{
    return _dict[@"longitude"];
}
-(NSString *)latitude
{
    return _dict[@"latitude"];
}

-(SuggestionType)suggestionType
{
    return SuggestionLandmark;
}

-(NSString *)displayName
{
    return _dict[@"locName"];
}

- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super initWithCoder:decoder])){
        _dict = [NSMutableDictionary dictionaryWithDictionary:super.dict];
        NSString *locId = [decoder decodeObjectForKey:@"locId"] ?:@"" ;
        NSString *locName = [decoder decodeObjectForKey:@"locName"] ?:@"" ;
        NSString *longitude = [decoder decodeObjectForKey:@"longitude"] ?:@"" ;
        NSString *latitude = [decoder decodeObjectForKey:@"latitude"] ?:@"" ;
        [_dict setObject:locId forKey:@"locId"];
        [_dict setObject:locName forKey:@"locName"];
        [_dict setObject:longitude forKey:@"longitude"];
        [_dict setObject:latitude forKey:@"latitude"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.locId forKey:@"locId"];
    [encoder encodeObject:self.locName forKey:@"locName"];
    [encoder encodeObject:self.longitude forKey:@"longitude"];
    [encoder encodeObject:self.latitude forKey:@"latitude"];
}
@end

// -------------------------------------------

@implementation XZDistrictLandmarkSuggestion
{
    NSMutableDictionary * _dict;
}

- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];;
    }
    return self;
}

-(SuggestionType)suggestionType
{
    return SuggestionDistrictLandmark;
}

-(NSString *)locId
{
    return _dict[@"locId"];
}
-(NSString *)locName
{
    return _dict[@"locName"];
}

-(NSString *)longitude
{
    return _dict[@"longitude"];
}
-(NSString *)latitude
{
    return _dict[@"latitude"];
}
-(NSString *)distName
{
    return _dict[@"distName"];
}
-(NSString *)displayName
{
    return _dict[@"displayName"];
}
-(BOOL)isDistrict
{
    return [_dict[@"isDistrict"] boolValue];
}

@end


@implementation XZSubwaySuggestion
{
    NSMutableDictionary * _dict;
}

- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];;
    }
    return self;
}
-(SuggestionType)suggestionType
{
    return SuggestionSubway;
}

-(NSString *)xianluId
{
    return _dict[@"xianluId"];
}
-(NSString *)xianluName
{
    return _dict[@"xianluName"];
}

-(NSString *)displayName
{
    return self.xianluName;
}

@end



// -------------------------------------------

@implementation XZNearbySuggestion
{
    NSMutableDictionary * _dict;
}

- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];;
    }
    return self;
}

//- (void)setNearbyCityId:(NSString *)cityId CityName:(NSString *)cityName
//{
//    [_dict setObject:cityId forKey:@"cityId"];
//    [_dict setObject:cityName forKey:@"cityName"];    
//}

-(NSString *)longitude
{
    return _dict[@"longitude"];
}
-(NSString *)latitude
{
    return _dict[@"latitude"];
}

- (void)setNearbyLongitude:(NSString *)longitude Latitude:(NSString *)latitude
{
    [_dict setObject:longitude forKey:@"longitude"];
    [_dict setObject:latitude forKey:@"latitude"];
}


-(SuggestionType)suggestionType
{
    return SuggestionNearby;
}
@end

