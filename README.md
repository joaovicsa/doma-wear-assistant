# ⌚ Doma Wear Assistant

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Wear OS](https://img.shields.io/badge/Wear%20OS-4285F4?style=for-the-badge&logo=android&logoColor=white)](https://android.com/wear)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

O **Doma Wear Assistant** é uma solução de acessibilidade desenvolvida para a empresa **Doma**. O aplicativo foca no uso de tecnologias Wear OS para promover a inclusão de funcionários com necessidades especiais, utilizando áudio em tempo real para comunicação e segurança.

## 🎯 Objetivos do Projeto

O projeto visa solidificar a interação entre colaboradores através de:
* **Assistência Auditiva**: Leitura de mensagens, notificações e lembretes para deficientes visuais.
* **Treinamento e Educação**: Fornecimento de dicas e feedbacks sonoros durante o aprendizado de novas habilidades.
* **Segurança no Trabalho**: Alertas críticos sobre emergências, tempestades e informações cruciais.

## 🚀 Funcionalidades Técnicas Implementadas

### 1. Detecção Dinâmica de Saída de Áudio
O sistema identifica automaticamente se o áudio deve ser reproduzido pelo **alto-falante integrado** (`TYPE_BUILTIN_SPEAKER`) ou por **fones Bluetooth** (`TYPE_BLUETOOTH_A2DP`).

### 2. Gestão de Conectividade
Caso o aplicativo exija um fone de ouvido para privacidade ou clareza, ele oferece uma interface direta para as configurações de Bluetooth do Wear OS usando a intent `ACTION_BLUETOOTH_SETTINGS`.

### 3. Interface Otimizada para Smartwatches
* Design em modo escuro para economia de bateria.
* Elementos centralizados para telas circulares.
* Botões de toque ampliado para facilitar a interação.

## 🛠️ Materiais e Requisitos

* **Editor**: VS Code.
* **SDK**: Flutter SDK.
* **Nativo**: Android Studio / Kotlin.
* **Simulador**: Wear OS Small Round (API 23 ou superior).

## 📂 Estrutura de Arquivos Principal

```text
├── android/app/src/main/kotlin/   # Implementação do AudioHelper e Callbacks
├── assets/sounds/                 # Arquivos de áudio (.mp3)
├── lib/main.dart                  # Interface e lógica em Flutter
└── pubspec.yaml                   # Dependências (audioplayers, flutter_tts)


```

## ⚙️ Como Instalar e Rodar

1. Clonar o repositório

Bash

```git clone [https://github.com/seu-usuario/doma-wear-assistant.git](https://github.com/seu-usuario/doma-wear-assistant.git)```

2. Instalar dependências

Bash

```flutter pub get```

Configurar Assets Certifique-se de que seus arquivos de áudio estão registrados no pubspec.yaml:

YAML

flutter:
  assets:
    - assets/sounds/

    
Executar o App Selecione seu emulador Wear OS no VS Code e pressione F5.
