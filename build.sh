#!/bin/bash
npx vue-cli-service build --target lib --name vue-ui ./src/lib/index.ts
cp -R ./src/lib/themes ./dist