//
//  ViewController.m
//  TesteAppFinal
//
//  Created by VINICIUS RESENDE FIALHO on 09/05/14.
//  Copyright (c) 2014 VINICIUS RESENDE FIALHO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define n64th 0.0625
#define n32th 0.125
#define n16th 0.25
#define eighth 0.5
#define quarter 1.0
#define half 2.0
#define whole 4.0


@implementation ViewController


//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"status"])
//    {
//        if (AVPlayerItemStatusReadyToPlay == _player.currentItem.status)
//        {
//            [_player play];
//        }
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    controleVelocidaTranNota = 0.3;
    
    auxIndiceNotas = 0;
    auxIndiceNotas2 = 0;
    
    estadoStaff = false;
    
    descricaoGeralPartitura = [[NSMutableArray alloc] init];
    notasPartitura = [[NSMutableArray alloc] init];
    pentagramaPartitura = [[NSMutableArray alloc] init];
    
    notasPartitura2 = [[NSMutableArray alloc] init];
    // NSURL *url = [NSURL URLWithString:@"http://images.apple.com/main/rss/hotnews/hotnews.rss"];
    
    NSString *thePath=[[NSBundle mainBundle] pathForResource:@"titanic" ofType:@"xml"];
    NSURL *url=[NSURL fileURLWithPath:thePath];
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    
    nomeNotas = [[NSMutableArray alloc]init];
    [nomeNotas addObject:@"0A"];
    [nomeNotas addObject:@"0AS"];
    [nomeNotas addObject:@"0B"];
    [nomeNotas addObject:@"0C"];
    [nomeNotas addObject:@"0Cs"];
    [nomeNotas addObject:@"0D"];
    [nomeNotas addObject:@"0Ds"];
    [nomeNotas addObject:@"0E"];
    [nomeNotas addObject:@"0F"];
    [nomeNotas addObject:@"0Fs"];
    [nomeNotas addObject:@"0G"];
    [nomeNotas addObject:@"0Gs"];
    
    [nomeNotas addObject:@"1A"];
    [nomeNotas addObject:@"1As"];
    [nomeNotas addObject:@"1B"];
    [nomeNotas addObject:@"1C"];
    [nomeNotas addObject:@"1Cs"];
    [nomeNotas addObject:@"1D"];
    [nomeNotas addObject:@"1Ds"];
    [nomeNotas addObject:@"1E"];
    [nomeNotas addObject:@"1F"];
    [nomeNotas addObject:@"1Fs"];
    [nomeNotas addObject:@"1G"];
    [nomeNotas addObject:@"1Gs"];
    
    [nomeNotas addObject:@"2A"];
    [nomeNotas addObject:@"2As"];
    [nomeNotas addObject:@"2B"];
    [nomeNotas addObject:@"2C"];
    [nomeNotas addObject:@"2Cs"];
    [nomeNotas addObject:@"2D"];
    [nomeNotas addObject:@"2Ds"];
    [nomeNotas addObject:@"2E"];
    [nomeNotas addObject:@"2F"];
    [nomeNotas addObject:@"2Fs"];
    [nomeNotas addObject:@"2G"];
    [nomeNotas addObject:@"2Gs"];
    
    [nomeNotas addObject:@"3A"];
    [nomeNotas addObject:@"3As"];
    [nomeNotas addObject:@"3B"];
    [nomeNotas addObject:@"3C"];
    [nomeNotas addObject:@"3Cs"];
    [nomeNotas addObject:@"3D"];
    [nomeNotas addObject:@"3Ds"];
    [nomeNotas addObject:@"3E"];
    [nomeNotas addObject:@"3F"];
    [nomeNotas addObject:@"3Fs"];
    [nomeNotas addObject:@"3G"];
    [nomeNotas addObject:@"3Gs"];
    
    [nomeNotas addObject:@"4A"];
    [nomeNotas addObject:@"4As"];
    [nomeNotas addObject:@"4B"];
    [nomeNotas addObject:@"4C"];
    [nomeNotas addObject:@"4Cs"];
    [nomeNotas addObject:@"4D"];
    [nomeNotas addObject:@"4Ds"];
    [nomeNotas addObject:@"4E"];
    [nomeNotas addObject:@"4F"];
    [nomeNotas addObject:@"4Fs"];
    [nomeNotas addObject:@"4G"];
    [nomeNotas addObject:@"4Gs"];
    
    [nomeNotas addObject:@"5A"];
    [nomeNotas addObject:@"5As"];
    [nomeNotas addObject:@"5B"];
    [nomeNotas addObject:@"5C"];
    [nomeNotas addObject:@"5Cs"];
    [nomeNotas addObject:@"5D"];
    [nomeNotas addObject:@"5Ds"];
    [nomeNotas addObject:@"5E"];
    [nomeNotas addObject:@"5F"];
    [nomeNotas addObject:@"5Fs"];
    [nomeNotas addObject:@"5G"];
    [nomeNotas addObject:@"5Gs"];
    
    [nomeNotas addObject:@"6A"];
    [nomeNotas addObject:@"6As"];
    [nomeNotas addObject:@"6B"];
    [nomeNotas addObject:@"6C"];
    [nomeNotas addObject:@"6Cs"];
    [nomeNotas addObject:@"6D"];
    [nomeNotas addObject:@"6Ds"];
    [nomeNotas addObject:@"6E"];
    [nomeNotas addObject:@"6F"];
    [nomeNotas addObject:@"6Fs"];
    [nomeNotas addObject:@"6G"];
    [nomeNotas addObject:@"6Gs"];
    
    [nomeNotas addObject:@"7A"];
    [nomeNotas addObject:@"7As"];
    [nomeNotas addObject:@"7B"];
    [nomeNotas addObject:@"7C"];
    
    
