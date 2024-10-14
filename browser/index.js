/* global mocha, describe, it */
//
// cannot import commonjs, added
// <script type="module" src="node_modules/mocha/mocha.js"></script>
//
// import mocha from "mocha"
// import mocha from "mocha/browser-entry.js"
// import "mocha"

import { main } from 'PureScript/Test.Main/index.js'

mocha.setup("bdd");
main();
mocha.run();
