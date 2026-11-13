# Projektstart – EduKSX-Suite

Stand: 2026-11-14 · Status: **BESTÄTIGT** 14.11.2026 (Chat) – offene Punkte (ZU PRÜFEN) werden in den Issues des ersten Meilensteins geklärt

Steckbrief aus der Start-Checkliste (`start.py --ziel …` im GitHub-Blueprint). Er ist die Grundlage für das Grundgerüst
und für die Konfiguration in `.github/blueprint.toml`. Änderungen hier festhalten und `start.py` erneut ausführen.

## Ziel

Verteilpaket für das Selbst-Hosting der EduKSX-Module: Installer mit einem Befehl, VM-Vorlage, Compose-Grundgerüst, Update-Dienst und Sicherung, damit eine Schule oder Gemeinde die Module ohne Docker-Kenntnisse auf einem eigenen Server betreibt.

**Nichtziele:**

- kein Anwendungscode der Module (Image und Compose-Baustein kommen aus den Modul-Repos)
- keine Betriebswerkzeuge von MarKusSX-Operation beim Kunden (Komodo, Headscale, 1Password)
- kein Ident und kein Edulog vor Ort
- keine Variante ohne Docker, kein Kubernetes

## Datenschutz

- Zielgruppe: öffentliche Organe
- Anwendbares Recht: IDG (Kanton Zürich)
- Daten: besonders schützenswert · Schutzbedarf: **vertraulich**

Die Zuordnung ist eine Arbeitshilfe, keine Rechtsberatung; bei öffentlichen Organen die zuständige
Datenschutzstelle einbeziehen (z. B. Vorabkontrolle bzw. Datenschutz-Folgenabschätzung).

## Antworten

| Frage | Antwort |
|---|---|
| Wie heisst das Projekt (voller Name)? | EduKSX-Suite |
| Was soll das Projekt leisten, und für wen? (ein bis zwei Sätze) | Verteilpaket für das Selbst-Hosting der EduKSX-Module: Installer mit einem Befehl, VM-Vorlage, Compose-Grundgerüst, Update-Dienst und Sicherung, damit eine Schule oder Gemeinde die Module ohne Docker-Kenntnisse auf einem eigenen Server betreibt. |
| Was gehört ausdrücklich nicht dazu (Nichtziele)? | kein Anwendungscode der Module (Image und Compose-Baustein kommen aus den Modul-Repos), keine Betriebswerkzeuge von MarKusSX-Operation beim Kunden (Komodo, Headscale, 1Password), kein Ident und kein Edulog vor Ort, keine Variante ohne Docker, kein Kubernetes |
| Welcher Kurzname soll in den Release-Titeln stehen? | EduKSX-Suite |
| Ist es eine Web-Anwendung, eine Desktop-Anwendung oder beides? | web |
| Wer nutzt die Anwendung? | öffentliche Organe |
| Welche öffentlichen Organe? | Kanton Zürich |
| Ist das Repository neu oder gibt es es schon? | neu |
| Wer gibt Issues und Releases frei (Rolle genügt)? | Projektverantwortliche:r |
| Arbeitest du allein oder im Team? | allein |
| Ist das Repository öffentlich oder privat? | öffentlich |
| Unter welcher Lizenz steht der Code? | AGPL-3.0-or-later |
| Auf wen lautet die Lizenz? | Markus Keller |
| In welchen Programmiersprachen wird entwickelt? | andere |
| Welcher Grundsatz gilt für Abhängigkeiten? | geprüfte Pakete |
| Wo läuft die Web-Anwendung? | beim Kunden: Linux-VM mit Docker (Ubuntu LTS, Debian) |
| Wie kommt die Anwendung zu den Nutzer:innen? | Installer (GitHub-Releases) |
| Welches Framework bzw. welche Grundlage? | Docker Compose, Caddy, restic, Packer |
| Welche Daten verarbeitet die Anwendung? | besonders schützenswert |
| Welcher Schutzbedarf gilt für die Daten (Klassifizierung)? | vertraulich |
| Welche Anmeldungen und Zugänge braucht es? | externe Dienste (API) |
| In welchen Sprachen wird die Oberfläche ausgeliefert? | de-CH |
| Gibt es Plugins oder Module mit eigener Version? | nein |
| Mit welchem Befehl laufen alle Prüfungen? | sh tests/pruefen.sh |
| In welcher Datei steht die Versionsnummer? | VERSION |
| Mit welcher Version startet das Projekt? | 2026.11.0 |
| Mit welchen KI-Agenten wird gearbeitet? | Claude |
| Wie heisst der erste Meilenstein? | 2026.11.0 – Probe |
| Übergabe und Projektstand auch als Kopie im Claude-Projekt führen? | nein |
| Welche ersten Funktionen gehören in diesen Meilenstein? | Compose-Grundgerüst /opt/eduksx (.env, compose.yaml mit Caddy, Update-Dienst und Sicherung, modules/<modul>.yaml, data/<modul>/) mit Glossary als erstem Modul, Installer install.sh mit einem Befehl und Antwortdatei: Domain, Admin-E-Mail, Module, Proxy des Schulnetzes, Sicherungsziel; erzeugt Geheimnisse (SH-E2, SH-E9), Update-Dienst nach Glossary-Muster: Digest und Signatur prüfen, Wartung, Sicherung, Austausch, /health, Rücksprung samt Datenbank, Protokoll und Mail; nur Korrekturen automatisch im Zeitfenster (SH-E5, SH-E10), Sicherung mit restic täglich und vor jedem Update, Ziel lokal/NAS/S3 Schweiz, Wiederherstellung mit einem Befehl (SH-E6), VM-Vorlage mit Packer in der CI: Ubuntu LTS, OVA, VHDX, qcow2, Einrichtung beim ersten Start im Browser (SH-E11), CI-Probe: frische VM, Installer mit Antwortdatei, Update und Rücksprung, Wiederherstellung (Konzept 4.5), Anleitung SELBST-HOSTEN.md für Personen ohne Docker-Kenntnisse, inkl. Mindestanforderungen (4.4) |

