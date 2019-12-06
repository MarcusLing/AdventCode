module ImportInput;

import std.stdio, std.net.curl;

class ImportInput {

    private const string _url;
    private const string _session;

    this(string url, string session) {
        _url = url;
        _session = session;
    }

    ~this() {
    }


    void getInput(){
        string cookie = "session=";
        cookie ~= _session;
        auto client = HTTP(_url);
        client.setCookie(cookie);
        client.onReceive = (ubyte[] data)
        {
            writeln("Got data", cast(string)data);
            return data.length;
        };
        client.perform();
    }


}

