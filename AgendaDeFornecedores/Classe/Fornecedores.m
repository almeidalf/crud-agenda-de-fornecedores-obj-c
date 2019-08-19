//
//  Fornecedores.m
//  AgendaDeFornecedores
//
//  Created by Felipe Almeida on 17/08/19.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

#import "Fornecedores.h"

@implementation Fornecedores

-(NSString *) description {
    NSString *dados = [NSString stringWithFormat:@"Fornecedor %@ Endereço: %@ E-mail: %@ Telefone: %@, Site: %@", self.nome_Fornecedor, self.endereco_Fornecedor, self.email_Fornecedor, self.telefone_Fornecedor, self.site_Fornecedor];
    return dados;
}

@end
