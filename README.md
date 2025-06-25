# FinEdge Ledger

> Gestionale didattico per clienti, conti correnti e movimenti bancari  
> Spring Boot + React / Vite – Università Telematica Pegaso, **PW-L31**

---

## Contenuto del repository

| Percorso                   | Scopo                                                                   |
| -------------------------- | ----------------------------------------------------------------------- |
| **backend/**               | API REST Spring Boot (porta 8080)                                       |
| **frontend/**              | Interfaccia React + Vite (porta 5173)                                   |
| **documentation/**         | UML, ER-diagram, BRD, PRD, OpenAPI `api-docs.yaml`                      |
| **windows_setup.cmd**      | _Script_ che scarica **tutte** le dipendenze (Maven + npm) con un click |
| **GUIDA_AVVIO_WINDOWS.md** | Istruzioni passo-passo per avviare il progetto su Windows               |

---

## Demo veloce

1. **Clona** la repo

   ```bash
   git clone https://github.com/<TUO-UTENTE>/finedge-ledger.git
   cd finedge-ledger

   ```

2. **Esegui** lo script di setup (solo la prima volta)

   ```cmd
   windows_setup.cmd
   ```

3. Segui la **GUIDA_AVVIO_WINDOWS.md** per lanciare:

   - `mvnw spring-boot:run` → backend
   - `npm run dev` → frontend

   Il sistema parte con **5 clienti demo**, conti multipli e movimenti datati da gennaio 2025 per test immediato.

---

## API overview 🔍

| Endpoint                                | Descrizione                      |
| --------------------------------------- | -------------------------------- |
| `http://localhost:8080/swagger-ui.html` | Swagger UI interattivo           |
| `http://localhost:8080/v3/api-docs`     | OpenAPI JSON runtime             |
| `documentation/api-docs.yaml`           | Spec OpenAPI versionata nel repo |
