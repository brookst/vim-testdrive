function testdrive#providers#nose#detect()
  return glob('*_tests.py').glob('test/*_tests.py').glob('tests/*_tests.py')
endfunction


function testdrive#providers#nose#get_command()
  return 'nosetests -dq'
endfunction


function testdrive#providers#nose#get_errorformat(cmd)
  " Error regex list
  let &errorformat=""
  " Begin Error taking %f %l and function name in %m
  let &errorformat.="%E  File \"%f\"\\, line %l\\, in %m,"
  " Unless error isn't in a function
  let &errorformat.="%E  File \"%f\"\\, line %l,"
  " Capture syntax error location with %p
  let &errorformat.="%C%p^,"
  " Capture a raw string describing a test
  let &errorformat.="%C    \"\"\"%m\"\"\","
  let &errorformat.="%C    r\"%m\","
  let &errorformat.="%C    \"%m\","
  " Ignore source lines, since we'll jump to them
  let &errorformat.="%-C  %.%#,"
  " End error
  let &errorformat.="%Z>>%.%#,"
  " Capture error type
  let &errorformat.="%C%m,"
  " Ignore presentation details
  let &errorformat.="%-G%.%#"

  " TODO: Look at catching or jumping to the last line of the traceback
endfunction

" vim: set ts=2 sw=2 sts=2 et:
