import { sleep } from "https://deno.land/x/sleep/mod.ts";

let params_raw = Deno.env.get("DATA");
let params;

if (params_raw != undefined) {
    params = JSON.parse(params_raw);
}

let response;
let timeout = params.timeout;
let retries = params.retries;

if (timeout == undefined) {
    timeout = 5;
}

if (retries == undefined) {
    retries = 10;
}

let tries = 0;
while (tries < retries) {
    try {
        response = await fetch(params.url);
    } catch (e) {
        console.error("Could not fetch URL");
        tries++;
        await sleep(timeout)
        if (tries >= retries) {
            console.log("Could not fetch URL ready after " + retries + " retries - exiting");
            Deno.exit(1);
        }
        continue

    }
    if (response.status == 200) {
        console.log("Got 200 OK - exiting");
        Deno.exit(0)
    }
    tries++;
}