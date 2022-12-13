
const baseUrl = 'https://api.monoservices.net';
const version = '/v1';
const authentication = '/auth';
const services = '/services';
const requests = '/requests';
//'https://api.monoservices.net/v1/auth/login'
const loginAuth = baseUrl + version + authentication + '/login';
//https://api.monoservices.net/v1/auth/register
const register = baseUrl + version + authentication + '/register';
//https://api.monoservices.net/v1/services?limit=100&per_page=3&filter[category.name]=Interior Design&sort=-created_at&keyword=Service&filter[city.name]
const getAllservices = baseUrl +
    '/services?' +
    'limit=100&per_page=3&filter[category.name]=Interior Design&sort=-created_at&keyword=Service&filter[city.name]';
//https://api.monoservices.net/v1/services/add
const addService = baseUrl + version + services + '/add';
//https://api.monoservices.net/v1/my-services
const getMyservices = baseUrl + version + '/my-services';
//https://api.monoservices.net/v1/categories
const getAllcategories = baseUrl + version + '/categories';
//https://api.monoservices.net/v1/categories/1/services
const getCategoryservices = baseUrl + version + '/categories' + '/1' + services;
//https://api.monoservices.net/v1/requests/request
const requestAservise = baseUrl + version + requests + '/request';
//https://api.monoservices.net/v1/my-requests
const myRequest = baseUrl + version + '/my-requests';
//https://api.monoservices.net/v1/requests/update_request_status
const updateRwqueststatus =
    baseUrl + version + requests + '/update_request_status';
//https://api.monoservices.net/v1/cities/
const getAllcities = baseUrl + version + '/cities/';