## Grundgerüst

Vorschlag für Aufbau, Ordner und erste Dateien – wird vor dem Anlegen mit Projektverantwortliche:r
abgestimmt (Status je Punkt: BESCHLOSSEN, EMPFOHLEN, OFFEN, ZU PRÜFEN):

| Punkt | Vorschlag | Status |
|---|---|---|
| Grundlage | Konzept EduKSX-Architektur `docs/KONZEPT-SELBSTHOSTING.md` (SH-E1–SH-E12) und `docs/KONZEPT-LEITSTAND.md` (L1–L6, S6); Muster EduKSX-Glossary DEC-027 (`docs/KONZEPT-UPDATES.md`, `docs/SELBST-HOSTEN.md`, `docker/`); Auftrag EduKSX-Architektur #51 | BESCHLOSSEN 13.11.2026 (eingefroren) |
| Technik | POSIX-Shell (Installer, Update-Dienst, Sicherung) nach Glossary-Muster · Docker Compose, Caddy, restic, cosign, Packer (HCL) | BESCHLOSSEN 14.11.2026 (Chat) |
| Ordner | `install.sh` · `compose/` (compose.yaml, Caddy, Bausteine der Module) · `updater/` · `backup/` · `vm/` (Packer, Einrichtung beim ersten Start) · `tests/` (pruefen.sh: shellcheck, Kompose-Prüfung, Probeläufe) · `docs/` | EMPFOHLEN |
| Prüfungen | `sh tests/pruefen.sh` (Workflow «pruefungen», Linux); volle Probe mit frischer VM als eigener Workflow | EMPFOHLEN |
| Version | `VERSION` mit 2026.11.0 – Kalenderversion nach SH-E10 (Suite legt alle Module mit Digest fest), Korrekturen .1, .2 … | BESCHLOSSEN 14.11.2026 (Chat) |
| Lizenz | AGPL-3.0-or-later (wie die Module, Plattform §9.7) | BESCHLOSSEN 14.11.2026 (Chat) |
| Auslieferung | Release auf GitHub: `install.sh` mit Prüfsumme (Artefakt «installer-*») und VM-Vorlagen (OVA, VHDX, qcow2). Der Blueprint-Workflow «installer» ist auf Desktop-Installer ausgelegt – ob er die Packer-Abbilder übernimmt oder ein eigener Workflow nötig ist. Bis dahin ist «installer» ausgeschaltet (`release_dateien.artefakte = []`, `release_nach = ["pruefungen"]`); Klärung in #6 | ZU PRÜFEN |
| Sichtbarkeit | öffentlich (nur Code, keine Daten); Schutzbedarf «vertraulich» gilt für die Daten der Installationen – nur erfundene Testdaten | BESCHLOSSEN 14.11.2026 (Chat) |
| S6 / Instanz-Token | Heartbeat und signierte Aufträge (JWS) erst mit dem Leitstand (L6); im Grundgerüst nur Platzhalter in `.env` (Opt-in) | EMPFOHLEN |
| arm64 | SH-E2 «amd64, arm64 ZU PRÜFEN» – Probe zuerst nur amd64 (#3) | ZU PRÜFEN |

## Erster Meilenstein: 2026.11.0 – Probe

- [ ] Compose-Grundgerüst /opt/eduksx (.env, compose.yaml mit Caddy, Update-Dienst und Sicherung, modules/<modul>.yaml, data/<modul>/) mit Glossary als erstem Modul
- [ ] Installer install.sh mit einem Befehl und Antwortdatei: Domain, Admin-E-Mail, Module, Proxy des Schulnetzes, Sicherungsziel; erzeugt Geheimnisse (SH-E2, SH-E9)
- [ ] Update-Dienst nach Glossary-Muster: Digest und Signatur prüfen, Wartung, Sicherung, Austausch, /health, Rücksprung samt Datenbank, Protokoll und Mail; nur Korrekturen automatisch im Zeitfenster (SH-E5, SH-E10)
- [ ] Sicherung mit restic täglich und vor jedem Update, Ziel lokal/NAS/S3 Schweiz, Wiederherstellung mit einem Befehl (SH-E6)
- [ ] VM-Vorlage mit Packer in der CI: Ubuntu LTS, OVA, VHDX, qcow2, Einrichtung beim ersten Start im Browser (SH-E11)
- [ ] CI-Probe: frische VM, Installer mit Antwortdatei, Update und Rücksprung, Wiederherstellung (Konzept 4.5)
- [ ] Anleitung SELBST-HOSTEN.md für Personen ohne Docker-Kenntnisse, inkl. Mindestanforderungen (4.4)

Als Issues mit Testliste angelegt (14.11.2026): #2 Compose-Grundgerüst · #3 Installer · #4 Update-Dienst · #5 Sicherung · #6 VM-Vorlage · #7 CI-Probe · #8 Anleitung – alle `triage`, Umsetzung nach Freigabe.
