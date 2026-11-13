# Übergabe an einen neuen Chat – EduKSX-Suite

Stand: **14.11.2026 (00:30)** – Projektstart mit dem Blueprint abgeschlossen; noch kein Release; Meilenstein
«2026.11.0 – Probe» mit #2–#8 (`triage`).
[PROJEKTSTAND.md](PROJEKTSTAND.md) (aktuell), [PROJEKTSTAND-ARCHIV.md](PROJEKTSTAND-ARCHIV.md) (Verlauf), Konzepte in
`docs/KONZEPT-*.md`. Bei jeder Übergabe nachführen.

## Start nächster Chat (Übergabe 14.11.2026, 00:30)

**Zuerst lesen:** CLAUDE.md → AGENTS.md → dieser Abschnitt → PROJEKTSTAND.md → [PROJEKTSTART.md](PROJEKTSTART.md) →
EduKSX-Architektur `docs/KONZEPT-SELBSTHOSTING.md` und `docs/KONZEPT-LEITSTAND.md` (eingefroren, Änderungen nur über
`konzept-anpassung` dort) → Muster in EduKSX-Glossary (`docs/KONZEPT-UPDATES.md`, `docs/SELBST-HOSTEN.md`, `docker/`).

**Stand Code und CI**
- `main` = erster Commit «GitHub-Blueprint angewendet». Noch kein Release; nächstes nur auf ausdrückliche Freigabe.
- Prüfen: `sh tests/pruefen.sh` (vorläufig: Syntax und shellcheck).
- Workflow «installer» ist ausgeschaltet, bis #6 den Release-Weg für install.sh und VM-Vorlagen klärt.

**Offene Issues und ihr Status**

| Issue | Meilenstein | Status | Inhalt |
|---|---|---|---|
| #2 | 2026.11.0 – Probe | `triage` | Compose-Grundgerüst mit Glossary als erstem Modul |
| #3 | 2026.11.0 – Probe | `triage` | Installer install.sh (arm64 ZU PRÜFEN) |
| #4 | 2026.11.0 – Probe | `triage` | Update-Dienst (Glossary DEC-027) |
| #5 | 2026.11.0 – Probe | `triage` | Sicherung mit restic, Wiederherstellung |
| #6 | 2026.11.0 – Probe | `triage` | VM-Vorlage mit Packer, Release-Weg klären |
| #7 | 2026.11.0 – Probe | `triage` | CI-Probe auf frischer VM |
| #8 | 2026.11.0 – Probe | `triage` | Anleitung SELBST-HOSTEN.md |

Alle **nicht umgesetzt** – erst auf Freigabe von Projektverantwortliche:r (`_1 bereit` bzw. Auftrag im Chat).

**Hinweise für die Arbeit**
- Von Hand bzw. lokal mit eigener gh-Anmeldung offen (Proxy der Claude-Sitzung erlaubt es nicht):
  `python3 ../my-github-blueprint/.github/blueprint/apply.py --ziel . --nur-github` für Repository-Einstellungen,
  Rulesets, Actions-Richtlinien, Dependabot, private Sicherheitsmeldungen; dazu die Liste «Von Hand» (Social Preview,
  Release immutability …).
- GitHub-Standard-Labels (bug, enhancement …) wurden nicht entfernt (`standard_labels_entfernen = false`, Löschen nur
  nach Rückfrage).
- Schutzbedarf «vertraulich», Repo aber öffentlich: nur Code, nur erfundene Testdaten.

**Arbeitsregeln** (siehe AGENTS.md)
- Jedes Thema aus dem Chat → Issue mit Testliste; Status `_1 bereit` → `_2 in Arbeit` → `_3 Beta-Test`.
- Verbesserungen aus dem Test nur als Issue anlegen; umsetzen erst nach Freigabe.
- Releases nur nach ausdrücklicher Freigabe; `VERSION`, Tags und Releases nicht anfassen.
- Löschen nur nach Rückfrage.

## Sitzungen

### Sitzung 14.11.2026 (00:03–00:30) – Projektstart

- Auftrag EduKSX-Architektur #51; Start-Checkliste beantwortet, Steckbrief bestätigt, `apply.py` angewendet.
- Issues #2–#8 im Meilenstein «2026.11.0 – Probe» angelegt.

## Entscheide

- Entscheid 14.11.2026: Lizenz AGPL-3.0-or-later (wie die Module, Plattform §9.7).
- Entscheid 14.11.2026: POSIX-Shell für Installer, Update-Dienst und Sicherung (Glossary-Muster).
- Entscheid 14.11.2026: Kalenderversion in `VERSION`, Start 2026.11.0 (SH-E10), Korrekturen .1, .2 …
- Entscheid 14.11.2026: Daten besonders schützenswert, Schutzbedarf «vertraulich»; Repository bleibt öffentlich.
