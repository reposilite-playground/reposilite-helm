{{/* vim: set filetype=mustache: */}}

{{/* annotations */}}

{{- define "reposilite.networkPolicy.annotations" -}}
{{ include "reposilite.annotations" . }}
{{- if .Values.networkPolicy.annotations }}
{{ toYaml .Values.networkPolicy.annotations }}
{{- end }}
{{- end }}

{{/* labels */}}

{{- define "reposilite.networkPolicy.labels" -}}
{{ include "reposilite.labels" . }}
{{- if .Values.networkPolicy.labels }}
{{ toYaml .Values.networkPolicy.labels }}
{{- end }}
{{- end }}
