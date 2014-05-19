//
//  ViewController.h
//  TesteAppFinal
//
//  Created by VINICIUS RESENDE FIALHO on 09/05/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

@interface ViewController : UIViewController <NSXMLParserDelegate> {
    NSXMLParser *parser;
    
    NSMutableArray *descricaoGeralPartitura;
    NSMutableArray *pentagramaPartitura;
    NSMutableArray *notasPartitura;
    NSMutableArray *notasPartitura2;
    
    NSString *element;
    NSString *codeValue;
    
    NSMutableDictionary *item;
    NSMutableDictionary *partitura;
    NSMutableDictionary *notas;
    
    //descricao da partitura
    NSMutableString *titulo;
    NSMutableString *data;
    NSMutableString *nomeInstrumento;
    
    //partitura
    NSMutableString *n1;
    NSMutableString *armaduraClave;
    NSMutableString *numeroDeTempo;
    NSMutableString *unidadeDeTempo;
    NSMutableString *tipoClave;
    NSMutableString *linhaClave;
    
    //Notas
    NSMutableString *n2;
    NSMutableString *n3;
    NSMutableString *n4;
    NSMutableString *n5;
    NSMutableString *tom;
    NSMutableString *nivelPentagrama;
    
    
    AVQueuePlayer *queuePlayer;
    AVQueuePlayer *queuePlayer2;
    
    AVAudioPlayer *audio;
    AVAudioPlayer *audio2;
    AVAudioPlayer *audio3;
    AVAudioPlayer *audio4;
    
    AVAudioPlayer *audio5;
    AVAudioPlayer *audio6;
    AVAudioPlayer *audio7;
    AVAudioPlayer *audio8;
    
    NSMutableArray *nomeNotas;
    
    int auxIndiceNotas;
    int auxIndiceNotas2;
    BOOL estadoStaff;
    
    float controleVelocidaTranNota;
    
    
    AVPlayer* _player;
    AVMutableComposition* _composition;
    NSMutableDictionary* _audioMixValues;  // track name -> volume level 0.0 - 1.0
    NSMutableDictionary* _audioMixTrackIDs; // track name -> track ID
   
   
    
}

- (IBAction)buttonPlay:(id)sender;



@end
