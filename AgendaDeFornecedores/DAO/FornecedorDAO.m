//
//  FornecedorDAO.m
//  AgendaDeFornecedores
//
//  Created by Felipe Almeida on 18/08/19.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

#import "FornecedorDAO.h"

@implementation FornecedorDAO

static FornecedorDAO *defaultDao = nil;

-(id) init {
    self = [super init];
    if(self){
        self.fornecedores = [NSMutableArray new];
    }
    return self;
}

-(void) adicionaFornecedor:(Fornecedores *)fornecedor{
    [self.fornecedores addObject:fornecedor];
}

- (NSInteger)total{
    return self.fornecedores.count;
}

-(Fornecedores *) indiceDoFornecedor:(NSInteger) indice{
    return self.fornecedores[indice];
}

+(FornecedorDAO *) fornecedorDAOInstance {
    if(!defaultDao){
        defaultDao = [FornecedorDAO new];
    }
    return defaultDao;
}

- (void)removeFornecedor:(Fornecedores *)fornecedor {
    [self.fornecedores removeObject:fornecedor];
}

-(NSInteger)indiceSelecionadoDoFornecedor:(Fornecedores *)fornecedor{
    return [self.fornecedores indexOfObject:fornecedor];
}
@end
