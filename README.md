Rent App Example [![Build Status](https://travis-ci.org/isabellaSantos/rent_app_example.svg?branch=master)](https://travis-ci.org/isabellaSantos/rent_app_example)
==================

Projeto teste para aluguel de produtos mensalmente.


Atenção
-------

Este projeto está em fase de desenvolvimento e pode apresentar erros.


Funcionalidades
-------

O objetivo é que usuários possam criar pedidos onde incluem produtos e informam a quantidade de meses que eles ficarão locados, gerando assim os pagamentos correspondentes.
Os clientes terão acesso ao sistema para poder efetuar os pagamentos (através de cartão ou boleto).


Gems utilizadas
-------

* [Devise](https://github.com/plataformatec/devise)
* [CanCan](https://github.com/CanCanCommunity/cancancan)
* [State Machine](https://github.com/seuros/state_machine.git)
* [Cocoon](https://github.com/nathanvda/cocoon)
* Testes com [Rspec](https://github.com/rspec/rspec-rails) e [Capybara](https://github.com/jnicklas/capybara)


TODO
-------

* Finalizar customers/users;
* Enviar um email com a senha gerada para o cliente e modificar no primeiro acesso;
* Buscar o endereço através do CEP;
* Finalizar a criação dos pedidos;
* Finalizar as permissões de cada tipo de usuário;
* Métodos de pagamento (cartão através da Cielo e boleto);
* Finalizar os testes;
* Melhoria no layout;
* Máscaras para os campos(CPF, telefone);
* Selects utilizando select2.


Copyright (c) 2016 Isabella Santos, released under the New BSD License