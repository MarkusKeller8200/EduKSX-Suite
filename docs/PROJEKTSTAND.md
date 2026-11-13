# EduKSX-Suite – Projektstand

> Stand 14.11.2026 (00:30): Projektstart mit dem GitHub-Blueprint; noch kein Code des Pakets. Als Nächstes der
> Meilenstein «2026.11.0 – Probe» (#2–#8) nach Freigabe.

## Umgesetzt

| Bereich | Stand | Seit Version | Konzept |
|---|---|---|---|
| GitHub-Ablauf (Labels, Meilensteine, Workflows, Vorlagen) | fertig, Einstellungen teils von Hand offen | – | Blueprint 0.1.0 |

## Offen bzw. geplant

- Meilenstein «2026.11.0 – Probe»: #2–#8 (alle `triage`)
- Sammlungen Fehler / Verbesserungen / Funktionen: nur nach Freigabe

## Technik

- POSIX-Shell, Docker Compose, Caddy, restic, cosign, Packer; Aufbau einer Installation nach
  KONZEPT-SELBSTHOSTING §4.1 (`/opt/eduksx`).
- Prüfen: `sh tests/pruefen.sh`
