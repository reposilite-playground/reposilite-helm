{{/* vim: set filetype=mustache: */}}

{{/* annotations */}}

{{- define "reposilite.service.annotations" -}}
{{ include "reposilite.annotations" . }}
{{- if .Values.service.annotations }}
{{ toYaml .Values.service.annotations }}
{{- end }}
{{- end }}

{{/* labels */}}

{{- define "reposilite.service.labels" -}}
{{ include "reposilite.labels" . }}
{{- if .Values.service.labels }}
{{ toYaml .Values.service.labels }}
{{- end }}
{{- end }}

{{/* names */}}

{{- define "reposilite.service.name" -}}
{{- if .Values.service.enabled -}}
{{ include "reposilite.fullname" . }}
{{- end -}}
{{- end -}}