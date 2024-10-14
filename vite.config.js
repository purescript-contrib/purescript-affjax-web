import * as path from "node:path";
// import * as fs from 'node:fs'
// import * as yaml from 'js-yaml'

// Read and parse the YAML file
// const spagoYamlFilePath = path.resolve(__dirname, 'spago.yaml');
// const spagoYamlFileContent = fs.readFileSync(spagoYamlFilePath, 'utf8');
// const data = yaml.load(spagoYamlFileContent);

export default {
  // Why base is empty?
  //
  // if undefined - it outputs
  //
  //   <script type="module" crossorigin src="/assets/index-gxVfuqPj.js"></script>
  //   <link rel="stylesheet" crossorigin href="/assets/index-CyNfkOrK.css" />
  //
  // if "" - changes to relative paths
  //
  //   <script type="module" crossorigin src="./assets/index-gxVfuqPj.js"></script>
  //   <link rel="stylesheet" crossorigin href="./assets/index-CyNfkOrK.css" />
  // base: `/${data.package.publish.location.githubRepo}/`,
  base: ``,

  root: path.resolve(__dirname, "browser"),
  build: {
    outDir: path.resolve(__dirname, "dist"),
    minify: false, // for debug
    emptyOutDir: true, // prevent `outDir .../dist is not inside project root and will not be emptied.`
  },
  // mode: 'development', // still be minimified, option used if You want to `vite dev` (with a watching)
  resolve: {
    alias: {
      // PureScript: process.env.NODE_ENV === "production"
      //   ? path.resolve(__dirname, "output-es")
      //   : path.resolve(__dirname, "output"),
      node_modules: path.resolve(__dirname, "node_modules"),
      PureScript: path.resolve(__dirname, "output"),
    },
  }
};
