import request from "superagent-bluebird-promise";

import config from "../../config";

export default function updateLocation(id, data) {
    console.log(`updateLocation(${id})`, data);
    return request
        .put(`${config.server}/events/${id}`)
        .auth(config.username, config.password)
        .send(data)
        .then(res = res.body)
}
