## 2 · `GUIDA_AVVIO_WINDOWS.md`

> Documento di testo/Markdown con la procedura passo-passo al primo avvio.

# FinEdge Ledger – Avvio rapido su Windows

## 1. Prerequisiti

| Strumento   | Versione minima | Comando di verifica |
| ----------- | --------------- | ------------------- |
| **Git**     | qualsiasi       | `git --version`     |
| **JDK**     | 17              | `java -version`     |
| **Node.js** | 18              | `node -v`           |
| **npm**     | 9               | `npm -v`            |

Assicurati che i comandi sopra rispondano nel **Prompt dei comandi**.

---

## 2. Clona le repository

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

Esegui **una sola volta** dopo il clone (o quando cambiano librerie):

```powershell
windows_setup.cmd
```

Lo script:

1. Pre-carica in cache tutte le **dipendenze Maven** del backend.
2. Esegue `npm install` nel frontend.
3. Mostra un riepilogo di successo o spiega l’errore.

---

## 4. Avvio dell’applicazione

Apri **due finestre** del Prompt dei comandi (o due tab in Windows Terminal).

### 4.1 · Backend (Spring Boot)

```powershell
cd backend\FinedgeLedgerApi
mvnw spring-boot:run
```

_Avvia l’API REST sulla porta **8080** – Swagger su [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)_

### 4.2 · Frontend (React + Vite)

```powershell
cd frontend
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
