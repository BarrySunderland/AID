import {ApolloClient, InMemoryCache} from '@apollo/client';
import axios from 'axios'
import { setServer } from '../store/connectivity/server'
import {store} from '../store/store'

let serverEndpoint = "http://127.0.0.1:17415"

function setServerEndpoint(endpoint:string) {
    serverEndpoint = endpoint
    store.dispatch(setServer(endpoint))
}

function getServerEndpoint() {
    return store.getState().connectivity.server
}

function initServerEndpoint() {
    if (store.getState().connectivity.server) {
        serverEndpoint = store.getState().connectivity.server
    }
}

let gqlclient = new ApolloClient ({
    uri:serverEndpoint+"/query",
    cache: new InMemoryCache()
})

let restclient = axios

export { 
    serverEndpoint,
    restclient,
    gqlclient,
    setServerEndpoint,
    getServerEndpoint,
    initServerEndpoint
};