## Commands

- **Build Helm Package:** `helm package .`
- **Install Helm Chart (example):** `helm install paperless-ai ./paperless-ai` (or use the release name from `Chart.yaml` if different)
- **Push Helm Chart to OCI Registry:** `helm push paperless-ai-0.1.0.tgz oci://registry.nick.wtf/library` (adjust version and registry URI as needed)

*Note: Specific linting and testing commands are not found in the project. Consider adding `helm lint .` and `helm test <release_name>` if applicable.*

## Code Style & Conventions (Helm Charts)

- **Naming:**
    - Follow Kubernetes naming conventions for resources (e.g., lowercase DNS-compatible names).
    - Use `{{ include "chart.fullname" . }}` for resource names to ensure uniqueness and consistency.
    - Variables in `values.yaml` should use camelCase (e.g., `replicaCount`).
- **Templating (`templates/`):**
    - Use `{{- ... -}}` to trim whitespace where appropriate to keep generated YAML clean.
    - Employ named templates (`_helpers.tpl`) for reusable logic and DRY principles.
    - Clearly comment complex template logic.
- **Values (`values.yaml`):**
    - Provide sensible defaults for all configurable parameters.
    - Clearly document each parameter with comments explaining its purpose and possible values.
    - Organize values logically, possibly nesting under descriptive keys.
- **Chart.yaml:**
    - Keep `apiVersion`, `name`, `version`, and `appVersion` accurate and up-to-date.
    - Provide a concise and informative `description`.
- **Error Handling:**
    - For template logic, use `fail` or `required` functions to handle missing critical values.
    - Ensure resources define readiness and liveness probes where applicable for robust deployments.
- **Formatting:**
    - YAML: Use consistent indentation (typically 2 spaces).
    - Helm templates: Maintain readability; align Go template syntax for clarity.
- **Imports (Helpers):**
    - Clearly define and document helper templates in `_helpers.tpl`.
    - Prefer using named templates over embedding complex logic directly in resource definitions.
- **Types:**
    - In `values.yaml`, imply types through default values (e.g., `port: 80` implies integer, `enabled: true` implies boolean). Use comments if ambiguity exists.
