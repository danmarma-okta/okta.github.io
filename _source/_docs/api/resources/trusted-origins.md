---
layout: docs_page
title: Trusted Origins
---

# Trusted Origins API

The Okta Trusted Origins API provides operations to manage trusted origins and sources.

Trusted Origin URLs may be leveraged to redirect users to custom screens or enable browser-based applications to access Okta APIs from Javascript (CORS).



## Trusted Origins API Operations

### Create Trusted Origin
{:.api .api-operation}

{% api_operation post /api/v1/trustedOrigins %}

Creates a new Trusted Origin

#### Valid Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X POST
-H "Accept: application/json"\
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
-d '
{
    "name": "New Trusted Origin",
    "origin": "http://example.com",
    "scopes": [
        {
            "type": "CORS",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        },
        {
            "type": "REDIRECT",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        }
    ]
}' "https://{yourOktaDomain}.com/api/v1/trustedOrigins"
~~~

#### Successful Response Example
{:.api .api-response .api-response-example}
~~~json
{
    "id": "tos10hu7rkbtrFt1M0g4",
    "name": "New Trusted Origin",
    "origin": "http://example.com",
    "scopes": [
        {
            "type": "CORS",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        },
        {
            "type": "REDIRECT",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        }
    ],
    "status": "ACTIVE",
    "created": "2018-01-13T01:11:44.000Z",
    "createdBy": "00ut5t92p6IEOi4bu0g3",
    "lastUpdated": "2018-01-13T01:11:44.000Z",
    "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
    "_links": {
        "self": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hu7rkbtrFt1M0g4",
            "hints": {
                "allow": [
                    "GET",
                    "PUT",
                    "DELETE"
                ]
            }
        },
        "deactivate": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hu7rkbtrFt1M0g4/lifecycle/deactivate",
            "hints": {
                "allow": [
                    "POST"
                ]
            }
        }
    }
}
~~~

#### Invalid Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X POST
-H "Accept: application/json"\
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
-d '
{
    "name": "Trusted Origin with Invalid Origin Value",
    "origin": "example.com",
    "scopes": [
        {
            "type": "CORS",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        },
        {
            "type": "REDIRECT",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        }
    ]
}
' "https://{yourOktaDomain}.com/api/v1/trustedOrigins"
~~~

#### Unsuccessful Response Example
{:.api .api-response .api-response-example}
~~~json
{
    "errorCode": "E0000001",
    "errorSummary": "Api validation failed: origin",
    "errorLink": "E0000001",
    "errorId": "oaeHRVRe-oQQWChradByNOnHg",
    "errorCauses": [
        {
            "errorSummary": "origin: Origin value is not valid"
        }
    ]
}
~~~

