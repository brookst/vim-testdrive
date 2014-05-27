function testdrive#providers#nose#detect()
  return glob('*_tests.py').glob('test/*_tests.py').glob('tests/*_tests.py')
endfunction


function testdrive#providers#nose#get_command()
  return 'nosetests'
endfunction

" vim: set ts=2 sw=2 sts=2 et:
