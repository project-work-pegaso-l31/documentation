# FinEdge Ledger

> Gestionale didattico per clienti, conti correnti e movimenti bancari  
> Spring Boot + React / Vite – Università Telematica Pegaso, **PW-L31**

---

## Contenuto del repository

| Percorso                   | Scopo                                                                   |
| -------------------------- | ----------------------------------------------------------------------- |
| **backend/**               | API REST Spring Boot (porta 8080)                                       |
| **frontend/**              | Interfaccia React + Vite (porta 5173)                                   |
| **documentation/**         | UML, ER-diagram, BRD, PRD, OpenAPI `api-docs.yaml`                      
|

---

## API overview 🔍

| Endpoint                                | Descrizione                      |
| --------------------------------------- | -------------------------------- |
| `http://localhost:8080/swagger-ui.html` | Swagger UI interattivo           |
| `http://localhost:8080/v3/api-docs`     | OpenAPI JSON runtime             |
| `documentation/api-docs.yaml`           | Spec OpenAPI versionata nel repo |

---

# FinEdge Ledger – Avvio su Windows

## 1. Prerequisiti

Per eseguire correttamente il progetto **FinEdge Ledger**, assicurati che il tuo sistema disponga dei seguenti strumenti. Se il comando di verifica non restituisce un risultato, segui i passaggi indicati per l’installazione.

| Strumento   | Versione minima | Comando di verifica | Guida installazione                                                                   |
| ----------- | --------------- | ------------------- | ------------------------------------------------------------------------------------- |
| **Git**     | qualsiasi       | `git --version`     | [Download Git for Windows](https://git-scm.com/download/win)                          |
| **JDK**     | 17              | `java -version`     | [Download JDK 17 (Adoptium)](https://adoptium.net/en-GB/temurin/releases/?version=17) |
| **Node.js** | 18              | `node -v`           | [Download Node.js 18 LTS](https://nodejs.org/en/download/)                            |
| **npm**     | 9               | `npm -v`            | Incluso con Node.js                                                                   |

### ⚙️ Passaggi di installazione consigliati (Windows):

#### 1. Git

* Scarica da [https://git-scm.com/download/win](https://git-scm.com/download/win).
* Durante l’installazione, lascia le opzioni predefinite.
* Al termine, apri il Prompt dei comandi (Start → `cmd`) e digita:

  ```bash
  git --version
  ```

#### 2. JDK 17

* Scarica da [Oracle (JDK 17)](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html).
* Installa normalmente, **annotando il percorso** (solitamente: `C:\Program Files\Java\jdk-17`).
* Aggiungi la variabile d’ambiente:

  * Start → digita `Modifica variabili d’ambiente per l'account` → apri.
  * Clicca su **“Nuova”** in alto:

    * Nome: `JAVA_HOME`
    * Valore: `C:\Program Files\Java\jdk-17` (o il tuo percorso)
  * Poi, evidenzia Path e clicca **Modifica** 
  * Clicca su **Nuovo** e aggiungi:

    ```text
    %JAVA_HOME%\bin
    ```
* Verifica da terminale:

  ```bash
  java -version
  ```

#### 3. Node.js (con npm incluso)

* Scarica da [https://nodejs.org](https://nodejs.org/en/download)
* Verifica da terminale:

  ```bash
  node -v
  npm -v
  ```

### ✅ Controllo finale

Apri un Prompt dei comandi e verifica che tutti i tool rispondano correttamente:

```bash
git --version
java -version
node -v
npm -v
```

Se tutti i comandi restituiscono una versione, puoi proseguire con l’esecuzione del progetto.


---

## 2. Clona le repository

Apri il terminale in una cartella e lancia i seguenti comandi:

```powershell
#Frontend
git clone https://github.com/project-work-pegaso-l31/frontend.git
#Backend
git clone https://github.com/project-work-pegaso-l31/backend.git
#Documentation
git clone https://github.com/project-work-pegaso-l31/documentation.git
```

---

## 3. Scarica le dipendenze

Dopo aver clonato i tre repository (`backend`, `frontend`, `documentation`) nella stessa cartella radice, è necessario eseguire il download delle dipendenze.
Questa operazione prepara l’ambiente di sviluppo e garantisce che tutti i pacchetti e plugin necessari siano disponibili offline.

### 🔧 Backend (Spring Boot – Java)

Apri il **Prompt dei comandi** nella cartella `...\backend\FinedgeLedgerApi`:

Poi esegui il seguente comando:

```cmd
.\mvnw.cmd dependency:go-offline
```

Questo comando pre-carica in locale tutte le dipendenze Maven necessarie per l’esecuzione del backend. Se il comando restituisce un errore, assicurati di avere **Java 17** correttamente installato e accessibile nel PATH.

---

### 🧰 Frontend (React – Vite – Node)

Apri un **nuovo Prompt dei comandi** o terminale nella cartella `frontend`:
Poi installa tutte le dipendenze Node.js con:

```cmd
npm install
```

Questo comando scarica nella cartella `node_modules/` tutte le librerie necessarie per l’interfaccia utente. Verifica che non siano presenti errori relativi alla versione di Node (è richiesto Node **18 o superiore**) o a eventuali permessi del sistema.

## ⚠️ In caso di Errore "Esecuzione di Script Disabilitata" in PowerShell ⚠️ 

Se non ti è mai capitato di lanciare un comando come `npm install` o un altro script è probabile che riceverai l'errore:

> `Impossibile caricare il file... L'esecuzione di script è disabilitata nel sistema in uso.`

È una misura di sicurezza standard di Windows.

### ⚙️ La Spiegazione Semplice

Il tuo terminale PowerShell, per impostazione predefinita, ha un "lucchetto di sicurezza" che gli impedisce di eseguire qualsiasi file di script (file con estensione `.ps1`). Lo fa per proteggerti da codice potenzialmente dannoso che potresti aver scaricato da Internet.

Molti strumenti per sviluppatori, come `npm`, su Windows funzionano tramite questi piccoli script. Il lucchetto, quindi, li blocca. La soluzione è regolare questo lucchetto per permettere l'esecuzione degli script sicuri presenti sul tuo computer.

### ✅ La Soluzione Passo-Passo

Per risolvere, dobbiamo modificare la "Policy di Esecuzione" di PowerShell. Questa operazione va fatta **una sola volta** sul tuo computer e richiede i permessi di Amministratore.

**1. Apri PowerShell come Amministratore**

  * Clicca sul menu Start di Windows.
  * Scrivi `PowerShell`.
  * Clicca con il **tasto destro** sull'icona di "Windows PowerShell".
  * Scegli **"Esegui come amministratore"**.

 **Attenzione:** Questo passaggio è fondamentale. Il comando non funzionerà in un terminale normale.

**2. Esegui il Comando**

  * Nella finestra blu di PowerShell (Amministratore), copia e incolla questo comando, poi premi `Invio`:
    ```powershell
    Set-ExecutionPolicy RemoteSigned
    ```

**3. Conferma la Tua Scelta**

  * PowerShell ti chiederà se sei sicuro di voler modificare la policy.
  * Digita `S` (per "Sì") e premi `Invio`.

**4. Riavvia e Riprova**

  * Chiudi la finestra di PowerShell (Amministratore).
  * Apri un **nuovo terminale normale** e torna nella cartella del tuo progetto.
  * Lancia di nuovo il comando che prima dava errore (`npm install`).

---

## 4. Avvio dell’applicazione

Apri **due finestre** del Prompt dei comandi (una nella cartella `...\backend\FinedgeLedgerApi` e l'altra nella cartella `frontend`).

### 4.1 · Backend (Spring Boot) `...\backend\FinedgeLedgerApi`

```powershell
.\mvnw.cmd spring-boot:run
```

_Avvia l’API REST sulla porta **8080** – Swagger su [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)_

### 4.2 · Frontend (React + Vite) `...\frontend`

```powershell
npm run dev
```

_Avvia l’interfaccia su **5173** – [http://localhost:5173](http://localhost:5173)_

---

## 5. Uso rapido

1. Visita [http://localhost:5173](http://localhost:5173).
2. Troverai **5 clienti demo** con più conti e movimenti (date da gennaio 2025 in avanti).
3. Aggiungi clienti reali, apri conti, accredita/addebita e verifica il saldo in tempo reale.

---

## 6. Risoluzione problemi

| Problema                | Soluzione                                                         |
| ----------------------- | ----------------------------------------------------------------- |
| **Porta 8080 occupata** | Modifica `server.port` in `application.yml` e riavvia il backend. |
| **CORS error**          | Avvia prima il backend, poi il frontend.                          |
| **Errore npm**          | Aggiorna Node/npm (18+/9+) e riesegui `windows_setup.cmd`.        |
| **Errore Maven / Java** | Verifica che `java -version` mostri JDK 17 e ripeti il setup.     |

---

## 7. Arresto

Premi **Ctrl +C** nelle due finestre di esecuzione o chiudile con **✕** dal titolo.

---

_Buon lavoro con FinEdge Ledger!_ 🚀

