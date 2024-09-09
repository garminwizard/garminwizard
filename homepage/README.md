# Website

This website is built using [Docusaurus](https://docusaurus.io/), a modern static website generator. Note that you need node version 18 or higher to build docusaurus. If you have installed the node version manager, you can change the version with f.ex. `nvm use 18` to use version 18.

To run locally, inside the garminwizard-homepage directory, type
`npm run start``

To build the web page, type
`npm run build`

The content in the build directory can then be uploaded to a web server.

# Garmin products database

Use a C# console app to download the Garmin products and specifications. The source code is in the [Garmin repository](https://github.com/garminwizard/garmin). There, you will find instructions on how to create a products.db sqlite3 file that contains all the products and specification for all the Garmin watches.

# Sqlite3 WASM (Web Assembly)
While in the root directory of Docusaurus, install the sqlite3 WASM plugin with npm install. NB!

`npm install sql.js`

Then copy the `sql-wasm.js` and `sql-wasm.wasm` files from the `node_modules/sql.js/dist` to the `static/garmin` directory.

# Garmin wizard script

The code for the Garmin wizard is in the `static/garmin/garminscript.js`file. And the styles necessary are in the ´static/garmin/garminstyles.css` file.

# Load the wizard

Docusaurus loads content asynchrounously. This means we cannot run the wizard before the page is ready. To obtain this we must plugin to the Docusaurs [getClientModules lifecycle](https://docusaurus.io/docs/api/plugin-methods/lifecycle-apis#getClientModules). 

The plugin is defined in the `index.js` file inside the `garmin-plugin-script` directory. It specifies that it should load the client module `garminrouteupdates.js` which is also in the `garmin-plugin-script` directory.

When you access the `garminwizard.md` file, `onRouteDidUpdate` in `garminrouteupdates.js` will call the  `startGarminWizard` method defined in `garminscript.js`.