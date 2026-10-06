

<svg viewBox="0 0 960 700" width="1920" height="1400" role="img" aria-label="Architecture: Grafana queries Thanos Query and Loki; Prometheus with Thanos sidecar and Alloy feed S3 buckets" xmlns="http://www.w3.org/2000/svg" font-family="Inter, 'Segoe UI', Helvetica, Arial, sans-serif">
<rect width="960" height="700" fill="#ffffff"/><defs>
<marker id="ar" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" fill="#1b2230"/></marker>
<marker id="as" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" style="fill:#d9561f"/></marker>
</defs>
<g fill="none" stroke="#1b2230" stroke-width="1.5">
<!-- frames -->
<rect x="16" y="66" width="928" height="470" rx="10" stroke-dasharray="6 5" stroke-opacity=".5"/>
<rect x="16" y="578" width="928" height="108" rx="10" stroke-dasharray="6 5" stroke-opacity=".5"/>
<!-- user -->
<rect x="330" y="12" width="300" height="38" rx="6" style="fill:#ffffff"/>
<line x1="480" y1="50" x2="480" y2="104" marker-end="url(#ar)"/>
<!-- grafana -->
<rect x="330" y="104" width="300" height="56" rx="6" style="fill:#ffffff"/>
<!-- grafana to query / loki -->
<line x1="410" y1="160" x2="360" y2="210" marker-end="url(#ar)"/>
<line x1="560" y1="160" x2="760" y2="210" marker-end="url(#ar)"/>
<!-- metrics side -->
<rect x="200" y="210" width="240" height="56" rx="6" style="fill:#e6ecfc;stroke:#2f5bd8"/>
<line x1="260" y1="266" x2="130" y2="330" marker-end="url(#ar)"/>
<line x1="400" y1="266" x2="523" y2="330" marker-end="url(#ar)"/>
<rect x="40" y="330" width="180" height="110" rx="6" style="fill:#e6ecfc;stroke:#2f5bd8"/>
<rect x="250" y="330" width="330" height="110" rx="6" style="fill:#e6ecfc;stroke:#2f5bd8"/>
<rect x="257" y="362" width="100" height="62" rx="4" style="fill:#ffffff"/>
<rect x="365" y="362" width="100" height="62" rx="4" style="fill:#ffffff"/>
<rect x="473" y="362" width="100" height="62" rx="4" style="fill:#ffffff"/>
<line x1="330" y1="440" x2="330" y2="462" marker-end="url(#ar)"/>
<rect x="250" y="462" width="240" height="46" rx="6" style="fill:#ffffff"/>
<!-- logs side -->
<rect x="680" y="210" width="230" height="56" rx="6" style="fill:#e1f3ea;stroke:#1f7a4d"/>
<line x1="795" y1="340" x2="795" y2="266" marker-end="url(#ar)"/>
<rect x="680" y="340" width="230" height="70" rx="6" style="fill:#e1f3ea;stroke:#1f7a4d"/>
<line x1="795" y1="410" x2="795" y2="462" marker-end="url(#ar)"/>
<rect x="680" y="462" width="230" height="46" rx="6" style="fill:#ffffff"/>
<!-- s3 -->
<rect x="40" y="606" width="540" height="62" rx="6" style="fill:#fbe9e0;stroke:#d9561f"/>
<rect x="680" y="606" width="220" height="62" rx="6" style="fill:#fbe9e0;stroke:#d9561f"/>
<g style="stroke:#d9561f" stroke-width="2">
<line x1="523" y1="424" x2="523" y2="606" marker-end="url(#as)"/>
<line x1="130" y1="606" x2="130" y2="440" marker-end="url(#as)"/>
<polyline points="910,238 930,238 930,637 900,637" marker-end="url(#as)" marker-start="url(#as)"/>
</g>
</g>
<g fill="#1b2230" text-anchor="middle" font-size="13">
<text x="480" y="35" font-weight="600">Engineer (browser)</text>
<text x="480" y="132" font-weight="700">Grafana</text>
<text x="480" y="150" font-size="11" opacity=".75">+ sidecars: dashboards, datasources</text>
<text x="320" y="234" font-weight="700">Thanos Query :10902</text>
<text x="320" y="252" font-size="11" opacity=".75">merges sources, dedups prometheus_replica</text>
<text x="130" y="362" font-weight="700">Thanos Store Gateway</text>
<text x="130" y="382" font-size="11" opacity=".75">serves old blocks</text>
<text x="130" y="398" font-size="11" opacity=".75">read from S3</text>
<text x="130" y="414" font-size="11" opacity=".75">(100MB index cache)</text>
<text x="262" y="348" font-size="11" font-weight="600" text-anchor="start">Pod: prometheus-kps-prometheus-0</text>
<text x="307" y="388" font-weight="700" font-size="11.5">prometheus</text><text x="307" y="405" font-size="10.5" opacity=".75">TSDB, keeps 12h</text>
<text x="415" y="388" font-weight="700" font-size="11.5">config-reloader</text><text x="415" y="405" font-size="10.5" opacity=".75">reloads rules</text>
<text x="523" y="388" font-weight="700" font-size="11.5">thanos-sidecar</text><text x="523" y="405" font-size="10.5" opacity=".75">StoreAPI + upload</text>
<text x="370" y="482" font-weight="700">Scrape targets</text>
<text x="370" y="499" font-size="11" opacity=".75">node-exporter, kubelet / cAdvisor</text>
<text x="795" y="234" font-weight="700">Loki (SingleBinary) :3100</text>
<text x="795" y="252" font-size="11" opacity=".75">local state: emptyDir /var/loki</text>
<text x="795" y="368" font-weight="700">Grafana Alloy</text>
<text x="795" y="387" font-size="11" opacity=".75">adds labels: namespace, pod, container</text>
<text x="795" y="482" font-weight="700">Container logs</text>
<text x="795" y="499" font-size="11" opacity=".75">every pod in the cluster</text>
<text x="310" y="632" font-weight="700">S3 bucket: prometheus-thanos-khamisi</text>
<text x="310" y="651" font-size="11" opacity=".75">2h TSDB blocks (chunks, index, meta.json)</text>
<text x="790" y="632" font-weight="700">S3 bucket: loki-khamisi</text>
<text x="790" y="651" font-size="11" opacity=".75">log chunks + index</text>
</g>
<g fill="#1b2230" font-size="11">
<text x="28" y="86" font-weight="600" opacity=".8">Kubernetes cluster · node master · namespace monitoring</text>
<text x="150" y="598" font-weight="600" opacity=".8">AWS S3 · long-term storage</text>
<text x="490" y="84" opacity=".75">HTTP :3000 via SSH tunnel + port-forward</text>
<text x="352" y="196" text-anchor="end">PromQL</text>
<text x="690" y="184">LogQL</text>
<text x="180" y="292" text-anchor="end">gRPC :10901</text>
<text x="500" y="300">gRPC :10901 (last 12h)</text>
<text x="338" y="456">scrapes every 60s</text>
<text x="803" y="440">reads via K8s API</text>
<text x="803" y="308">push /loki/api/v1/push</text>
<text x="531" y="570" style="fill:#d9561f" font-weight="600">upload a block every 2h</text>
<text x="138" y="570" style="fill:#d9561f" font-weight="600">read blocks</text>
<text x="922" y="570" text-anchor="end" style="fill:#d9561f" font-weight="600">flush / query</text>
</g>
</svg>

<img width="1244" height="610" alt="image" src="https://github.com/user-attachments/assets/5471dc91-b772-49e2-91e1-5daab7412fa3" />
