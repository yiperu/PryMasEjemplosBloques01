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
    
    
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - -  Ejemplo 3
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    // Creamos nuestra instancia del tipo definido arriba
    MiTipoBloque mibloque;
    
    // Creamos una variable numerica con la directiva __block que hace
    // que podamos modificar su valor desde el interior del bloque
    // siendo nosotros los responsables de lo que pudiera ocurrir.
    // En caso de no indicar __block nos saltaría un error en XCode
    // impidiendo modificar total desde dentro del bloque.
    __block int total = 0;
    
    // Rellenamos el bloque con código
    mibloque = ^ void (int valor) {
        total += valor;
        NSLog(@"Total : %d",total);
   //     NSLog(@&amp;quot;Total: %d&amp;quot;,total);
        // &amp;quot;  = "
    };
    
    // Ejecutamos varias veces el bloque para comprobar
    mibloque(1);    //Total : 1
    mibloque(1);    //Total : 2
    mibloque(1);    //Total : 3
    
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
- (IBAction)btn1erPlano:(id)sender {
    // Creamos la URL para nuestra imagen
    
    NSURL *url = [NSURL URLWithString:@"http://www.kennethprimrose.co.uk/wp-content/uploads/2011/06/scottish-landscape2-800x533.jpg"];
     
     // Obtenemos los datos de la imagen (esto tardara un poco al tratarse
     // de una imagen de alta resolución)
     NSData *dataImagen = [NSData dataWithContentsOfURL:url];
     
     // Creamos un UIImage con los datos obtenidos
     UIImage *imagen = [[UIImage alloc] initWithData:dataImagen];
     
     // Asignamos al UIImageView de nuestra vista dicho UIImage
     self.imagenView.image = imagen;
}

- (IBAction)btn2doPlano:(id)sender {
    
    // Creamos la URL para nuestra imagen
    NSURL *url = [NSURL URLWithString:@"http://www.kennethprimrose.co.uk/wp-content/uploads/2011/06/scottish-landscape9-800x533.jpg"];
     
     // Obtenemos la cola de segundo plano
     dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
     
     // Invocamos en modo asíncrono un bloque en la cola que hemos recuperado
     dispatch_async(backgroundQueue, ^{
        
        // Obtenemos los datos de la imagen (esto tardara un poco al
        // tratarse de una imagen de alta resolución)
        NSData *dataImagen = [NSData dataWithContentsOfURL:url];
        
        // Creamos un UIImage con los datos obtenidos
        UIImage *imagen = [[UIImage alloc] initWithData:dataImagen];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // Asignamos al UIImageView de nuestra vista dicho UIImage
            self.imagenView.image = imagen;
            
        });
        
    });
     
}
@end
