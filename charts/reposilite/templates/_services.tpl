{{/* vim: set filetype=mustache: */}}

{{/* annotations */}}

{{- define "reposilite.services.http.annotations" -}}
{{ include "reposilite.annotations" . }}
{{- if .Values.services.http.annotations }}
{{ toYaml .Values.services.http.annotations }}
{{- end }}
{{- end }}

{{/* labels */}}

{{- define "reposilite.services.http.labels" -}}
{{ include "reposilite.labels" . }}
{{- if .Values.services.http.labels }}
{{ toYaml .Values.services.http.labels }}
{{- end }}
{{- end }}

{{/* names */}}

{{- define "reposilite.services.http.name" -}}
{{- if .Values.services.http.enabled -}}
{{ include "reposilite.fullname" . }}-http
{{- end -}}
{{- end -}}