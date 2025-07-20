{{/* vim: set filetype=mustache: */}}

{{/* annotations */}}

{{- define "reposilite.deployment.annotations" -}}
{{ include "reposilite.annotations" . }}
{{- if .Values.deployment.annotations }}
{{ toYaml .Values.deployment.annotations }}
{{- end }}
{{- end }}

{{/* image */}}

{{- define "reposilite.deployment.images.reposilite.fqin" -}}
{{- $registry := .Values.deployment.reposilite.image.registry -}}
{{- $repository := .Values.deployment.reposilite.image.repository -}}
{{- $tag := default .Chart.AppVersion .Values.deployment.reposilite.image.tag -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end -}}

{{/* labels */}}

{{- define "reposilite.deployment.labels" -}}
{{ include "reposilite.labels" . }}
{{- if .Values.deployment.labels }}
{{ toYaml .Values.deployment.labels }}
{{- end }}
{{- end }}

{{/* serviceAccount */}}

{{- define "reposilite.deployment.serviceAccount" -}}
{{- if .Values.serviceAccount.existing.enabled -}}
{{- printf "%s" .Values.serviceAccount.existing.serviceAccountName -}}
{{- else -}}
{{- include "reposilite.fullname" . -}}
{{- end -}}
{{- end }}

{{/* volumeMounts */}}

{{- define "reposilite.deployment.reposilite.volumeMounts" -}}
{{- $volumeMounts := .Values.deployment.reposilite.volumeMounts | default list }}
{{- if .Values.persistentVolumeClaim.enabled }}
{{- $volumeMounts = concat $volumeMounts (list (dict "name" "data" "mountPath" .Values.persistentVolumeClaim.path )) }}
{{- end }}
{{ toYaml (dict "volumeMounts" $volumeMounts) }}
{{- end -}}

{{/* volumes */}}

{{- define "reposilite.deployment.volumes" -}}
{{- $volumes := .Values.deployment.volumes | default list }}

{{- if and .Values.persistentVolumeClaim.enabled (not .Values.persistentVolumeClaim.existing.enabled) }}
{{- $persistentVolumeClaimName := include "reposilite.persistentVolumeClaim.name" $ -}}
{{- $volumes = concat $volumes (list (dict "name" "data" "persistentVolumeClaim" (dict "claimName" $persistentVolumeClaimName))) }}
{{- end }}

{{ toYaml (dict "volumes" $volumes) }}

{{- end -}}