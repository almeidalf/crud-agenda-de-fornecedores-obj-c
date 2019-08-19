//
//  Fornecedores.h
//  AgendaDeFornecedores
//
//  Created by Felipe Almeida on 17/08/19.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fornecedores : NSObject

@property NSString *nome_Fornecedor;
@property NSString *endereco_Fornecedor;
@property NSString *email_Fornecedor;
@property NSString *telefone_Fornecedor;
@property NSString *site_Fornecedor;

@property NSMutableArray *fornec;

@end

NS_ASSUME_NONNULL_END
