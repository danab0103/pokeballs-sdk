sub init()
    m.top.functionName = "getDogData"
end sub

sub getDogData()
    endpoint = "https://dog.ceo/api/breeds/image/random"
    requestResult = fetchData(endpoint)

    dogData = parseJson(requestResult)

    buildDogContent(dogData)
end sub

sub buildDogContent(dogData as object)
    if dogData.status = "success"
        dogContentNode = CreateObject("roSGNode", "ContentNode")
        dogContentNode.HDPosterUrl = dogData.message

        m.top.dogContent = dogContentNode
    end if
end sub

function fetchData(endpoint as string) as object
    httpRequest = createHttpRequest(endpoint)

    return executeHttpRequest(httpRequest)
end function

function executeHttpRequest(httpRequest as object) as string
    requestResult = ""
    requestInitiated = httpRequest.AsyncGetToString()

    if requestInitiated
        event = wait(10000, httpRequest.getPort())

        if event = invalid
            print "Request timeout or no response"
        else if type(event) = "roUrlEvent"
            code = event.GetResponseCode()
            responseBody = event.GetString()

            if code = 200 and responseBody <> invalid and responseBody <> "" then requestResult = responseBody
        end if
    end if

    return requestResult
end function

function createHttpRequest(endpoint as string) as object
    httpRequest = CreateObject("roUrlTransfer")
    port = CreateObject("roMessagePort")
    httpRequest.SetUrl(endpoint)
    httpRequest.SetPort(port)
    httpRequest.SetCertificatesFile("common:/certs/ca-bundle.crt")
    httpRequest.AddHeader("X-Roku-Reserved-Dev-Id", "")
    httpRequest.InitClientCertificates()

    return httpRequest
end function
