---

{{/* annotations */}}

{{- define "reposilite.pod.annotations" -}}
{{ include "reposilite.annotations" . }}
{{- end }}

{{/* labels */}}

{{- define "reposilite.pod.labels" -}}
{{ include "reposilite.labels" . }}
{{- end }}

{{- define "reposilite.pod.selectorLabels" -}}
{{ include "reposilite.selectorLabels" . }}
{{- end }}