### Get Trusted Origin
{% api_operation get /api/v1/trustedOrigins/*:trustedOriginId* %}

Gets a Trusted Origin by id

#### Request Parameters
{:.api .api-request .api-request-params}

Parameter | Description              | Param Type | DataType | Required |
--------- | ------------------------ | ---------- | -------- | -------- |
id        | `id` of a Trusted Origin | URL        | String   | Yes      |

#### Response Parameters
{:.api .api-response .api-response-params}

[Trusted Origin Object](#trusted-origin-model)

#### Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X GET \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
"https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3"
~~~

#### Response Example
~~~json
    {
        "id": "tosue7JvguwJ7U6kz0g3",
        "name": "Example Trusted Origin",
        "origin": "http://example.com",
        "scopes": [
            {
                "type": "CORS",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            },
            {
                "type": "REDIRECT",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            }
        ],
        "status": "ACTIVE",
        "created": "2017-12-16T05:01:12.000Z",
        "createdBy": "00ut5t92p6IEOi4bu0g3",
        "lastUpdated": "2017-12-16T05:01:12.000Z",
        "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
        "_links": {
            "self": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3",
                "hints": {
                    "allow": [
                        "GET",
                        "PUT",
                        "DELETE"
                    ]
                }
            },
            "deactivate": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3/lifecycle/deactivate",
                "hints": {
                    "allow": [
                        "POST"
                    ]
                }
            }
        }
    }
~~~

### List Trusted Origins
{% api_operation get /api/v1/trustedOrigins %}

Lists all Trusted Origins

A subset of Trusted Origins can be returned that match a supported filter expression or query criteria.

##### Request Parameters
{:.api .api-request .api-request-params}

- [List All Trusted Origins](#list-all-trusted-origins) (no parameters)
- [List Trusted Origins with a Filter](#list-trusted-origins-with-a-filter) (`filter`)

| Parameter  | Description                                                                                                                                     | Param Type | DataType | Required |
|:-----------|:------------------------------------------------------------------------------------------------------------------------------------------------|:-----------|:---------|:---------|
| filter     | [Filter](/docs/api/getting_started/design_principles.html#filtering) Trusted Origins with a supported expression for a subset of properties     | Query      | String   |    No    |
| limit      | Specifies the number of results returned                                                                                                        | Query      | Integer  |    No    |

##### Response Parameters
{:.api .api-response .api-response-params}

Array of [Trusted Origins](#trusted-origin-model)

#### List All Trusted Origins
{:.api .api-operation}

Returns a list of all Trusted Origins

##### Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X GET \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
"https://{yourOktaDomain}.com/api/v1/trustedOrigins"
~~~

##### Response Example
{:.api .api-response .api-response-example}
~~~json
[
    {
        "id": "tosue7JvguwJ7U6kz0g3",
        "name": "Example Trusted Origin",
        "origin": "http://example.com",
        "scopes": [
            {
                "type": "CORS",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            }
        ],
        "status": "ACTIVE",
        "created": "2018-01-13T01:22:10.000Z",
        "createdBy": "00ut5t92p6IEOi4bu0g3",
        "lastUpdated": "2018-01-13T01:22:10.000Z",
        "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
        "_links": {
            "self": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3",
                "hints": {
                    "allow": [
                        "GET",
                        "PUT",
                        "DELETE"
                    ]
                }
            },
            "deactivate": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3/lifecycle/deactivate",
                "hints": {
                    "allow": [
                        "POST"
                    ]
                }
            }
        }
    },
    {
        "id": "tos10hzarOl8zfPM80g4",
        "name": "Another Trusted Origin",
        "origin": "https://rf.example.com",
        "scopes": [
            {
                "type": "CORS",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            },
            {
                "type": "REDIRECT",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            }
        ],
        "status": "ACTIVE",
        "created": "2017-12-16T05:01:12.000Z",
        "createdBy": "00ut5t92p6IEOi4bu0g3",
        "lastUpdated": "2017-12-16T05:01:12.000Z",
        "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
        "_links": {
            "self": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4",
                "hints": {
                    "allow": [
                        "GET",
                        "PUT",
                        "DELETE"
                    ]
                }
            },
            "deactivate": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4/lifecycle/deactivate",
                "hints": {
                    "allow": [
                        "POST"
                    ]
                }
            }
        }
    },
    {
        "id": "tos10i0nu9m7pAlJQ0g4",
        "name": "Yet Another Trusted Origin",
        "origin": "http://yato.example.com",
        "scopes": [
            {
                "type": "CORS",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            },
            {
                "type": "REDIRECT",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            }
        ],
        "status": "ACTIVE",
        "created": "2018-01-13T01:48:32.000Z",
        "createdBy": "00ut5t92p6IEOi4bu0g3",
        "lastUpdated": "2018-01-13T01:48:32.000Z",
        "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
        "_links": {
            "self": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10i0nu9m7pAlJQ0g4",
                "hints": {
                    "allow": [
                        "GET",
                        "PUT",
                        "DELETE"
                    ]
                }
            },
            "deactivate": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10i0nu9m7pAlJQ0g4/lifecycle/deactivate",
                "hints": {
                    "allow": [
                        "POST"
                    ]
                }
            }
        }
    }
]
~~~

#### List Trusted Origins with a Filter
{:.api .api-operation}

Lists all Trusted Origins that match the filter criteria

This operation requires [URL encoding](/docs/api/getting_started/design_principles.html#filtering). For example, `filter=(id eq "tosue7JvguwJ7U6kz0g3" or id eq "tos10hzarOl8zfPM80g4")` is encoded as `filter=%28id+eq+%22tosue7JvguwJ7U6kz0g3%22+or+id+eq+%22tos10hzarOl8zfPM80g4%22%29`.

See [Filtering](/docs/api/getting_started/design_principles.html#filtering) for more information about the expressions used in filtering.

##### Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X GET \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
"https://{yourOktaDomain}.com/api/v1/trustedOrigins/?limit=100&filter=%28id+eq+%22tosue7JvguwJ7U6kz0g3%22+or+id+eq+%22tos10hzarOl8zfPM80g4%22%29"
~~~

##### Response Example
{:.api .api-response .api-response-example}
~~~json
[
    {
        "id": "tosue7JvguwJ7U6kz0g3",
        "name": "Example Trusted Origin",
        "origin": "http://example.com",
        "scopes": [
            {
                "type": "CORS",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            }
        ],
        "status": "ACTIVE",
        "created": "2018-01-13T01:22:10.000Z",
        "createdBy": "00ut5t92p6IEOi4bu0g3",
        "lastUpdated": "2018-01-13T01:22:10.000Z",
        "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
        "_links": {
            "self": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3",
                "hints": {
                    "allow": [
                        "GET",
                        "PUT",
                        "DELETE"
                    ]
                }
            },
            "deactivate": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3/lifecycle/deactivate",
                "hints": {
                    "allow": [
                        "POST"
                    ]
                }
            }
        }
    },
    {
        "id": "tos10hzarOl8zfPM80g4",
        "name": "Another Trusted Origin",
        "origin": "https://rf.example.com",
        "scopes": [
            {
                "type": "CORS",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            },
            {
                "type": "REDIRECT",
                "params": {
                    "sampleNum": 17,
                    "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                    "sampleBool": true
                }
            }
        ],
        "status": "ACTIVE",
        "created": "2017-12-16T05:01:12.000Z",
        "createdBy": "00ut5t92p6IEOi4bu0g3",
        "lastUpdated": "2017-12-16T05:01:12.000Z",
        "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
        "_links": {
            "self": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4",
                "hints": {
                    "allow": [
                        "GET",
                        "PUT",
                        "DELETE"
                    ]
                }
            },
            "deactivate": {
                "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4/lifecycle/deactivate",
                "hints": {
                    "allow": [
                        "POST"
                    ]
                }
            }
        }
    }
]
~~~

### Update Trusted Origin
{:.api .api-operation}

{% api_operation put /api/v1/trustedOrigins/*:trustedOriginId* %}

Updates an existing Trusted Origin

#### Request Parameters
{:.api .api-request .api-request-params}

Parameter | Description              | Param Type | DataType | Required |
--------- | ------------------------ | ---------- | -------- | -------- |
id        | `id` of a Trusted Origin | URL        | String   | Yes      |

#### Response Parameters
{:.api .api-response .api-response-params}

[Trusted Origin Object](#trusted-origin-model)

#### Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X PUT
-H "Accept: application/json"\
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
-d '
{
    "id": "tosue7JvguwJ7U6kz0g3",
    "name": "Updated Example Trusted Origin",
    "origin": "http://updated.example.com",
    "scopes": [
        {
            "type": "CORS",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        },
        {
            "type": "REDIRECT",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        }
    ],
    "status": "ACTIVE",
    "created": "2017-12-16T05:01:12.000Z",
    "createdBy": "00ut5t92p6IEOi4bu0g3",
    "lastUpdated": "2017-12-16T05:01:12.000Z",
    "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
    "_links": {
        "self": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3",
            "hints": {
                "allow": [
                    "GET",
                    "PUT",
                    "DELETE"
                ]
            }
        },
        "deactivate": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3/lifecycle/deactivate",
            "hints": {
                "allow": [
                    "POST"
                ]
            }
        }
    }
}
' "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3"
~~~

#### Response Example
{:.api .api-response .api-response-example}
~~~json
{
    "id": "tosue7JvguwJ7U6kz0g3",
    "name": "Updated Example Trusted Origin",
    "origin": "http://updated.example.com",
    "scopes": [
        {
            "type": "CORS",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        },
        {
            "type": "REDIRECT",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        }
    ],
    "status": "ACTIVE",
    "created": "2017-12-16T05:01:12.000Z",
    "createdBy": "00ut5t92p6IEOi4bu0g3",
    "lastUpdated": "2018-01-17T21:25:40.000Z",
    "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
    "_links": {
        "self": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3",
            "hints": {
                "allow": [
                    "GET",
                    "PUT",
                    "DELETE"
                ]
            }
        },
        "deactivate": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3/lifecycle/deactivate",
            "hints": {
                "allow": [
                    "POST"
                ]
            }
        }
    }
}
~~~

### Activate Trusted Origin
{:.api .api-operation}

{% api_operation post /api/v1/trustedOrigins/*:trustedOriginId*/lifecycle/activate %}

