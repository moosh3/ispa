import request from "superagent-bluebird-promise";

import config from "../../config";

export function fetchEvents() {
    console.log("fetchEvents()");
    return request
        .get(`${config.server}/events/`)
        .auth(config.username, config.password)
        .then(res => res.body.data);
}

export function fetchEvent(id) {
    console.log(`fetchEvent(${id})`);
    return request
        .get(`${config.server}/events/${id}/`)
        .auth(config.username, config.password)
        .then(res => res.body);
}
