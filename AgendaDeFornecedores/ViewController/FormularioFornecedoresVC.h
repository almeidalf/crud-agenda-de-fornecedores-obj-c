//
//  FormularioFornecedoresVC.h
//  AgendaDeFornecedores
//
//  Created by Felipe Almeida on 17/08/19.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FornecedorDao.h"

@protocol FormularioFornecedoresDelegate <NSObject>

@required
-(void) fornecedorAdicionado: (Fornecedores *) fornecedor;
-(void) fornecedorAtualizado: (Fornecedores *) fornecedor;

@end

@interface FormularioFornecedoresVC : UIViewController

@property IBOutlet UITextField *fornecedor;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *site;

@property FornecedorDAO *dao;
@property Fornecedores *fornec;

@property id<FormularioFornecedoresDelegate> delegate;

@end
