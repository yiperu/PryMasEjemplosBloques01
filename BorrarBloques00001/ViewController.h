//
//  ViewController.h
//  BorrarBloques00001
//
//  Created by Henry AT on 1/6/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MisBloques.h"

@interface ViewController : UIViewController

-(void)miMetodo:(MiBlooque3) complock;


// Ejemplo N* 3:  Declaracion de un Bloque
typedef void (^MiTipoBloque)(int);



// -- - -  Declaracion de los Datos:
@property (weak, nonatomic) IBOutlet UIImageView *imagenView;
- (IBAction)btn1erPlano:(id)sender;
- (IBAction)btn2doPlano:(id)sender;


@end

