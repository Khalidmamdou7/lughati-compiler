const express = require('express');
var cors = require('cors')
const app = express();
const exec = require('child-process-promise').exec
app.use(cors());

app.use(express.urlencoded( {extended: true} ))
app.get('/', async (req, res)  =>{
    const cmd = req.query.cmd
    const cmd_2 = req.query.cmd_2
    const out = await exec(cmd)
    const out_2 = await exec(cmd_2)
    let data = out.stdout + out.stderr;
    console.log(data);
    res.send(data)
})

const server = app.listen(8000, function () {
    const host = "localhost";
    const port = 8000;
    console.log("App listening at http://%s:%s", host, port)
});
