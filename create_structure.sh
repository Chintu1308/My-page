#!/bin/bash

# Create the project directory
mkdir -p my-blog

# Navigate to the project directory
cd my-blog

# Create the directory structure
mkdir -p public/images
mkdir -p src/components
mkdir -p src/pages
mkdir -p src/styles

# Create placeholder image files
touch public/images/bg.jpg
touch public/images/favicon.ico
touch public/images/logo.png
touch public/images/pen.webp

# Create component files
cat <<EOF > src/components/Header.astro
---
--- 

<header class="menu_main">
  <div class="menu_left">
    <img src="/images/logo.png" alt="Logo">
  </div>
  <div class="menu_right">
    <ul>
      <li><a href="https://bhhc.me/">Home</a></li>
    </ul>
  </div>
</header>
EOF

cat <<EOF > src/components/BlogLink.astro
---
export interface Props {
  href: string;
  label: string;
}

const { href, label } = Astro.props as Props;
---

<a class="blog-link" href={href} target="_blank">
  <button><i>{label.split(':')[0]}</i> {label.split(':')[1]}</button>
</a>
EOF

cat <<EOF > src/components/Footer.astro
---
--- 

<footer class="copyright-bar">
  &copy; 2023 Hari Hara Charan Bongu. All rights reserved.
</footer>
EOF

# Create the main page
cat <<EOF > src/pages/index.astro
---
import Header from '../components/Header.astro';
import BlogLink from '../components/BlogLink.astro';
import Footer from '../components/Footer.astro';

const blogPosts = [
  { href: "Blogs/Blog1.html", label: "B1: WHAT I SEE IN IT?" },
  { href: "Blogs/Blog2.html", label: "B2: Dad's Message" }
];
---

<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1">
    <title>My Blogs</title>
    <link rel="stylesheet" href="/styles/global.css">
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon">
  </head>
  <body>
    <Header />
    <div class="right-image"></div>
    <div class="blog-container">
      <br><br><h1 class="blog-title">My Blogs</h1></br></br>
      {blogPosts.map(post => (
        <BlogLink href={post.href} label={post.label} />
      ))}
    </div>
    <Footer />
  </body>
</html>
EOF

# Create global styles
cat <<EOF > src/styles/global.css
body {
  margin: 0;
  padding: 0;
  background: url('/images/bg.jpg') center/cover no-repeat;
  height: 100vh;
  font-family: 'Arial', sans-serif;
  transition: background 0.5s ease;
}

.menu_main {
  position: fixed;
  top: 0;
  width: 100%;
  display: flex;
  background: rgba(255, 255, 255, 0.5); /* Transparent white panel */
  z-index: 1000;
}

.menu_left {
  padding: 20px;
  text-align: center;
}

.menu_left img {
  width: 80px;
  margin-bottom: 20px;
}

.menu_right {
  flex-grow: 1;
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.menu_right ul {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
}

.menu_right li {
  margin-left: 20px;
}

.menu_right a {
  text-decoration: none;
  color: #000;
  font-weight: bold;
  font-size: 16px;
  transition: color 0.3s ease-in-out;
}

.menu_right a:hover {
  color: #7caeff;
}

.blog-container {
  text-align: center;
  padding: 100px 20px 20px; /* Adjusted padding */
  color: #000;
}

.blog-title {
  margin-bottom: 20px;
}

.blog-link {
  text-decoration: none;
  color: #000;
  font-size: 24px;
  display: block;
  margin-bottom: 10px; /* Adjusted margin */
  text-align: left; /* Align to the left */
}

.blog-link button {
  background-color: #F5F2E8;
  color: #000000;
  padding: 10px 20px;
  border: none;
  font-size: 16px;
  cursor: pointer;
}

.right-image {
  position: fixed;
  top: 240px;
  right: 8px;
  width: 408px;
  height: 56vh;
  background: url('/images/pen.webp') center/cover no-repeat;
}

.copyright-bar {
  background: rgba(0, 0, 0, 0.8); /* Transparent black bar at the bottom */
  color: #fff;
  padding: 10px;
  text-align: center;
  position: fixed;
  bottom: 0;
  width: 100%;
}
EOF

# Create Astro config file
cat <<EOF > astro.config.mjs
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://your-site-url.com',
  output: 'static',
});
EOF

echo "Directory structure created. Run 'npm install' and 'npm run dev' to start your Astro project."
