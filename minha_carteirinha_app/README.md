# Minha Carteirinha - Arquitetura do Projeto iOS

Este documento descreve a arquitetura e a estrutura do aplicativo "Minha Carteirinha" para iOS, desenvolvido em SwiftUI.

## Visão Geral
O aplicativo é um simulador de carteirinha estudantil offline, leve e com foco na exibição da carteirinha digital. Ele segue o padrão MVVM (Model-View-ViewModel) para uma melhor organização e testabilidade do código.

## Estrutura de Pastas

- **MinhaCarteirinhaApp/**
  - `MinhaCarteirinhaApp.swift`: Ponto de entrada principal do aplicativo.
  - `ContentView.swift`: View principal, responsável por orquestrar a navegação inicial (Splash, Login, Home).

- **Views/**
  - `SplashView.swift`: Tela de splash com logo e nome da faculdade.
  - `LoginView.swift`: Tela de login "fake".
  - `HomeView.swift`: Tela principal com cards de navegação.
  - `MyIDCardView.swift`: Tela da carteirinha digital (principal).
  - `MyDisciplinesView.swift`: Tela de listagem de disciplinas.
  - `NoticesView.swift`: Tela de avisos.
  - `CalendarView.swift`: Tela de calendário.
  - `SupportView.swift`: Tela de suporte.
  - `QRCodeFullScreenView.swift`: Tela para exibir o QR Code em tela cheia.

- **ViewModels/**
  - `AuthViewModel.swift`: Lógica para o login "fake" e persistência de sessão.
  - `IDCardViewModel.swift`: Lógica para gerenciar os dados da carteirinha, geração de QR Code e salvamento de imagem.
  - `HomeViewModel.swift`: Lógica para a tela Home (se necessário para estados de UI).

- **Models/**
  - `User.swift`: Modelo de dados para o usuário (nome, RA, curso, validade, foto).
  - `Notice.swift`: Modelo de dados para avisos.
  - `Discipline.swift`: Modelo de dados para disciplinas.
  - `CalendarEvent.swift`: Modelo de dados para eventos do calendário.

- **Utilities/**
  - `Constants.swift`: Definições de cores, fontes e outros valores constantes.
  - `LocalDataStore.swift`: Gerenciamento de dados locais (UserDefaults/JSON).
  - `QRCodeGenerator.swift`: Utilitário para geração de QR Code.
  - `ImageSaver.swift`: Utilitário para salvar imagens na galeria.

- **Assets.xcassets/**: Contém ícones, logo da faculdade, imagens de exemplo, etc.

## Cores e Tipografia

- **Cores**: Primária (`#0F2A5F`), Destaques (`#1E48A8`), Fundo Claro (`#F5F7FB`).
- **Tipografia**: Legível, com suporte a Dynamic Type.

## Funcionalidades Chave

- **Login Fake**: Validação mínima e persistência local.
- **MINHA CARTEIRINHA**: Exibição de dados do aluno, foto, QR Code, opção de tela cheia e salvamento de imagem.
- **Dados Locais**: Armazenamento em JSON/UserDefaults.
- **Dark Mode**: Suporte total.
- **Acessibilidade**: Dynamic Type e VoiceOver.

## Próximos Passos

1.  Criação dos assets visuais (logo, ícone).
2.  Implementação das Views e ViewModels.
3.  Configuração do armazenamento local.
4.  Desenvolvimento dos utilitários (QR Code, salvamento de imagem).
5.  Testes e polimento geral.
