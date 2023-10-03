{{- define "reposilite.podTemplate" }}
    metadata:
      annotations:
      {{- with .Values.deployment.podAnnotations }}
        {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
      {{- include "reposilite.labels" . | nindent 8 -}}
      {{- with .Values.deployment.podLabels }}
        {{- toYaml . | nindent 8 }}
      {{- end}}
    spec:
      {{- with .Values.deployment.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      serviceAccountName: {{ include "reposilite.serviceAccountName" . }}
      terminationGracePeriodSeconds: {{ default 60 .Values.deployment.terminationGracePeriodSeconds }}
      {{- with .Values.deployment.initContainers }}
      initContainers:
        {{- toYaml . | nindent 6 }}
      {{- end }}
      containers:
      - name: {{ template "reposilite.fullname" . }}
        image: "{{ .Values.image.name }}:{{ default .Chart.AppVersion .Values.image.tag }}"
        imagePullPolicy: {{ .Values.image.pullPolicy }}
        stdin: true
        {{- with .Values.resources }}
        resources:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        readinessProbe:
          httpGet:
            path: /
            port: {{ .Values.probes.port }}
            scheme: {{ .Values.probes.scheme }}
          {{- toYaml .Values.probes.readiness | nindent 10 }}
        livenessProbe:
          httpGet:
            path: /
            port: {{ .Values.probes.port }}
            scheme: {{ .Values.probes.scheme }}
          {{- toYaml .Values.probes.liveness | nindent 10 }}
        {{- with .Values.deployment.lifecycle}}
        lifecycle:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        ports:
        - name: "http"
          containerPort: {{ .Values.service.port }}
          protocol: TCP
        volumeMounts:
          - name: {{ .Values.persistence.name }}
            mountPath: {{ .Values.persistence.path }}
            {{- if .Values.persistence.subPath }}
            subPath: {{ .Values.persistence.subPath }}
            {{- end }}
          {{- if .Values.deployment.additionalVolumeMounts }}
          {{- toYaml .Values.deployment.additionalVolumeMounts | nindent 10 }}
          {{- end }}
        {{- with .Values.env }}
        env:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        {{- with .Values.envFrom }}
        envFrom:
          {{- toYaml . | nindent 10 }}
        {{- end }}
      {{- if .Values.deployment.additionalContainers }}
        {{- toYaml .Values.deployment.additionalContainers | nindent 6 }}
      {{- end }}
      volumes:
        - name: {{ .Values.persistence.name }}
          {{- if .Values.persistence.enabled }}
          persistentVolumeClaim:
            claimName: {{ default (include "reposilite.fullname" .) .Values.persistence.existingClaim }}
          {{- else }}
          emptyDir: {}
          {{- end }}
        {{- if .Values.deployment.additionalVolumes }}
          {{- toYaml .Values.deployment.additionalVolumes | nindent 8 }}
        {{- end }}
      {{- if .Values.affinity }}
      affinity:
        {{- tpl (toYaml .Values.affinity) . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
{{ end -}}
