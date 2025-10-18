_**Atenção:** Este é um guia gerado por IA e pode conter imprecisões. Sempre consulte a documentação oficial da Apple para obter as informações mais recentes._

# Guia de Compilação e Instalação – App "Minha Carteirinha"

Este guia detalha os passos para compilar e instalar o aplicativo "Minha Carteirinha" em um iPhone. Escolha o método que melhor se adapta às suas necessidades e ferramentas disponíveis.

## Pré-requisitos

- **macOS:** Um Mac com a versão mais recente do macOS.
- **Xcode:** A versão 15 ou superior do Xcode, disponível na Mac App Store.
- **Apple ID:** Uma conta Apple (gratuita) para assinar o aplicativo.
- **Cabo USB:** Para conectar o iPhone ao Mac.

---

## Método 1: Instalação via Xcode (Free Provisioning)

Este é o método mais direto para desenvolvedores e entusiastas que desejam instalar o aplicativo em seu próprio dispositivo para testes.

### Passo 1: Abrir o Projeto no Xcode

1.  Descompacte o arquivo `.zip` do projeto em uma pasta no seu Mac.
2.  Navegue até a pasta `minha_carteirinha_app`.
3.  Dê um duplo clique no arquivo `MinhaCarteirinhaApp.xcodeproj` para abri-lo no Xcode.

### Passo 2: Configurar a Assinatura (Signing)

1.  No navegador de projetos do Xcode (painel esquerdo), clique no item principal do projeto, que é o `MinhaCarteirinhaApp` com o ícone do aplicativo.
2.  Selecione o alvo (target) `MinhaCarteirinhaApp` na barra lateral central.
3.  Vá para a aba **"Signing & Capabilities"**.
4.  No campo **"Team"**, clique no menu suspenso e selecione **"Add an Account..."**.
5.  Faça login com seu Apple ID. Após o login, seu nome deve aparecer no menu "Team". Selecione-o.
6.  O Xcode tentará criar um "Provisioning Profile" automaticamente. Se houver um erro sobre o "Bundle Identifier", você precisará alterá-lo.

### Passo 3: Alterar o Bundle Identifier

O "Bundle Identifier" é um identificador único para cada aplicativo. Como o que está no projeto é um exemplo, você precisa criar um que seja único para você.

1.  Ainda na aba **"Signing & Capabilities"**, localize o campo **"Bundle Identifier"**.
2.  Altere o valor de `com.seunome.minhacarteirinha` para algo único. Por exemplo, `com.seu-nome-aqui.minhacarteirinhaapp`.
3.  Após a alteração, o Xcode deve conseguir criar o perfil de provisionamento com sucesso.

### Passo 4: Compilar e Instalar no iPhone

1.  Conecte seu iPhone ao Mac com o cabo USB.
2.  Na parte superior da janela do Xcode, ao lado do botão de "Play" (▶️), clique no seletor de dispositivo (que pode estar mostrando um simulador como "iPhone 15 Pro").
3.  Selecione seu iPhone na lista de dispositivos.
4.  Pressione o botão **"Play" (▶️)** ou use o atalho **Cmd + R**.
5.  Na primeira vez que você instalar um app com sua conta gratuita, o iPhone exibirá um aviso de "Desenvolvedor Não Confiável". Para resolver isso:
    -   No iPhone, vá para **Ajustes > Geral > Gestão de VPN e Dispositivo**.
    -   Toque no seu e-mail de Apple ID na seção "App de Desenvolvedor".
    -   Toque em **"Confiar em [seu e-mail]"** e confirme.
6.  Volte ao Xcode e execute o projeto novamente. O aplicativo será instalado e aberto no seu iPhone.

---

## Método 2: Instalação via Sideload (.ipa com AltStore/Sideloadly)

Este método permite instalar o aplicativo sem o Xcode, usando um arquivo `.ipa`. É útil para compartilhar o app com outros usuários que não têm o ambiente de desenvolvimento.

### Passo 1: Gerar o Arquivo .ipa

1.  Siga os Passos 1, 2 e 3 do **Método 1** para configurar o projeto no Xcode.
2.  Com o projeto aberto e configurado, vá para a barra de menu do Xcode e selecione **Product > Archive**.
3.  O Xcode irá compilar o projeto. Ao final, a janela "Archives" será aberta, mostrando a nova versão arquivada.
4.  Selecione o arquivo recém-criado e clique no botão **"Distribute App"** no painel direito.
5.  Escolha a opção **"Ad Hoc"** e clique em "Next".
6.  Nas opções de "Ad Hoc", mantenha as configurações padrão e clique em "Next".
7.  O Xcode pedirá para assinar o aplicativo. Ele usará o perfil de provisionamento que você configurou. Clique em "Next".
8.  Finalmente, o Xcode mostrará um resumo. Clique em **"Export"** e escolha um local para salvar a pasta com o arquivo `.ipa`.

### Passo 2: Instalar com AltStore ou Sideloadly

Agora que você tem o arquivo `.ipa`, pode instalá-lo usando uma das seguintes ferramentas:

-   **AltStore:** Requer a instalação do AltServer no seu Mac. Com o AltServer rodando e seu iPhone conectado, você pode usar o AltStore no seu celular para abrir e instalar o arquivo `.ipa`.
-   **Sideloadly:** Uma ferramenta para macOS e Windows que simplifica o processo. Abra o Sideloadly, conecte seu iPhone, arraste o arquivo `.ipa` para a janela do Sideloadly, digite seu Apple ID e clique em "Start".

Ambas as ferramentas usarão sua conta Apple gratuita para assinar e instalar o aplicativo. Lembre-se que aplicativos instalados dessa forma precisam ser "reassinados" a cada 7 dias.

---

## (Opcional) Método 3: Instalação via TestFlight

Este método é para quem possui uma conta **Apple Developer Program** (paga) e deseja distribuir o aplicativo para testadores de forma mais robusta.

1.  **Arquivar o App:** Siga o Passo 1 do **Método 2** para arquivar o aplicativo.
2.  **Distribuir para App Store Connect:**
    -   Na janela "Archives", em vez de "Distribute App", clique em **"Upload to App Store Connect..."**.
    -   Siga as instruções para fazer o upload do build para a sua conta.
3.  **Convidar Testadores no App Store Connect:**
    -   Acesse o [App Store Connect](https://appstoreconnect.apple.com/).
    -   Vá para a seção "Meus Apps" e selecione o "Minha Carteirinha".
    -   Na aba "TestFlight", você pode adicionar o build que acabou de enviar e convidar testadores internos (da sua equipe) ou externos (qualquer pessoa, via e-mail ou link público).
4.  **Instalar via TestFlight:**
    -   Os testadores receberão um convite por e-mail.
    -   Eles precisarão baixar o aplicativo **TestFlight** da App Store.
    -   Ao abrir o convite, o app "Minha Carteirinha" aparecerá no TestFlight, pronto para ser instalado.

Este método é o mais profissional, permitindo gerenciar builds, coletar feedback e distribuir para até 10.000 testadores externos.
