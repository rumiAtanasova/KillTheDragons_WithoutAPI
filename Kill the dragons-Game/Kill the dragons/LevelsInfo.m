
#import "LevelsInfo.h"

@interface LevelsInfo ()
@property (nonatomic, strong) NSMutableArray* info;
@property (nonatomic, strong) NSMutableArray* backgroundsForLevels;
@end

@implementation LevelsInfo

+(instancetype) sharedInstance {
    static LevelsInfo* instance = nil;
    static dispatch_once_t token;
    if (instance == nil) {
        dispatch_once (&token, ^{
            instance = [[super alloc]init];
        });
    }
    return instance;
}

+(instancetype)alloc {
    return [LevelsInfo sharedInstance];
}

-(NSDictionary*)infoForLevel:(NSInteger)level {
    return  [self.info objectAtIndex:level-1];
}

-(NSMutableArray*)backgroundsForLevels {
    if (_backgroundsForLevels == nil) {
        self.backgroundsForLevels = [NSMutableArray array];
        for (int i = 0; i < 6; i++) {
            [self.backgroundsForLevels addObject:[NSString stringWithFormat:@"background%d.jpg", i+1]];
        }
    }
    return _backgroundsForLevels;
}

-(NSString*) backgroundForChoosenLevel:(NSInteger)level {
    return [self.backgroundsForLevels objectAtIndex:level-1];
}

-(NSMutableArray*)info {
    if (_info == nil) {
        self.info = [NSMutableArray array];
        [self.info addObject:@{@"health":@4, @"enemies" : @[@{@"type": @1, @"health":@2, @"count": @20, @"damage": @1}, @{@"type": @2, @"health":@3, @"count": @0, @"damage": @2}]}];
        [self.info addObject:@{@"health":@6, @"enemies" : @[@{@"type": @1, @"health":@2, @"count": @40, @"damage": @1}, @{@"type": @2, @"health":@3, @"count": @0, @"damage": @2}]}];
        [self.info addObject:@{@"health":@8, @"enemies" : @[@{@"type": @1, @"health":@2, @"count": @60, @"damage": @1}, @{@"type": @2, @"health":@3, @"count": @0, @"damage": @2}]}];
        [self.info addObject:@{@"health":@14, @"enemies" : @[@{@"type": @1, @"health":@2, @"count": @40, @"damage": @1}, @{@"type": @2, @"health":@3, @"count": @20, @"damage": @2}]}];
        [self.info addObject:@{@"health":@18, @"enemies" : @[@{@"type": @1, @"health":@2, @"count": @30, @"damage": @1}, @{@"type": @2, @"health":@3, @"count": @30, @"damage": @2}]}];
        [self.info addObject:@{@"health":@18, @"enemies" : @[@{@"type": @1, @"health":@2, @"count": @20, @"damage": @1}, @{@"type": @2, @"health":@3, @"count": @40, @"damage": @2}]}];
    }
    return _info;
}

@end
