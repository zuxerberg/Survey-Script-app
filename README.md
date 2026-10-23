# Owner Survey

A simple browser-based business owner survey. Includes interview cards, eight core questions, business contact fields, notes, pickup status, search, and JSON backup import/export.

## Run

Open `dist/index.html` in a modern browser.

## Vercel

Import this repository as a new Vercel project. Choose **Other** as the framework, leave the build and install commands empty, and set the output directory to `dist`. These settings are also declared in `vercel.json`.

## Data

Survey answers are saved to localStorage in the current browser. They are not uploaded to a server or synchronized between devices. Use Export backup to keep a separate copy. Moving from a local file to the hosted app requires exporting and importing the records.
