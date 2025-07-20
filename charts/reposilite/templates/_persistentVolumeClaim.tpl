{{/* vim: set filetype=mustache: */}}

{{/* annotations */}}

{{- define "reposilite.persistentVolumeClaim.annotations" -}}
helm.sh/resource-policy: keep
{{- if .Values.persistentVolumeClaim.new.annotations }}
{{ toYaml .Values.persistentVolumeClaim.new.annotations }}
{{- end }}
{{- end }}

{{/* labels */}}

{{- define "reposilite.persistentVolumeClaim.labels" -}}
{{ include "reposilite.labels" . }}
{{- if .Values.persistentVolumeClaim.new.labels }}
{{ toYaml .Values.persistentVolumeClaim.new.labels }}
{{- end }}
{{- end }}

{{/* name */}}

{{- define "reposilite.persistentVolumeClaim.name" -}}
{{ include "reposilite.fullname" . }}
{{- end }}