//    // Setup
//    _composition = [AVMutableComposition composition];
//    _audioMixValues = [[NSMutableDictionary alloc] initWithCapacity:0];
//    _audioMixTrackIDs = [[NSMutableDictionary alloc] initWithCapacity:0];
//    
//    // Insert the audio tracks into our composition
//    NSArray* tracks = [NSArray arrayWithObjects:@"7A",@"6A",@"5A",@"4A", nil];
//    NSString* audioFileType = @"m4a";
//    
//    for (NSString* trackName in tracks)
//    {
//        AVURLAsset* audioAsset = [[AVURLAsset alloc]initWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:trackName ofType:audioFileType]]
//                                                        options:nil];
//        
//        AVMutableCompositionTrack* audioTrack = [_composition addMutableTrackWithMediaType:AVMediaTypeAudio
//                                                                          preferredTrackID:kCMPersistentTrackID_Invalid];
//        
//        NSError* error;
//        [audioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset.duration)
//                            ofTrack:[[audioAsset tracksWithMediaType:AVMediaTypeAudio]objectAtIndex:0]
//                             atTime:kCMTimeZero
//                              error:&error];
//
//        
//        // Store the track IDs as track name -> track ID
//        [_audioMixTrackIDs setValue:[NSNumber numberWithInteger:audioTrack.trackID]
//                             forKey:trackName];
//        
//
//    }
//    
//    
//    // Create a player for our composition of audio tracks. We observe the status so
//    // we know when the player is ready to play
//    AVPlayerItem* playerItem = [[AVPlayerItem alloc] initWithAsset:[_composition copy]];
//    [playerItem addObserver:self
//                 forKeyPath:@"status"
//                    options:0
//                    context:NULL];
//    
//    _player = [[AVPlayer alloc] initWithPlayerItem:playerItem];

    
    
}




- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"part"]){
        codeValue = [attributeDict objectForKey:@"id"];
    }
    
    if ([element isEqualToString:@"score-partwise"]) {
        item    = [[NSMutableDictionary alloc] init];
        titulo   = [[NSMutableString alloc] init];
        data   = [[NSMutableString alloc] init];
        nomeInstrumento   = [[NSMutableString alloc] init];
    }
    
    if ([element isEqualToString:@"part"]) {
        partitura = [[NSMutableDictionary alloc] init];
        n1 = [[NSMutableString alloc] init];
        armaduraClave = [[NSMutableString alloc] init];
        numeroDeTempo = [[NSMutableString alloc] init];
        unidadeDeTempo = [[NSMutableString alloc] init];
        tipoClave = [[NSMutableString alloc] init];
        linhaClave = [[NSMutableString alloc] init];
    }
   
    if ([element isEqualToString:@"note"]) {
        notas = [[NSMutableDictionary alloc] init];
        n2 = [[NSMutableString alloc] init];
        n3 = [[NSMutableString alloc] init];
        n4 = [[NSMutableString alloc] init];
        n5 = [[NSMutableString alloc] init];
        tom = [[NSMutableString alloc] init];
        nivelPentagrama = [[NSMutableString alloc] init];
        
    }
    
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    
    if ([codeValue isEqualToString:@"P1"])
    {
        //NSLog(@"found: %@", string); // output book title here
    }
    
    //Descricao geral
    if ([element isEqualToString:@"movement-title"]) {
        [titulo appendString:string];
    }
    if ([element isEqualToString:@"encoding-date"]) {
        [data appendString:string];
    }
    if ([element isEqualToString:@"instrument-name"]) {
        [nomeInstrumento appendString:string];
    }
    
    //DescricaoPartitura
    if ([element isEqualToString:@"divisions"]) {
        [n1 appendString:string];
    }
    if ([element isEqualToString:@"fifths"]) {
        [armaduraClave appendString:string];
    }
    if ([element isEqualToString:@"beats"]) {
        [numeroDeTempo appendString:string];
    }
    if ([element isEqualToString:@"beat-type"]) {
        [unidadeDeTempo appendString:string];
    }
    if ([element isEqualToString:@"sign"]) {
        [tipoClave appendString:string];
    }
    if ([element isEqualToString:@"line"]) {
        [linhaClave appendString:string];
    }
    
    //Notas
    if ([element isEqualToString:@"step"]) {
        [n2 appendString:string];
    }
    if ([element isEqualToString:@"octave"]) {
        [n3 appendString:string];
    }
    if ([element isEqualToString:@"duration"]) {
        [n4 appendString:string];
    }
    if ([element isEqualToString:@"type"]) {
        [n5 appendString:string];
    }
    if ([element isEqualToString:@"alter"]) {
        [tom appendString:string];
    }
    if ([element isEqualToString:@"staff"]) {
        [nivelPentagrama appendString:string];
    }
    
    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    if ([elementName isEqualToString:@"score-partwise"]) {
        [item setObject:titulo forKey:@"movement-title"];
        [item setObject:data forKey:@"encoding-date"];
        [item setObject:nomeInstrumento forKey:@"instrument-name"];
        
        [descricaoGeralPartitura addObject:[item copy]];
    }
    
    
    if ([elementName isEqualToString:@"part"]) {

        [partitura setObject:n1 forKey:@"divisions"];
        [partitura setObject:armaduraClave forKey:@"fifths"];
        [partitura setObject:numeroDeTempo forKey:@"beats"];
        [partitura setObject:unidadeDeTempo forKey:@"beat-type"];
        [partitura setObject:tipoClave forKey:@"sign"];
        [partitura setObject:linhaClave forKey:@"line"];
        
        [pentagramaPartitura addObject:[partitura copy]];
    }
    
    // || ([nivelPentagrama rangeOfString:@"1"].location != NSNotFound))
    if ([codeValue isEqualToString:@"P1"]){
        if ([elementName isEqualToString:@"note"]) {
            
            if (([nivelPentagrama rangeOfString:@"1"].location != NSNotFound)) {
                
                [notas setObject:n2 forKey:@"step"];
                [notas setObject:n3 forKey:@"octave"];
                [notas setObject:n4 forKey:@"duration"];
                [notas setObject:n5 forKey:@"type"];
                [notas setObject:tom forKey:@"alter"];
                [notas setObject:nivelPentagrama forKey:@"staff"];
                
                [notasPartitura addObject:[notas copy]];
                
            }else if (([nivelPentagrama rangeOfString:@"2"].location != NSNotFound)){
               
                estadoStaff = true;
                
                [notas setObject:n2 forKey:@"step"];
                [notas setObject:n3 forKey:@"octave"];
                [notas setObject:n4 forKey:@"duration"];
                [notas setObject:n5 forKey:@"type"];
                [notas setObject:tom forKey:@"alter"];
                [notas setObject:nivelPentagrama forKey:@"staff"];
                
                [notasPartitura2 addObject:[notas copy]];
                
            }else{
                [notas setObject:n2 forKey:@"step"];
                [notas setObject:n3 forKey:@"octave"];
                [notas setObject:n4 forKey:@"duration"];
                [notas setObject:n5 forKey:@"type"];
                [notas setObject:tom forKey:@"alter"];
                [notas setObject:nivelPentagrama forKey:@"staff"];
                
                [notasPartitura addObject:[notas copy]];
            }
            
            
            
        }
    }
    
    if  ([codeValue isEqualToString:@"P2"]){
         NSLog(@"stringsEGUNDA %@",nivelPentagrama);
        if ([elementName isEqualToString:@"note"]) {
            [notas setObject:n2 forKey:@"step"];
            [notas setObject:n3 forKey:@"octave"];
            [notas setObject:n4 forKey:@"duration"];
            [notas setObject:n5 forKey:@"type"];
            [notas setObject:tom forKey:@"alter"];
            [notas setObject:nivelPentagrama forKey:@"staff"];
            
            [notasPartitura2 addObject:[notas copy]];
            
        }
    }
    
    
}



- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    NSLog(@"=================DESCRICAO=====================");
    for(int i=0;i<descricaoGeralPartitura.count;i++){
        NSLog(@"titulo = %@",[[descricaoGeralPartitura objectAtIndex:i] objectForKey: @"movement-title"]);
        NSLog(@"data = %@",[[descricaoGeralPartitura objectAtIndex:i] objectForKey: @"encoding-date"]);
        NSLog(@"nome instrumento = %@",[[descricaoGeralPartitura objectAtIndex:i] objectForKey: @"instrument-name"])
    }
    
    NSLog(@"=================PARTITURA=====================");
    for(int i=0;i<pentagramaPartitura.count;i++){
        NSLog(@"Divisao = %@",[[pentagramaPartitura objectAtIndex:i] objectForKey: @"divisions"]);
        NSLog(@"Armadura Clave = %@",[[pentagramaPartitura objectAtIndex:i] objectForKey: @"fifths"]);
        NSLog(@"Numero de tempo = %@",[[pentagramaPartitura objectAtIndex:i] objectForKey: @"beats"]);
        NSLog(@"Unidade de tempo = %@",[[pentagramaPartitura objectAtIndex:i] objectForKey: @"beat-type"]);
        NSLog(@"Tipo clave = %@",[[pentagramaPartitura objectAtIndex:i] objectForKey: @"sign"]);
        NSLog(@"Linha clave = %@",[[pentagramaPartitura objectAtIndex:i] objectForKey: @"line"]);
    }
    
    NSLog(@"=================NOTAS=====================");
    for(int i=0;i<notasPartitura.count;i++){
        NSLog(@"nota %d \n",i+1);
        NSLog(@"n2 = %@",[[notasPartitura objectAtIndex:i] objectForKey: @"step"]);
        NSLog(@"n3 = %@",[[notasPartitura objectAtIndex:i] objectForKey: @"octave"]);
        NSLog(@"n4 = %@",[[notasPartitura objectAtIndex:i] objectForKey: @"duration"]);
        NSLog(@"n5 = %@",[[notasPartitura objectAtIndex:i] objectForKey: @"type"]);
        NSLog(@"Tom = %@",[[notasPartitura objectAtIndex:i] objectForKey: @"alter"]);
        NSLog(@"pOS = %@",[[notasPartitura objectAtIndex:i] objectForKey: @"staff"]);
        NSLog(@"----------------");
    }
    
    NSLog(@"=================NOTAS2=====================");
    for(int i=0;i<notasPartitura2.count;i++){
        NSLog(@"nota %d \n",i+1);
        NSLog(@"n2 = %@",[[notasPartitura2 objectAtIndex:i] objectForKey: @"step"]);
        NSLog(@"n3 = %@",[[notasPartitura2 objectAtIndex:i] objectForKey: @"octave"]);
        NSLog(@"n4 = %@",[[notasPartitura2 objectAtIndex:i] objectForKey: @"duration"]);
        NSLog(@"n5 = %@",[[notasPartitura2 objectAtIndex:i] objectForKey: @"type"]);
        NSLog(@"Tom = %@",[[notasPartitura2 objectAtIndex:i] objectForKey: @"alter"]);
        NSLog(@"pOS = %@",[[notasPartitura objectAtIndex:i] objectForKey: @"staff"]);

        NSLog(@"----------------");
    }
}