Activate an existing Trusted Origin

#### Request Parameters
{:.api .api-request .api-request-params}

Parameter | Description              | Param Type | DataType | Required |
--------- | ------------------------ | ---------- | -------- | -------- |
id        | `id` of a Trusted Origin | URL        | String   | Yes      |

#### Response Parameters
{:.api .api-response .api-response-params}

[Trusted Origin Object](#trusted-origin-model)

#### Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X POST
-H "Accept: application/json"\
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
"https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4/lifecycle/activate"
~~~

#### Response Example
{:.api .api-response .api-response-example}
~~~json
{
    "id": "tos10hzarOl8zfPM80g4",
    "name": "Another Trusted Origin",
    "origin": "https://rf.example.com",
    "scopes": [
        {
            "type": "CORS",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        }
    ],
    "status": "ACTIVE",
    "created": "2018-01-13T01:22:10.000Z",
    "createdBy": "00ut5t92p6IEOi4bu0g3",
    "lastUpdated": "2018-01-18T01:07:28.000Z",
    "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
    "_links": {
        "self": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4",
            "hints": {
                "allow": [
                    "GET",
                    "PUT",
                    "DELETE"
                ]
            }
        },
        "deactivate": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4/lifecycle/deactivate",
            "hints": {
                "allow": [
                    "POST"
                ]
            }
        }
    }
}
~~~

