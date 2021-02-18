# chrome binary is usually at /opt/google/chrome
# take a screenshot (more flags https://source.chromium.org/chromium/chromium/src/+/master:headless/app/headless_shell_switches.cc)
./chrome --headless --hide-scrollbars --timeout=4000 --window-size=1920,3500 --screenshot=/tmp/test.png http://localhost:3000/referal

# get DOM html
./chrome --headless --disable-gpu --dump-dom https://www.chromestatus.com/

# get body height
echo -e 'document.body.clientHeight\nquit\n' | ./chrome --headless --repl http://localhost:3000 | grep -oE 'value\"\:([0-9]{1,})' | head -1


# in feb 2021 no funnpage screenshot option available
# so we need to make some comples stuff to get it work
./chrome --headless --hide-scrollbars --timeout=4000 --window-size="1920,$(echo -e 'document.body.clientHeight\nquit\n' | ./chrome --headless --repl http://localhost:3000)" --screenshot=/tmp/test.png http://localhost:3000/referal
