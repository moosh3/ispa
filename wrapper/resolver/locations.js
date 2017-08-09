import request from "superagent-bluebird-promise";

import config from "../../config";

export function loadLocations() {
    console.log("loadLocations()");
    return request
        .get(`${config.server}/locations/`)
        .auth(config.username, config.password)
        .then(res => res.body.data);
}

export function loadLocation(id) {
    console.log(`loadLocation(${id})`);
    return request
        .get(`${config.server}/locations/${id}/`)
        .auth(config.username, config.password)
        .then(res = res.body);
}
