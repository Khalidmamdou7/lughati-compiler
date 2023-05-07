const fs = require('fs');
const exec = require('child-process-promise').exec



const createInputFile = async (inputString) => {
    // Create input.txt file and compiler-files directory if they don't exist
    if (!fs.existsSync('./compiler-files')) {
        console.log("Creating compiler-files directory");
        fs.mkdirSync('./compiler-files');
    }
    fs.writeFile('./compiler-files/input.txt', inputString, function (err) {
        if (err) {
            console.log(err);
            return err
        }
        console.log("The file was saved!");
        return "The file was saved!"
    });
}

const runCompiler = async () => {
    const { stdout, stderr } = await exec('cd ../../../ && make run INPUT_FILE=src/gui/backend/compiler-files/input.txt OUTPUT_FILE=src/gui/backend/compiler-files/output.txt')
    if (stderr) {
        console.error(`error: ${stderr}`);
        return stderr
    }
    console.log(`stdout: ${stdout}`);
    return stdout
}

const getOutput = async () => {
    const data = await fs.readFileSync('./compiler-files/output.txt', 'utf8')

    return data
}

module.exports = {
    createInputFile,
    runCompiler,
    getOutput
}