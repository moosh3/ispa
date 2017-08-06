import request from "superagent-bluebird-promise";

import config from "../../config";

export function fetchLocations() {
    console.log("fetchlocations()");
    return request
        .get(`${config.server}/locations/`)
        .auth(config.username, config.password)
        .then(res => res.body.data);
}

export function fetchLocation(id) {
    console.log(`fetchLocation(${id})`);
    return request
        .get(`${config.server}/locations/${id}/`)
        .auth(config.username, config.password)
        .then(res => res.body);
}
