//
//  ViewController.m
//  BorrarBloques00001
//
//  Created by Henry AT on 1/6/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // - - -  Ejemplo 1
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    int dato = 45;
    
    int(^miBloque)(int) = ^(int num){return  num * dato; };
    
    double(^miBloque2)(float) = ^(float num){ return  num * 2.2; };
    
    printf("||%d||", miBloque(3));
    NSLog(@"----------");
    printf("||%f||", miBloque2(2.2));
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - -  Ejemplo 2
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    [self miMetodo:^(BOOL finished) {
        if (finished) {
            NSLog(@" Sucess....");
        }else{
            NSLog(@" NO fue exitoso....");
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
-(void)miMetodo:(MiBlooque3) complock{
// Aqui hacer cosas:
//    complock(YES);
    complock(NO);

}
@end
