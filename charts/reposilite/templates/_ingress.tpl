{{/* vim: set filetype=mustache: */}}

{{/* annotations */}}

{{- define "reposilite.ingress.annotations" -}}
{{ include "reposilite.annotations" . }}
{{- if .Values.ingress.annotations }}
{{ toYaml .Values.ingress.annotations }}
{{- end }}
{{- end }}

{{/* labels */}}

{{- define "reposilite.ingress.labels" -}}
{{ include "reposilite.labels" . }}
{{- if .Values.ingress.labels }}
{{ toYaml .Values.ingress.labels }}
{{- end }}
{{- end }}
