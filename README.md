# Portfolio

Personal portfolio of Mohamad Fareez Bin Jasmi: cloud, platform and mobile work.

Live at **https://fareezjasmi.github.io/portfolio/**

The site is plain HTML and one CSS file in [`site/`](site/). No JavaScript, no
frameworks, no build step, no trackers. Light and dark themes follow the OS setting.

## Preview locally

```bash
cd site
python3 -m http.server 8000
# open http://localhost:8000
```

## Hosting

- **Now:** GitHub Pages. [`.github/workflows/pages.yml`](.github/workflows/pages.yml)
  publishes `site/` on every push to `main`.
- **Planned:** a move to AWS. [`infra/`](infra/) holds the Terraform for a private S3
  bucket behind CloudFront (Origin Access Control, HTTPS, optional custom domain with
  ACM and Route 53) and a GitHub OIDC role for deploys, and
  [`.github/workflows/deploy-aws.yml`](.github/workflows/deploy-aws.yml) is the matching
  deploy workflow (manual trigger only until then).

```bash
cd infra
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
```

`404.html` uses `/portfolio/` paths because the site is served under that subpath on
GitHub Pages; switch them to `/` when the site moves to its own domain.
