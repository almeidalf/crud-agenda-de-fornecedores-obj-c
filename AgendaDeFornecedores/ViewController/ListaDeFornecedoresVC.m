//
//  ListaDeFornecedoresVC.m
//  AgendaDeFornecedores
//
//  Created by Felipe Almeida on 17/08/19.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

#import "ListaDeFornecedoresVC.h"
#import "FormularioFornecedoresVC.h"
#import "Fornecedores.h"

@implementation ListaDeFornecedoresVC

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(ListaDeFornecedoresVC *) init {
    self = [super init];
    
    if(self){
    UIBarButtonItem *btnFormulario = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target: self action: @selector(mostrarFormulario)
                                    ];
    self.navigationItem.rightBarButtonItem = btnFormulario;
    self.navigationItem.title = @"Lista de Fornecedores";
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [FornecedorDAO fornecedorDAOInstance];
    }
    return self;
}

-(void) mostrarFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main" bundle:nil];
    
    FormularioFornecedoresVC *formularioFornecedor = [storyboard instantiateViewControllerWithIdentifier:@"Formulario-Fornecedor"];
    if(self.fornecedorSelecionado){
        formularioFornecedor.fornec = self.fornecedorSelecionado;
    }
    self.fornecedorSelecionado = nil;
    [self.navigationController pushViewController:formularioFornecedor animated:YES];
}

//MARK: Populando TableView com as informações....
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dao.fornecedores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identificador = @"Celula";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    if(!cell){
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }   
    
    Fornecedores *fornecedor = [self.dao indiceDoFornecedor: indexPath.row];
    cell.textLabel.text = fornecedor.nome_Fornecedor;
    
    return cell;
}

//MARK: Exclusão de fornecedores da tabela....
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        Fornecedores *fornecedor = [self.dao indiceDoFornecedor:indexPath.row];
        
        [self.dao removeFornecedor: fornecedor];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//MARK: Alteração de fornecedores na tabela....
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.fornecedorSelecionado = [self.dao indiceDoFornecedor:indexPath.row];
    [self mostrarFormulario];
    
}
@end
