#!/bin/bash
echo: "\nStarting Release script."
npm run release
git push --follow-tags origin main
exit 0