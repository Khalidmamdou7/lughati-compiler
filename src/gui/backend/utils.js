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
    const { stdout, stderr } = await exec(`cd ../../../ && 
        make run INPUT_FILE=src/gui/backend/compiler-files/input.txt OUTPUT_FILE=src/gui/backend/compiler-files/output.txt SYMBOL_TABLE=src/gui/backend/compiler-files/symbolTable.txt
        `)
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

const getSymbolTable = async () => {
    const data = await fs.readFileSync('./compiler-files/symbolTable.txt', 'utf8')
    // Split the data into an array of lines
    const lines = data.split('====================')
    console.log(lines)
    const entries = lines.map(line => {
        if (line === '' || line === '\n') return
        const entry = {}
        const lines = line.split('\n')
        lines.forEach(line => {
            if (line === '') return
            const [key, value] = line.split(': ')
            entry[key] = value
        })
        console.log(entry)
        return entry
    })
    console.log(entries)
    entries.pop()
    return entries
}

module.exports = {
    createInputFile,
    runCompiler,
    getOutput,
    getSymbolTable
}