-(NSString*)retornaIndiceListaMusicas:(NSString*)nota :(int)escalaTom{
    NSString *notaAcima;
    
    for(int i=0;i<nomeNotas.count;i++){
        if([nota isEqualToString:[nomeNotas objectAtIndex:i]]){
            
            notaAcima = [nomeNotas objectAtIndex:i+escalaTom];
            
            return notaAcima;
        }
    }
    
    return NULL;
}

//////////////////////////////////////////////////////////////////////

-(void)tocarpentagramaAux1{
    
    NSString *nomeNota = [[notasPartitura objectAtIndex:auxIndiceNotas] objectForKey: @"step"];
    NSString *nivelNota = [[notasPartitura objectAtIndex:auxIndiceNotas] objectForKey: @"octave"];
    
    NSString *tomNota = [[notasPartitura objectAtIndex:auxIndiceNotas] objectForKey: @"alter"];
    NSString *auxTomNota = [tomNota stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *tomEncurtado = [auxTomNota stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *notaFinal;
    NSString *auxNotaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *aux2NotaFinal = [auxNotaFinal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    notaFinal = [aux2NotaFinal stringByReplacingOccurrencesOfString:@" " withString:@""];
    

    NSString *tempoNota = [[notasPartitura objectAtIndex:auxIndiceNotas] objectForKey: @"type"];
    NSString *aux2Not = [tempoNota stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    tempoNota = [aux2Not stringByReplacingOccurrencesOfString:@" " withString:@""];
    float tempo;
    BOOL valorDistorceNota =false;
  
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else {
        tempo = whole;
        valorDistorceNota = true;
    }
    
    
    AVPlayerItem *item1;
    NSURL *url1 ;
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
    }else if([notaFinal isEqualToString:@""]){
        
        if([tempoNota isEqualToString:@"64th"]){
            notaFinal = @"1-16tempos";
        }else if([tempoNota isEqualToString:@"32th"]){
            notaFinal = @"1-2tempos";
        }else if([tempoNota isEqualToString:@"16th"]){
            notaFinal = @"1-4tempos";
        }else if([tempoNota isEqualToString:@"eighth"]){
            notaFinal = @"1-8tempos";
        }else if([tempoNota isEqualToString:@"quarter"]){
            notaFinal = @"1tempos";
        }else if([tempoNota isEqualToString:@"half"]){
            notaFinal = @"2tempos";
        }else {
            notaFinal = @"4tempos";
        }
        
        
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
        
    }else{
        
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
    }
    
    
//    queuePlayer2 = [[AVQueuePlayer alloc] initWithPlayerItem:item1];
//    queuePlayer2.volume = 5.0;
//    [queuePlayer2 play];
    
    if(audio2.currentTime < 2.0){
        audio3 = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
        if(valorDistorceNota){
            audio3.enableRate=YES;
            audio3.rate=0.15f;
            valorDistorceNota = false;
        }
        
        [audio3 prepareToPlay];
        [audio3 play];
    }else{
        audio2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
        if(valorDistorceNota){
            audio2.enableRate=YES;
            audio2.rate=0.15f;
            valorDistorceNota = false;
        }
        
        [audio2 prepareToPlay];
        [audio2 play];
    }
    
    NSLog(@"nota %d %@",auxIndiceNotas,notaFinal);
    
    auxIndiceNotas++;
    
    
    if(auxIndiceNotas < notasPartitura.count){
        [NSTimer scheduledTimerWithTimeInterval:tempo-controleVelocidaTranNota target:self selector:@selector(tocarpentagrama1) userInfo:nil repeats:NO];
    }
    
    
    
}

-(void)tocarpentagrama1{
    
    
    NSString *nomeNota = [[notasPartitura objectAtIndex:auxIndiceNotas] objectForKey: @"step"];
    NSString *nivelNota = [[notasPartitura objectAtIndex:auxIndiceNotas] objectForKey: @"octave"];
    
    NSString *tomNota = [[notasPartitura objectAtIndex:auxIndiceNotas] objectForKey: @"alter"];
    NSString *auxTomNota = [tomNota stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *tomEncurtado = [auxTomNota stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *notaFinal;
    NSString *auxNotaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *aux2NotaFinal = [auxNotaFinal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    notaFinal = [aux2NotaFinal stringByReplacingOccurrencesOfString:@" " withString:@""];

    
    NSString *tempoNota = [[notasPartitura objectAtIndex:auxIndiceNotas] objectForKey: @"type"];
    NSString *aux2Not = [tempoNota stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    tempoNota = [aux2Not stringByReplacingOccurrencesOfString:@" " withString:@""];
     tempoNota = [aux2Not stringByReplacingOccurrencesOfString:@" " withString:@""];
    float tempo;
    BOOL valorDistorceNota =false;
    
    
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else {
        tempo = whole;
        valorDistorceNota = true;
    }
    
    
    
    AVPlayerItem *item1;
    NSURL *url1;
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
      
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
       
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
    }else if([notaFinal isEqualToString:@""]){
        
        if([tempoNota isEqualToString:@"64th"]){
            notaFinal = @"1-16tempos";
        }else if([tempoNota isEqualToString:@"32th"]){
            notaFinal = @"1-2tempos";
        }else if([tempoNota isEqualToString:@"16th"]){
            notaFinal = @"1-4tempos";
        }else if([tempoNota isEqualToString:@"eighth"]){
            notaFinal = @"1-8tempos";
        }else if([tempoNota isEqualToString:@"quarter"]){
            notaFinal = @"1tempos";
        }else if([tempoNota isEqualToString:@"half"]){
            notaFinal = @"2tempos";
        }else {
            notaFinal = @"4tempos";
        }
        
        
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
    
    }else{
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
    }
    
    if(audio.currentTime < 2.0){
        audio4 = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
        if(valorDistorceNota){
            audio4.enableRate=YES;
            audio4.rate=0.15f;
            valorDistorceNota = false;
        }
        
        [audio4 prepareToPlay];
        [audio4 play];
    }else{

        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
        if(valorDistorceNota){
            audio.enableRate=YES;
            audio.rate=0.15f;
            valorDistorceNota = false;
        }
        [audio prepareToPlay];
        [audio play];
    }
    
    NSLog(@"nota %d %@",auxIndiceNotas,notaFinal);
    
    auxIndiceNotas++;
    
    
    if(auxIndiceNotas < notasPartitura.count){
        [NSTimer scheduledTimerWithTimeInterval:tempo-controleVelocidaTranNota target:self selector:@selector(tocarpentagramaAux1) userInfo:nil repeats:NO];
    }
    
    
}


/////////////////////////////////////////////////////////////////////


-(void)tocarpentagramaAux2{
    
    NSString *nomeNota = [[notasPartitura2 objectAtIndex:auxIndiceNotas2] objectForKey: @"step"];
    NSString *nivelNota = [[notasPartitura2 objectAtIndex:auxIndiceNotas2] objectForKey: @"octave"];
    
    NSString *tomNota = [[notasPartitura2 objectAtIndex:auxIndiceNotas2] objectForKey: @"alter"];
    NSString *auxTomNota = [tomNota stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *tomEncurtado = [auxTomNota stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *notaFinal;
    NSString *auxNotaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *aux2NotaFinal = [auxNotaFinal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    notaFinal = [aux2NotaFinal stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSString *tempoNota = [[notasPartitura2 objectAtIndex:auxIndiceNotas2] objectForKey: @"type"];
    NSString *aux2Not = [tempoNota stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    tempoNota = [aux2Not stringByReplacingOccurrencesOfString:@" " withString:@""];
    float tempo;
    BOOL valorDistorceNota =false;
    
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else {
        tempo = whole;
        valorDistorceNota = true;
    }
    
    
    AVPlayerItem *item1;
    NSURL *url1 ;
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
    }else if([notaFinal isEqualToString:@""]){
        
        if([tempoNota isEqualToString:@"64th"]){
            notaFinal = @"1-16tempos";
        }else if([tempoNota isEqualToString:@"32th"]){
            notaFinal = @"1-2tempos";
        }else if([tempoNota isEqualToString:@"16th"]){
            notaFinal = @"1-4tempos";
        }else if([tempoNota isEqualToString:@"eighth"]){
            notaFinal = @"1-8tempos";
        }else if([tempoNota isEqualToString:@"quarter"]){
            notaFinal = @"1tempos";
        }else if([tempoNota isEqualToString:@"half"]){
            notaFinal = @"2tempos";
        }else {
            notaFinal = @"4tempos";
        }
        
        
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
        
    }else{
        
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
    }
    
    if(audio7.currentTime < 2.0){
        audio8 = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
        if(valorDistorceNota){
            audio8.enableRate=YES;
            audio8.rate=0.15f;
            valorDistorceNota = false;
        }
        
        [audio8 prepareToPlay];
        [audio8 play];
    }else{
        audio7 = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
        if(valorDistorceNota){
            audio7.enableRate=YES;
            audio7.rate=0.15f;
            valorDistorceNota = false;
        }
        
        [audio7 prepareToPlay];
        [audio7 play];
    }
    
    NSLog(@"notaP2 %d %@",auxIndiceNotas2,notaFinal);
    
    auxIndiceNotas2++;
    
    
    if(auxIndiceNotas2 < notasPartitura2.count){
        [NSTimer scheduledTimerWithTimeInterval:tempo-controleVelocidaTranNota target:self selector:@selector(tocarpentagrama2) userInfo:nil repeats:NO];
    }
    
    
    
}


-(void)tocarpentagrama2{
    
    NSString *nomeNota = [[notasPartitura2 objectAtIndex:auxIndiceNotas2] objectForKey: @"step"];
    NSString *nivelNota = [[notasPartitura2 objectAtIndex:auxIndiceNotas2] objectForKey: @"octave"];
    
    NSString *tomNota = [[notasPartitura2 objectAtIndex:auxIndiceNotas2] objectForKey: @"alter"];
    NSString *auxTomNota = [tomNota stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *tomEncurtado = [auxTomNota stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *notaFinal;
    NSString *auxNotaFinal = [NSString stringWithFormat:@"%@%@",nivelNota,nomeNota];
    NSString *aux2NotaFinal = [auxNotaFinal stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    notaFinal = [aux2NotaFinal stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSString *tempoNota = [[notasPartitura2 objectAtIndex:auxIndiceNotas2] objectForKey: @"type"];
    NSString *aux2Not = [tempoNota stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    tempoNota = [aux2Not stringByReplacingOccurrencesOfString:@" " withString:@""];
    tempoNota = [aux2Not stringByReplacingOccurrencesOfString:@" " withString:@""];
    float tempo;
    BOOL valorDistorceNota =false;
    
    
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else {
        tempo = whole;
        valorDistorceNota = true;
    }
    
    
    
    AVPlayerItem *item1;
    NSURL *url1;
    
    if ([tomEncurtado rangeOfString:@"-1"].location != NSNotFound){
        int indiceDescerEscala = -1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self retornaIndiceListaMusicas:notaFinal:indiceDescerEscala];
        NSLog(@"depois- %@",notaFinal);
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
        
    }else if ([tomEncurtado rangeOfString:@"1"].location != NSNotFound){
        int indiceSubirEscala = 1;
        
        NSLog(@"antes %@",notaFinal);
        notaFinal  = [self retornaIndiceListaMusicas:notaFinal:indiceSubirEscala];
        NSLog(@"depois+ %@",notaFinal);
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
    }else if([notaFinal isEqualToString:@""]){
        
        if([tempoNota isEqualToString:@"64th"]){
            notaFinal = @"1-16tempos";
        }else if([tempoNota isEqualToString:@"32th"]){
            notaFinal = @"1-2tempos";
        }else if([tempoNota isEqualToString:@"16th"]){
            notaFinal = @"1-4tempos";
        }else if([tempoNota isEqualToString:@"eighth"]){
            notaFinal = @"1-8tempos";
        }else if([tempoNota isEqualToString:@"quarter"]){
            notaFinal = @"1tempos";
        }else if([tempoNota isEqualToString:@"half"]){
            notaFinal = @"2tempos";
        }else {
            notaFinal = @"4tempos";
        }
        
        
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
        
    }else{
        url1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:notaFinal ofType:@"m4a"]];
        item1 = [[AVPlayerItem alloc] initWithURL:url1];
        
    }
    
    if(audio5.currentTime < 2.0){
        audio6 = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
        if(valorDistorceNota){
            audio6.enableRate=YES;
            audio6.rate=0.15f;
            valorDistorceNota = false;
        }
        
        [audio6 prepareToPlay];
        [audio6 play];
    }else{
        
        audio5 = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
        if(valorDistorceNota){
            audio5.enableRate=YES;
            audio5.rate=0.15f;
            valorDistorceNota = false;
        }
        [audio5 prepareToPlay];
        [audio5 play];
    }
    
    NSLog(@"notaP2 %d %@",auxIndiceNotas2,notaFinal);
    
    auxIndiceNotas2++;
    
    
    if(auxIndiceNotas2 < notasPartitura2.count){
        [NSTimer scheduledTimerWithTimeInterval:tempo-controleVelocidaTranNota target:self selector:@selector(tocarpentagramaAux2) userInfo:nil repeats:NO];
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPlay:(id)sender {
    
    [NSTimer scheduledTimerWithTimeInterval:0.00 target:self selector:@selector(tocarpentagrama1) userInfo:nil repeats:NO];
    
     if([codeValue isEqualToString:@"P2"] || (estadoStaff)){
        [NSTimer scheduledTimerWithTimeInterval:0.00 target:self selector:@selector(tocarpentagrama2) userInfo:nil repeats:NO];
     }
    

    
}
@end