### Deactivate Trusted Origin
{:.api .api-operation}

{% api_operation post /api/v1/trustedOrigins/*:trustedOriginId*/lifecycle/deactivate %}

Deactivate an existing Trusted Origin

#### Request Parameters
{:.api .api-request .api-request-params}

Parameter | Description              | Param Type | DataType | Required |
--------- | ------------------------ | ---------- | -------- | -------- |
id        | `id` of a Trusted Origin | URL        | String   | Yes      |

#### Response Parameters
{:.api .api-response .api-response-params}

[Trusted Origin Object](#trusted-origin-model)

#### Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X POST
-H "Accept: application/json"\
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
"https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4/lifecycle/deactivate"
~~~

#### Response Example
{:.api .api-response .api-response-example}
~~~json
{
    "id": "tos10hzarOl8zfPM80g4",
    "name": "Another Trusted Origin",
    "origin": "https://rf.example.com",
    "scopes": [
        {
            "type": "CORS",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        }
    ],
    "status": "INACTIVE",
    "created": "2018-01-13T01:22:10.000Z",
    "createdBy": "00ut5t92p6IEOi4bu0g3",
    "lastUpdated": "2018-01-18T01:18:26.000Z",
    "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
    "_links": {
        "activate": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4/lifecycle/activate",
            "hints": {
                "allow": [
                    "POST"
                ]
            }
        },
        "self": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g4",
            "hints": {
                "allow": [
                    "GET",
                    "PUT",
                    "DELETE"
                ]
            }
        }
    }
}
~~~

### Delete Trusted Origin
{:.api .api-operation}

