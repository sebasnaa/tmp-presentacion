const core = require('@actions/core')
const github = require('@actions/github')
// Give some github context values

const exec = require('@actions/exec')

function run() {

    // 1. Get input values
    const bucket = core.getInput('bucket', {required: true})
    const bucketRegion = core.getInput('bucket-region' ,{required: true})
    const distFolder = core.getInput('dist-folder')


    // 2. Upload files
    // AWS CLi is already in the runner
    const s3Uri = `s3://${bucket}`
    exec.exec(`aws s3 sync ${distFolder} ${s3Uri} --region ${bucketRegion}`)



    const webSite = `http://${bucket}.s3-website.${bucketRegion}.amazonaws.com`
    
    
    core.setOutput('webUrl',webSite); // run: echo "step2value=world" >> $GITHUB_OUTPUT

    core.notice('Hello from custom JS')
}

run();
