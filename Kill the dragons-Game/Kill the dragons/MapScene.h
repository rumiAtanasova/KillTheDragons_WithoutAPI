
#import <SpriteKit/SpriteKit.h>
#import "LevelsInfo.h"

@interface MapScene : SKScene
@property (nonatomic, readonly) NSInteger choosenLevel;
+(instancetype) sharedInstance;
-(void)goToLevel:(NSInteger)level;
-(void)changeScene;
-(NSInteger)givePlayerHealth;
-(NSArray*)enemiesInfo;

@end
