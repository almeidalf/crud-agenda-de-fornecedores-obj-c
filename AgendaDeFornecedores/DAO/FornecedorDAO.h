//
//  FornecedorDAO.h
//  AgendaDeFornecedores
//
//  Created by Felipe Almeida on 18/08/19.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fornecedores.h"

NS_ASSUME_NONNULL_BEGIN

@interface FornecedorDAO : NSObject

@property NSMutableArray *fornecedores;

//MARK: Métodos
-(void) adicionaFornecedor: (Fornecedores *) fornecedor;
-(NSInteger) total;
-(Fornecedores *) indiceDoFornecedor: (NSInteger) indice;
+(FornecedorDAO *) fornecedorDAOInstance;
-(void) removeFornecedor: (Fornecedores *) fornecedor;

@end

NS_ASSUME_NONNULL_END
