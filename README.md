## # RMAnimation

**O # RMAnimation**, é um aplicativo para exibição da lista de personagens do Rick and Morty.

### Requer:
- iOS 13+
- Xcode 11.7+
- Swift 5+

### Frameworks utilizados:
- Para o projeto foi adicionado apenas um framework de criação própria, o múdolo **NetworkMD** visando apresentar como seria, no meu entendimento, uma arquitetura modular.
- Link do repositório do módulo NetworkMD: [Bitbucket - NetworkMD](https://bitbucket.org/gilsonsantosti/networkmd/src/master/)

### Branch para validação:

- O projeto foi todo desenvolvido utilizando o GitFlow e para validação poderá ser usada a branch main com a versão 1.0.0

### Instalação:

- Para facilitar os testes as dependências relacionadas ao módulo NetworkMD foram comitadas evitando assim a necessidade de instalação do gerenciador utilizado, que nesse caso foi o Cocoapods. Entando que no cenário ideal essas dependências não deveriam ser comitadas.

---

### Funcionalidades e implementações
- Tela inicial com a lista de personagens;
- Tela de detalhes com alguns dados específicos do personagem escolhido;
- Tela de Favoritos com os personagens adicionados aos favoritos;
- Testes unitários;
- Testes de intefaces.

### Sobre o projeto

**O RMAnimation** foi desenvolvido seguindo a arquitetura VIPC (View, Interactor, Presenter e Coordinator), também chamada de Clean Architeture. Essa arquitetura foi escolhida por atender aos princípios do SOLID e devido suas camadas de abstração os testes são mais facilitados.
Neste projeto não foi utilizado o Interface Builder para criação de layouts, ficando toda sua implementação em view code.

### Melhorias:

Devido ao curto tempo nem sempre conseguimos implementar tudo da forma que gostaríamos se tivéssemos um tempo maior. Por esse motivo listo a seguir os itens a serem melhorados ou aperfeiçoados:

- Melhorias no layout considerando um melhor conceito de UX e UI;
- Aumento na cobertura dos testes, tanto unitários quanto de interfaces;
- Criação de mais funções com o intuíto de abstrair mais todo o código responsável pela configuração das constraints, reduzindo a quantidade de código e melhorando seu reaproveitamento;
- Melhorias no layout para uma melhor experiência no darkmode;
- Modularização de mais componentes para que sejam reaproveitáveis.
- Adição ou implementação de sobrescrita das requisições utilizadas neste projeto visando uma maior autonomia nos teste, principalmente de interfaces;

### Créditos:

GPSFoot foi desenvolvido por Gilson Santos (gilsonsantosti@gmail.com)
