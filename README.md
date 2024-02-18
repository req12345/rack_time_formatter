This is rack application "Time formatter". Application return unknkonw time fomats if you send unknonwn format. Valid formats:  year, month, day, hour, minute, second.
Apllication return formatted time, runtime header, logging request and return errors.

Use `rackup` command from root directory to start Application.

Send requests via browser or http client:

Exmaple via browser: http://localhost:9292/time?format=year,month,day,hour,minute,second

Exmaple via curl: `curl http://127.0.0.1:9292/time?format=year,month,day,hour,minute,second -i`




