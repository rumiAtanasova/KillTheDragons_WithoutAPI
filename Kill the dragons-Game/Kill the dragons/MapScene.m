
#import "MapScene.h"
#import "Background.h"
#import "LevelsInfo.h"
#import "GameScene.h"


@interface MapScene ()
@property(strong, nonatomic) Background* background;
@property (nonatomic, strong) SKSpriteNode* levelOne;
@property (nonatomic, strong) SKSpriteNode* levelTwo;
@property (nonatomic, strong) SKSpriteNode* levelThree;
@property (nonatomic, strong) SKSpriteNode* levelFour;
@property (nonatomic, strong) SKSpriteNode* levelFive;
@property (nonatomic, strong) SKSpriteNode* levelSix;
@property (nonatomic, strong) SKSpriteNode* menuButton;
@property (nonatomic, readwrite) NSInteger choosenLevel;
@property (nonatomic, strong) NSDictionary* infoForChoosenLevel;



@end

@implementation MapScene

+(instancetype) sharedInstance {
    static MapScene* instance = nil;
    static dispatch_once_t token;
    if (instance == nil) {
        dispatch_once (&token, ^{
            instance = [[super alloc]init];
        });
    }
    return instance;
}

+(instancetype)alloc {
    return [MapScene sharedInstance];
}


- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        
        self.background = [Background generateBackgroundWithImage:@"gameMap.jpg"];
        [self addChild: self.background];
        self.levelOne = [SKSpriteNode spriteNodeWithImageNamed:@"1.jpg"];
        self.levelOne.name = @"LevelOne";
        self.levelOne.anchorPoint = CGPointMake(0, 0);
        self.levelOne.position = CGPointMake(90, 285);
        self.levelOne.zPosition = 50;
        [self addChild:self.levelOne];
        self.levelTwo = [SKSpriteNode spriteNodeWithImageNamed:@"2.jpg"];
        self.levelTwo.name = @"LevelTwo";
        self.levelTwo.anchorPoint = CGPointMake(0, 0);
        self.levelTwo.position = CGPointMake(290, 285);
        [self addChild:self.levelTwo];
        self.levelThree = [SKSpriteNode spriteNodeWithImageNamed:@"3.png"];
        self.levelThree.name = @"LevelThtee";
        self.levelThree.anchorPoint = CGPointMake(0, 0);
        self.levelThree.position = CGPointMake(240, 155);
        [self addChild:self.levelThree];
        self.levelFour = [SKSpriteNode spriteNodeWithImageNamed:@"4.png"];
        self.levelFour.name = @"LevelFour";
        self.levelFour.anchorPoint = CGPointMake(0, 0);
        self.levelFour.position = CGPointMake(370, 125);
        [self addChild:self.levelFour];
        self.levelFive = [SKSpriteNode spriteNodeWithImageNamed:@"5.png"];
        self.levelFive.name = @"LevelFive";
        self.levelFive.anchorPoint = CGPointMake(0, 0);
        self.levelFive.position = CGPointMake(550, 130);
        [self addChild:self.levelFive];
        self.levelSix = [SKSpriteNode spriteNodeWithImageNamed:@"6.png"];
        self.levelSix.name = @"LevelSix";
        self.levelSix.anchorPoint = CGPointMake(0, 0);
        self.levelSix.position = CGPointMake(550, 65);
        [self addChild:self.levelSix];
        self.menuButton = [SKSpriteNode spriteNodeWithImageNamed:@"menuButton.png"];
        self.menuButton.name = @"menuButton";
        self.menuButton.position = CGPointMake(self.menuButton.size.width, self.menuButton.size.height);
        [self addChild:self.menuButton];
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch* touch = [touches anyObject];
    SKSpriteNode* touchedNode = (SKSpriteNode*)[self nodeAtPoint:[touch locationInNode:self]];
    
    if ([touchedNode.name isEqualToString: self.levelOne.name]) {
        self.choosenLevel = 1;
        [self goToGameScene];
    }
    if ([touchedNode.name isEqualToString: self.levelTwo.name]) {
        self.choosenLevel = 2;
        [self goToGameScene];
    }
    if ([touchedNode.name isEqualToString: self.levelThree.name]) {
        self.choosenLevel = 3;
        [self goToGameScene];
    }
    if ([touchedNode.name isEqualToString: self.levelFour.name]) {
        self.choosenLevel = 4;
        [self goToGameScene];
    }
    if ([touchedNode.name isEqualToString: self.levelFive.name]) {
        self.choosenLevel = 5;
        [self goToGameScene];
    }
    if ([touchedNode.name isEqualToString: self.levelSix.name]) {
        self.choosenLevel = 6;
        [self goToGameScene];
    }


    
    
}

-(void)changeScene {
    self.infoForChoosenLevel = [NSDictionary dictionaryWithDictionary:[[LevelsInfo sharedInstance] infoForLevel:self.choosenLevel]];
    
}

-(void)goToGameScene {
    [self changeScene];
    SKTransition *reveal = [SKTransition fadeWithDuration:0.1];
    
    SKScene * gameScene = [[GameScene alloc] initWithSize:self.size andPlayerHealth: [self givePlayerHealth] andEnemies:[self enemiesInfo]];
    [self.view presentScene:gameScene transition: reveal];

}

-(NSInteger)givePlayerHealth {
    NSNumber* healht = self.infoForChoosenLevel[@"health"];
    NSInteger playerHealht = [healht integerValue];
    return playerHealht;
}

-(NSArray*)enemiesInfo {
    return self.infoForChoosenLevel[@"enemies"];
}

-(void)goToLevel:(NSInteger)level {
    self.choosenLevel = level;
    [self changeScene];
}




@end
