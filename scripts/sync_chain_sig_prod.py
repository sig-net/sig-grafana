#!/usr/bin/env python3

import argparse
import json
from pathlib import Path


REFERENCE_FIELDS = (
    ("apiVersion",),
    ("kind",),
    ("metadata",),
    ("spec", "title"),
    ("spec", "editable"),
)


def load_json(path: Path) -> dict:
    with path.open("r", encoding="utf-8") as handle:
        return json.load(handle)


def dump_json(path: Path, document: dict) -> None:
    with path.open("w", encoding="utf-8") as handle:
        json.dump(document, handle, indent=2, ensure_ascii=False)
        handle.write("\n")


def validate_dashboard(document: dict, label: str) -> None:
    if document.get("apiVersion") != "dashboard.grafana.app/v2":
        raise ValueError(f"{label} must be a Grafana v2 dashboard export")
    if document.get("kind") != "Dashboard":
        raise ValueError(f"{label} must have kind=Dashboard")
    if not isinstance(document.get("metadata"), dict):
        raise ValueError(f"{label} must include a metadata object")
    if not isinstance(document.get("spec"), dict):
        raise ValueError(f"{label} must include a spec object")


def read_path(document: dict, path: tuple[str, ...]):
    current = document
    for key in path:
        if not isinstance(current, dict) or key not in current:
            raise KeyError("Missing required field: " + ".".join(path))
        current = current[key]
    return current


def write_path(document: dict, path: tuple[str, ...], value) -> None:
    current = document
    for key in path[:-1]:
        if key not in current or not isinstance(current[key], dict):
            current[key] = {}
        current = current[key]
    current[path[-1]] = value


def normalize_dashboard(candidate: dict, reference: dict) -> dict:
    for field in REFERENCE_FIELDS:
        write_path(candidate, field, read_path(reference, field))
    return candidate


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Sync the Chain Signatures prod dashboard with staging content while "
            "preserving the deployed prod identity fields."
        )
    )
    parser.add_argument("--candidate", required=True, type=Path)
    parser.add_argument("--reference", required=True, type=Path)
    args = parser.parse_args()

    candidate = load_json(args.candidate)
    reference = load_json(args.reference)
    validate_dashboard(candidate, "Candidate dashboard")
    validate_dashboard(reference, "Reference dashboard")
    normalized = normalize_dashboard(candidate, reference)
    dump_json(args.candidate, normalized)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
