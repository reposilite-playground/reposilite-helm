---

{{/* annotations */}}

{{- define "reposilite.hpa.annotations" -}}
{{ include "reposilite.annotations" . }}
{{- if .Values.hpa.annotations }}
{{ toYaml .Values.hpa.annotations }}
{{- end }}
{{- end }}

{{/* labels */}}

{{- define "reposilite.hpa.labels" -}}
{{ include "reposilite.labels" . }}
{{- if .Values.hpa.labels }}
{{ toYaml .Values.hpa.labels }}
{{- end }}
{{- end }}
