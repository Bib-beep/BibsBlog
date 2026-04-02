Test

Install and initialize a static site generator (for example, hugo new site myblog or npm create astro@latest).

Add posts as Markdown files in the content directory and pick a simple blog theme.

Run the local dev server to preview, then run the build command to generate the static site.

In AWS, create an S3 bucket, enable static website hosting, and upload the build output.

Create a CloudFront distribution with the S3 website endpoint as origin and enable HTTPS.

Optionally, buy or connect a domain in Route 53 and point DNS to CloudFront.

Add a CI workflow (e.g., GitHub Actions) that on push: builds your site and syncs the output folder to S3, then invalidates CloudFront
