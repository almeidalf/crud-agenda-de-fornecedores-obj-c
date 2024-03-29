//
//  ListaDeFornecedoresVC.h
//  AgendaDeFornecedores
//
//  Created by Felipe Almeida on 17/08/19.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FornecedorDao.h"
#import "FormularioFornecedoresVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListaDeFornecedoresVC : UITableViewController<FormularioFornecedoresDelegate>

@property FornecedorDAO *dao;
@property Fornecedores *fornecedorSelecionado;
@property NSInteger linhaSelecionada;

@end

NS_ASSUME_NONNULL_END