{% api_operation delete /api/v1/trustedOrigins/*:trustedOriginId* %}

Delete an existing Trusted Origin

#### Request Parameters
{:.api .api-request .api-request-params}

Parameter | Description              | Param Type | DataType | Required |
--------- | ------------------------ | ---------- | -------- | -------- |
id        | `id` of a Trusted Origin | URL        | String   | Yes      |

#### Response Parameters
{:.api .api-response .api-response-params}

[Trusted Origin Object](#trusted-origin-model)

#### Request Example
{:.api .api-request .api-request-example}
~~~sh
curl -X DELETE
-H "Accept: application/json"\
-H "Content-Type: application/json" \
-H "Authorization: SSWS ${api_token}" \
"https://{yourOktaDomain}.com/api/v1/trustedOrigins/tos10hzarOl8zfPM80g3"
~~~

#### Response Example
{:.api .api-response .api-response-example}

Returns an empty object.

Passing an invalid Trusted Origin ID returns a `404 Not Found` status code with error code `E0000007`.

## Trusted Origin Model
{: #trusted-origin-model }

### Trusted Origin Properties

A Trusted Origin defines several attributes:

|Field Name    | Description                                                | Data Type                               | Required      | Max Length      |
|:-------------|:-----------------------------------------------------------|:----------------------------------------|:--------------|:----------------|
|id            | Unique identifier for this Trusted Origin                  | String                                  | No (Assigned) | N/A             |
|name          | Unique name for this Trusted Origin                        | String                                  | Yes           | 255 (chars)     |
|origin        | Unique origin URL for this Trusted Origin                  | String                                  | Yes           | 255 (chars)     |
|scopes        | Array of scope types for which this Trusted Origin is used | Array of [Scope Objects](#scope-object) | Yes           | 2 (scope types) |

#### Scope Object

Each scope object specifies the type of scope for which its Trusted Origin is used, as well a params object. 

|Field Name | Description                                                  | Data Type                       | Required |
|:----------|:-------------------------------------------------------------|:--------------------------------|:---------|
|type       | Type of the scope: either "CORS" or "REDIRECT"               | String                          |   Yes    |
|params     | Params object specifying params to include, and their values | [Params Object](#params-object) |   No     |

#### Scope Object Example (CORS)
~~~json
{
    "type": "CORS",
    "params": {
        "allowCredentials": true,
        "maxAge": 72
    }
}
~~~

#### Scope Object Example (REDIRECT)
~~~json
{
    "type": "REDIRECT",
    "params": {
        "sampleNum": 17,
        "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
        "sampleBool": true
    }
}
~~~

##### Params Object

Each params object specifies the params to include with the Trusted Origin base URL, as well as their values.

##### Params Object Example
~~~json
{
    "activateFeature": true,
    "sessionLifetime": 3600,
    "nestedRedirectUri": "https://goto.example.com"
}
~~~

### Trusted Origin Example
~~~json
{
    "id": "tosue7JvguwJ7U6kz0g3",
    "name": "Example Trusted Origin",
    "origin": "http://example.example.com",
    "scopes": [
        {
            "type": "CORS",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        },
        {
            "type": "REDIRECT",
            "params": {
                "sampleNum": 17,
                "sampleStr": "b201cb59-acbd-4600-80e4-cc165eeb4831",
                "sampleBool": true
            }
        }
    ],
    "status": "ACTIVE",
    "created": "2017-12-16T05:01:12.000Z",
    "createdBy": "00ut5t92p6IEOi4bu0g3",
    "lastUpdated": "2018-01-17T21:25:40.000Z",
    "lastUpdatedBy": "00ut5t92p6IEOi4bu0g3",
    "_links": {
        "self": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3",
            "hints": {
                "allow": [
                    "GET",
                    "PUT",
                    "DELETE"
                ]
            }
        },
        "deactivate": {
            "href": "https://{yourOktaDomain}.com/api/v1/trustedOrigins/tosue7JvguwJ7U6kz0g3/lifecycle/deactivate",
            "hints": {
                "allow": [
                    "POST"
                ]
            }
        }
    }
}
~~~
