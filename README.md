  This is rack application "Time formatter". Apllication return formatted time, runtime header, logging request and return errors, unknown time formats and wrong path. 

  Valid formats:  year, month, day, hour, minute, second.

  Use `rackup` command from root directory to start Application.

  Send requests via browser or http client:

  Exmaple via browser: http://localhost:9292/time?format=year,month,day,hour,minute,second

  Exmaple via curl: `curl http://127.0.0.1:9292/time?format=year,month,day,hour,minute,second -i`




