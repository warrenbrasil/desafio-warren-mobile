# Desafio Mobile da Warren Brasil

Chegou a hora de você conhecer um pouquinho sobre os desafios enfrentamos e as tecnologias que utilizamos aqui na Warren! A ideia desse desafio é desenvolver um aplicativo simples que consiste em uma tela de login, uma tela com os objetivos de um usuário e uma tela com os detalhes do objetivo.
Você terá o prazo de 1 semana para a entrega, que deve ser realizada por etapas, pois parte importante do projeto é a colaboração e resposta aos comentários/sugestões.

## Entrega
Usar esse repositório como um template para a criação de um repositório *privado* no GitHub e adicionar `@robuske` e `@bocato` (para iOS) ou `@pablobaldez` (para Android) como colaborador. 
`https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template`

Após a criação, resolver as tarefas e criar PRs para cada uma descrevendo o que foi feito para review.

### Feature de Login
* Buscar token de acesso na rota de login:
* Exigir login apenas uma vez.     
  ```
  Infos:
  
  POST https://enigmatic-bayou-48219.herokuapp.com/api/v2/account/login
  BODY -> RAW -> JSON: 
  Content-Type: application/json
  
  {
      "email": "mobile_test@warrenbrasil.com",
      "password": "Warren123!"
  }
  ```

### Feature de Lista de Objetivos
* Exibir uma lista ou collection com os objetivos do usuário: 
  ```
  Infos:

  GET https://enigmatic-bayou-48219.herokuapp.com/api/v2/portfolios/mine
  HEADER: access-token: "token obtido no login"
  Content-Type: application/json
  ```

### Feature Detalhes de Objetivo:
* Exibir as informações do objetivo selecionado

## Tecnologias
Recomendamos algumas tecnologias que usamos aqui na Warren (assim você ja vai estar por dentro do nosso estilo!). Se você optar por alguma diferente das recomendadas justifique no PR o motivo.

### iOS
* Swift
* SwiftUI e Combine
* SPM Modules
* Moya/Alamofire
* View Code (Sem storyboard / XIB)
* Paw/Postman/Charles para testar API
* Coordinators
* Swift Composable Architecture (https://github.com/pointfreeco/swift-composable-architecture) ou MVVM.

### Android
* Kotlin
* Retrofit
* Architecture Components
* Coroutines
* Injeção de dependências

## O que será avaliado:

### Principal
* Atenção com UI/UX (Isso é muuuito importante pra gente! Nossos apps são recomendados como inspiração);
* Colaboração através do GitHub. Abrindo Pull Requests para features isoladas no aplicativo, respondendo e resolvendo comentários e sugestões.
* Seguir guidelines e padrões do sistema iOS/Android/Web;
* Estrutura e solução dos problemas;
* Lógica, modularização, organização, clareza de código, escalabilidade e documentação;
* Testes unitários de parte do projeto.

### Interessante: (não fundamental)
* Layout customizado avançado. (Inspiração no nosso app é bem-vinda);
* Arquitetura da solução;
* Transições e animações customizadas;

## Links úteis:

Warren no Android:
https://play.google.com/store/apps/details?id=com.oiwarren.oiwarren

Warren no iOS:
https://itunes.apple.com/br/app/id1114394063

Warren na Web:
https://warrenbrasil.com.br
