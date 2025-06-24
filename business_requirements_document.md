## Business Requirements Document

**Progetto:** **FinEdge Ledger** – piattaforma API-based per gestione clienti, conti correnti e movimenti
**Versione:** 1.0 – 24 giugno 2025
**Autore:** _Alfredo Cavalieri_

---

### 1. Contesto e obiettivi

| Voce                   | Descrizione                                                                                                                                                                                                                                                                                                                           |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Impresa**            | FinEdge S.p.A., fintech che offre servizi di pagamento e micro-investimento a retail e PMI.                                                                                                                                                                                                                                           |
| **Problema**           | Processi legacy distribuiti su fogli di calcolo e applicazioni desktop scollegate → lentezza operativa, assenza di API, scarsa tracciabilità.                                                                                                                                                                                         |
| **Obiettivo primario** | Consegnare una web-app full-stack che consenta agli operatori di:<br>• gestire **anagrafiche clienti**<br>• aprire **conti correnti** con IBAN generato automaticamente<br>• registrare **accrediti / addebiti** in tempo reale con controllo di saldo<br>• interrogare lo storico movimenti <br>• ricerca clienti per Codice Fiscale |
| **Valore**             | <br>• Riduzione errori manuali (validazione CF, e-mail, IBAN)<br>• Time-to-market per integrazioni esterne grazie a REST+Swagger<br>• Visibilità istantanea su saldi e flussi di cassa<br>• Base modulare per future funzioni (prestiti, analytics)                                                                                   |

---

### 2. Stakeholder

| Ruolo                       | Interesse                                    |
| --------------------------- | -------------------------------------------- |
| **Direzione Finanziaria**   | Monitorare saldi in tempo reale              |
| **Back-office / Operatori** | Creare clienti/conti, registrare movimenti   |
| **Team IT**                 | Manutenere API, integrare con sistemi terzi  |
| **Compliance**              | Tracciabilità, validazione dati, audit trail |
| **Cliente finale**          | (fase 2) Accesso a estratto conto via mobile |

---

### 3. Ambito

| Incluso (In-Scope)                                                                                                                                                                                                                                                                                                   | Escluso (Out-of-Scope)                                                                                                                                                         |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| • CRUD clienti (nome, e-mail, CF)<br>• Apertura conti con IBAN IT conforme, saldo iniziale 0<br>• Accrediti/addebiti con storicizzazione e controllo «saldo insufficiente»<br>• Front-end React (Vite) per operatori interni<br>• API REST con documentazione OpenAPI 3.0<br>• Seeder di dati demo da file YAML/JSON | • Autenticazione/ruoli (prevista fase 2)<br>• Integrazione PSD2 / bonifici reali<br>• Persistenza su DB relazionale (attuale in-memory)<br>• Reportistica PDF / Excel avanzata |

---

### 4. Requisiti funzionali (FR)

| ID       | Requisito                                                                                                                                                                    | Priorità |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| **FR-1** | Il sistema deve consentire la creazione di un cliente con `fullName`, `email`, `fiscalCode`; se i campi sono invalidi la API restituisce HTTP 400 con messaggio dettagliato. | Must     |
| **FR-2** | Deve essere possibile aprire uno o più conti per cliente; l’IBAN viene generato e garantito univoco.                                                                         | Must     |
| **FR-3** | L’operatore può registrare un **accredito** (importo > 0) o un **addebito** (importo > 0) — con descrizione opzionale — tramite API/GUI.                                     | Must     |
| **FR-4** | Se l’addebito eccede il saldo disponibile il sistema rifiuta l’operazione con errore «Saldo insufficiente».                                                                  | Must     |
| **FR-5** | È possibile ricercare un cliente per Codice Fiscale; se l’input è parziale o non conforme (regex CF) viene mostrato alert in front-end.                                      | Should   |
| **FR-6** | GUI mostra anagrafica cliente, lista conti e, selezionando un conto, tabella movimenti con importi colorati (+ verde / – rosso).                                             | Must     |
| **FR-7** | Liste clienti, conti e movimenti devono avere scrollbar se superano la viewport.                                                                                             | Should   |
| **FR-8** | Documentazione Swagger deve essere accessibile via `/swagger-ui.html` e scaricabile `/v3/api-docs.yaml`.                                                                     | Must     |

---

### 5. Requisiti non funzionali (NFR)

| NFR       | Descrizione                                                                                                |
| --------- | ---------------------------------------------------------------------------------------------------------- |
| **NFR-1** | **Usabilità**: interfaccia single-page, feedback immediato; colori accessibili (WCAG AA).                  |
| **NFR-2** | **Performance**: risposte API < 200 ms in ambiente demo (20 k clienti, 100 k movimenti).                   |
| **NFR-3** | **Scalabilità**: architettura stateless; backend Spring Boot 3, front-end React; easy deploy su container. |
| **NFR-4** | **Manutenibilità**: codice Java 17 con Lombok; test JUnit (≥80 % su services core); front-end modulare.    |
| **NFR-5** | **Sicurezza**: CORS limitato al dominio front-end; convalida server-side di input; pronto per future JWT.  |

---

### 6. Assunzioni e vincoli

| Tipo           | Dettaglio                                                                                                |
| -------------- | -------------------------------------------------------------------------------------------------------- |
| **Assunzione** | Operatori interni lavorano da rete aziendale → no login nella MVP.                                       |
| **Assunzione** | I dati demo sono caricati da `classpath:/data/seed.json` ed esistono solo in RAM (reset a ogni riavvio). |
| **Vincolo**    | Linguaggi richiesti dal corso: Java (backend), HTML/CSS/JS (React) per front-end.                        |
| **Vincolo**    | Tool gratuiti / open-source.                                                                             |

---

### 7. Metriche di successo

| Metrica | Target                                                                                              |
| ------- | --------------------------------------------------------------------------------------------------- |
| T1      | Tempo medio di apertura conto ≤ 3 s (UI + API).                                                     |
| T2      | 0 bug critici dopo demo interna.                                                                    |
| T3      | ≥95 % degli operatori afferma che il nuovo flusso è “più rapido” rispetto al foglio Excel (survey). |
| T4      | Copertura test servizi core ≥ 80 %.                                                                 |

---

### 8. Roadmap sintetica

| Fase         | Deliverable                                                | Data        |
| ------------ | ---------------------------------------------------------- | ----------- |
| **Sprint 1** | Set-up repo, skeleton Spring/React, CI GitHub Actions      | 02 mag 2025 |
| **Sprint 2** | CRUD Clienti + validazioni, Swagger                        | 15 mag 2025 |
| **Sprint 3** | Conti con IBAN generato, saldo & movimenti, error handling | 29 mag 2025 |
| **Sprint 4** | UI completa (Tailwind CDN), seed dati, test JUnit          | 12 giu 2025 |
| **Sprint 5** | Rifinitura UX, documentazione, demo + screenshot           | 24 giu 2025 |
