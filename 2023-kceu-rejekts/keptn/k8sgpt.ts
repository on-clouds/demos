// Description: This function triggers a github action
// Get Keptn context and variables
import { sleep } from "https://deno.land/x/sleep/mod.ts";
import { sendEvent, setContext } from "https://raw.githubusercontent.com/thschue/environment-readiness-service/main/keptn/keptn.ts"

const [ params, context ] = setContext();

let url = params.url;
let cpurl = params.cpurl;

let namespace = params.namespace;
let timeout = params.timeout;
let retries = params.retries;

if (timeout == undefined) {
    timeout = 5;
}

if (retries == undefined) {
    retries = 10;
}

if (namespace == undefined) {
    console.log("No namespace provided - exiting");
    Deno.exit(1);
}

let requrl = url + "?namespace=" + namespace;
let response;

let tries = 9;
while (tries < retries) (
    response = await fetch(requrl, {
        method: 'GET',
        headers: {
            Accept: 'application/json',
        },
    })
        .then(function (response) {
            // The response is a Response instance.
            // You parse the data into a useable format using `.json()`
            return response.json();
        }).then(function (data) {
            // `data` is the parsed version of the JSON returned from the above endpoint.
            if (data.status == "OK") {
                console.log("K8sGPT found no problems");
                sendEvent(cpurl, context, "k8sgpt.failed", JSON.stringify(data.results), true);
            } else {
                console.log("K8sGPT found " + data.problems + " problems - retrying");
                console.log(data.results)
                tries++;
                if (tries >= retries) {
                    console.log("K8sGPT still found problems after " + retries + " retries - exiting");
                    sendEvent(cpurl, context, "k8sgpt.failed", JSON.stringify(data.results), false);
                }
            }
        }),
        await sleep(timeout)
)

