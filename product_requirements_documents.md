## Product Requirements Document (PRD)

**Prodotto:** **FinEdge Ledger**
**Release:** MVP v1 – giugno 2025
**Autore:** _Alfredo Cavalieri_

---

### 1. Visione d’insieme

Fornire a FinEdge S.p.A. un’applicazione web **leggera e modulare** per la gestione dei rapporti cliente-conto-movimenti.
L’MVP deve sostituire gli attuali fogli Excel con **API REST** documentate (Swagger) e una GUI React destinata agli operatori interni.

---

### 2. Obiettivi di prodotto

| #      | Obiettivo                                                         | KPI (successo)                         |
| ------ | ----------------------------------------------------------------- | -------------------------------------- |
| **O1** | Ridurre a < 3 min il ciclo _“nuovo cliente ➜ primo accredito”_.   | Tempo medio misurato durante demo      |
| **O2** | Offrire integrazione immediata a partner via OpenAPI 3.0.         | Disponibilità file `/v3/api-docs.yaml` |
| **O3** | Assicurare coerenza dati (CF, e-mail, IBAN, saldo ≥ 0).           | 0 errori critici in test QA            |
| **O4** | Rendere l’interfaccia auto-esplicativa per operatori non tecnici. | ≥ 90 % task completati senza training  |

---

### 3. Segmenti & Personas

| Persona                           | Background                                 | Bisogni principali                                                |
| --------------------------------- | ------------------------------------------ | ----------------------------------------------------------------- |
| **Paola – Operatore back-office** | 5 anni in amministrazione; usa Excel & PEC | Creare rapidamente clienti, evitare IBAN duplicati, vedere saldi. |
| **Luca – Finance manager**        | Analizza flussi di cassa                   | Snapshot saldi e movimenti senza accedere al DB legacy.           |
| **Dev Partner**                   | Fintech terza parte                        | Integrare con POST/GET per conto dei clienti.                     |

---

### 4. Requisiti di funzionalità principali

\| ID | Funzione |\
\|----|-----------|\
\| **F1** | **Gestione anagrafica**: create/read clienti con validazione sintattica e unicità di `email` e `fiscalCode`. |\
\| **F2** | **Conti correnti**: apertura multi-conto per cliente con IBAN IT auto-generato (univoco, formattato). |\
\| **F3** | **Movimenti**: accredito / addebito con campo descrizione; rifiuto addebiti fuori fido (saldo < 0). |\
\| **F4** | **Ricerca rapida**: lookup cliente via Codice Fiscale completo dalla barra “Ricerca CF”. |\
\| **F5** | **Seed dati**: al boot caricare 5 clienti demo (file `classpath:/data/seed.json`) con conti & movimenti storici (date Jan-Jun 2025). |\
\| **F6** | **Interfaccia operatore**: 3 pannelli reattivi<br>① Clienti (scroll)<br>② Anagrafica + Conti<br>③ Movimenti con saldo live. |\
\| **F7** | **Documentazione API**: Swagger UI e file YAML pubblicato. |\
\| **F8** | **Feedback UX**: alert testo rosso in caso di bad-input; testi delle tabelle sempre visibili (nero su bianco / bianco su grigio). |

---

### 5. User stories & criteri di accettazione

| Story      | Descrizione                                                          | Criteri (“Done When…”)                                                                                                                  |
| ---------- | -------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| **US-001** | _Come operatore_ voglio aggiungere un cliente con nome, e-mail e CF. | • Bottoni “+ Cliente” abilitati solo se tutti i campi sono pieni.<br>• Input errato mostra alert “e-mail non valida” / “CF non valido”. |
| **US-002** | …voglio creare un nuovo conto per un cliente selezionato.            | • Click “+ Conto” genera IBAN e saldo 0.<br>• Nuovo conto appare nella colonna conti senza refresh pagina.                              |
| **US-003** | …voglio registrare un addebito.                                      | • Se importo > saldo ricevo “Saldo insufficiente”.<br>• Se ok, tabella movimenti si aggiorna e saldo diminu­isce live.                  |
| **US-004** | …voglio cercare cliente per CF.                                      | • Se stringa < 16 car o regex fail → alert “Inserire CF completo o valido”.<br>• Se trovato, vengono mostrati anagrafica & conti.       |
| **US-005** | _Come manager_ voglio esportare la definizione API.                  | • `GET /v3/api-docs.yaml` restituisce YAML valido (lint OK).                                                                            |

---

### 6. Requisiti non funzionali chiave

| Codice        | Requisito                                                                      |
| ------------- | ------------------------------------------------------------------------------ |
| **NF-SEC-1**  | CORS limitato a `http://localhost:5173`.                                       |
| **NF-PERF-1** | Tempo risposta medio API (in-mem) < 150 ms.                                    |
| **NF-UX-1**   | UI responsive ≥ 1280 → 768 px; scrollbar auto quando elenco supera 300 px h.   |
| **NF-OPS-1**  | Build Maven eseguibile con `mvn clean package`; front-end con `npm run build`. |
| **NF-TEST-1** | Copertura > 80 % sui servizi Java (JUnit + Mockito).                           |

---

### 7. Design & workflow di alto livello

```sql
+---------+      POST /customers          +------------------+
| Front   | ───────────────────────────▶  | CustomerService   |
| React   |      GET /customers          +------------------+
| (Vite)  | ◀───────────────────────────  | In-memory Repo    |
+---------+                               +------------------+
     │                                           │
     │  POST /accounts            +-----------------------+
     └──────────────────────────▶ | AccountService/IBAN   |
         … ecc.                  +-----------------------+
```

Frontend: Tailwind CDN, componente `<Customers>` → click mostra `<CustomerDetails>` + `<Accounts>`; click IBAN apre `<Transactions>` con saldo in tempo reale (prop lift).

---

### 8. Dipendenze

- Java 17, Spring Boot 3.5, Lombok
- React 18, Vite, Tailwind (play-CDN)
- Nessun database fisico (H2/PG) nell’MVP → file seed JSON
- Build/test toolchain già configurata (Maven, JUnit 5, Vite)

---

### 9. Rischi & mitigazioni

| Rischio                 | Impatto                 | Prob. | Mitigazione                                               |
| ----------------------- | ----------------------- | ----- | --------------------------------------------------------- |
| Assenza DB persistenza  | Perdita dati al riavvio | M     | Specificato all’esame che il focus è la logica; DB fase 2 |
| Valori seed incoerenti  | Demo fallisce           | L     | Dataset con red-green tests che verificano saldi ≥ 0      |
| UI accessibilità colori | Uso interno             | L     | Contrasto controllato con Tailwind default palette        |

---

### 10. Scoping successivo (Nice-to-have)

1. Auth JWT + ruoli (admin, operatore).
2. Report PDF estratto conto.
3. Export CSV massivo clienti/movimenti.
4. Versione mobile‐friendly per consulenti in filiale.

---

### 11. Appendici

- **OpenAPI**: `backend/docs/openapi.yaml` (tracciato automatico SpringDoc).
- **Seed dati**: `src/main/resources/data/seed.json` – 5 clienti, 8 conti, 30 movimenti (Jan → Jun 2025).
- **Screenshot UX**: cartella `doc/screenshots/`.
