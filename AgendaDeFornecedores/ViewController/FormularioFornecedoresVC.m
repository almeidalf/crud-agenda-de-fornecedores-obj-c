//
//  FormularioFornecedoresVC.m
//  AgendaDeFornecedores
//
//  Created by Felipe Almeida on 17/08/19.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

#import "FormularioFornecedoresVC.h"
#import "Fornecedores.h"

@implementation FormularioFornecedoresVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *btnAdicionarAlterar = nil;
    if(self.fornec){
        btnAdicionarAlterar = [[UIBarButtonItem alloc]
                               initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target: self action:@selector(altera)];
        self.navigationItem.title = @"Editar Fornecedor";
    }else{
        btnAdicionarAlterar = [[UIBarButtonItem alloc]
                               initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target: self action:@selector(adiciona)];
        self.navigationItem.title = @"Novo Fornecedor";
    }
    self.navigationItem.rightBarButtonItem = btnAdicionarAlterar;
    
    if(self.fornec){
        self.fornecedor.text = self.fornec.nome_Fornecedor;
        self.endereco.text = self.fornec.endereco_Fornecedor;
        self.email.text = self.fornec.email_Fornecedor;
        self.telefone.text = self.fornec.telefone_Fornecedor;
        self.site.text = self.fornec.site_Fornecedor;
    }
}

-(FormularioFornecedoresVC *) initWithCoder: (NSCoder *) aDecoder {
    self = [super initWithCoder: aDecoder];
    if(self){

        self.dao = [FornecedorDAO fornecedorDAOInstance];
    }
    return self;
}

//MARK: - Botão para adicionar informações do fornecedor
-(void) adiciona {
    self.fornec = [Fornecedores new];
    [self pegaDadosFormulario];
    
    [ self.dao adicionaFornecedor:self.fornec ];
    NSLog(@"%@", self.dao.fornecedores);
    
    [self.navigationController popViewControllerAnimated:YES];
}

//MARK: Alterar fornecedor das infos....
-(void) altera{
    [self pegaDadosFormulario];
    [self.navigationController popViewControllerAnimated:YES];
}

//MARK: Pegar dados do formulário...
-(void) pegaDadosFormulario{
    self.fornec.nome_Fornecedor = self.fornecedor.text;
    self.fornec.endereco_Fornecedor = self.endereco.text;
    self.fornec.email_Fornecedor = self.email.text;
    self.fornec.telefone_Fornecedor = self.telefone.text;
    self.fornec.site_Fornecedor = self.site.text;
}

@end
