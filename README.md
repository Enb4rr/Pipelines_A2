# Pipelines A2

### Made by PG29 Julian R
### Last Modified 4/23/2026

---

### Vite React App - GitHub Actions Deployment Pipeline

## OVERVIEW

This pipeline automatically builds and deploys a React (Vite)
app to GitHub Pages whenever a push to the main branch is done.


## FILES INCLUDED

- deploy.yml
- setup.cmd

## PRE-REQUISITES

## Before running anything, make sure to have:

  1. Node.js installed - v18 or higher
  2. Git installed and configured
  3. A GitHub account
  4. A GitHub repository already created (public or private)


## ONE-TIME SETUP STEPS

## Follow these steps the first time you set up the pipeline.

  STEP 1 - Create the Vite React project (if you haven't yet)

  STEP 2 - Update vite.config.js
    Open vite.config.js and add the base option.
    Replace "your-repo-name" with the actual GitHub repo name.

      import { defineConfig } from 'vite'
      import react from '@vitejs/plugin-react'

      export default defineConfig({
        plugins: [react()],
        base: '/your-repo-name/',
      })

    WHY: GitHub Pages serves the site from a subfolder
    (e.g. username.github.io/repo-name/). Without this,
    the assets will fail to load.

  STEP 3 - Add the pipeline file
    In the project root, create this folder structure:
      .github/
        workflows/
          deploy.yml

    Then paste the contents of deploy.yml into that file.

  STEP 4 - Enable GitHub Pages in your repo settings
    a. Go to the repository on GitHub
    b. Click Settings > Pages
    c. Under "Source", select "GitHub Actions"
    d. Save

  STEP 5 - Run setup.cmd
    Double-click setup.cmd from the root of your project.
    This script will:
      - Check that Node.js and npm are installed
      - Check that package.json exists
      - Run npm install to install your dependencies
      - Save a log to setup.log

  STEP 6 - Push to GitHub
    Once setup.cmd completes successfully, push your code:

      git add .
      git commit -m "Initial commit with pipeline"
      git push origin main

## HOW TO TEST THE PIPELINE FROM SCRATCH

  1. Complete all ONE-TIME SETUP STEPS above.

  2. Go to the GitHub repository.

  3. Click the "Actions" tab.

  4. You should see a workflow called:
     "Build and Deploy React Vite App"

  5. Click on the latest run to see progress.
     - The "Build Vite App" job runs first.
     - The "Deploy to GitHub Pages" job runs after.

  6. Once both jobs show a green checkmark, the app is live.

  7. Find the live URL at:
     https://your-username.github.io/your-repo-name/