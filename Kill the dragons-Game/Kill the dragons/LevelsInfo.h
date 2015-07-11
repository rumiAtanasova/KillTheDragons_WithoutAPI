

#import <Foundation/Foundation.h>

@interface LevelsInfo : NSObject
+(instancetype) sharedInstance;
-(NSDictionary*)infoForLevel:(NSInteger)level;
-(NSString*) backgroundForChoosenLevel:(NSInteger)level;
@end
