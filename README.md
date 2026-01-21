# 📦 ViaCEP App — SwiftUI + TCA

Aplicativo iOS desenvolvido em **SwiftUI** utilizando **The Composable Architecture (TCA)** para gerenciamento de estado e **Swift Concurrency** para chamadas assíncronas.  
O app consome a **API ViaCEP** para buscar informações de endereço a partir de um CEP brasileiro.

## 🛠 Tecnologias

- SwiftUI  
- The Composable Architecture (TCA)  
- Swift Concurrency (async/await)  
- Dependency Injection (TCA Dependencies)  
- API ViaCEP  

## 🧱 Arquitetura

Arquitetura unidirecional baseada em **TCA**, com separação clara de **State**, **Action**, **Reducer** e **Dependencies**, facilitando testes e manutenção do código.

## ✨ Funcionalidades

- Consulta de CEP  
- Exibição de endereço (logradouro, bairro, cidade e UF)  
- Estados de loading e erro  

