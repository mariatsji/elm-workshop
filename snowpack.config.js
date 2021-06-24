// Snowpack Configuration File
// See all supported options: https://www.snowpack.dev/reference/configuration

const fg = require('fast-glob');

function excludeEverythingButEntryPoints(entryPoints) {
    if (process.env.NODE_ENV === 'development') return [];

    if (!Array.isArray(entryPoints)) entryPoints = [entryPoints];

    // If our main entry points are in nested subfolders of 'src/', we can instead use
    // `fg.sync('src/**/*.elm')` and remove the `concat('**/*/*.elm')`.
    return fg
        .sync('src/*.elm', {
            ignore: entryPoints.map((v) => `src/${v}`),
        })
        .map((v) => v.replace(/^src\//, '**/'))
        .concat('**/*/*.elm');
}

/** @type {import("snowpack").SnowpackUserConfig } */
module.exports = {
    mount: {
        "src": "/_dist_",
        "public": "/"
    },
    exclude: excludeEverythingButEntryPoints('Main.elm'),
    plugins: [["snowpack-plugin-elm"]],
    devOptions: {port: 3000},
};
