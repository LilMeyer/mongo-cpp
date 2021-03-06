import os, sys, glob

taget_dir = 'build'

# build mode (debug/release; default to release)
build_mode = ARGUMENTS.get('mode', 'release')

if build_mode not in ['debug', 'release']:
    sys.stderr.write('Oh noes: only "debug" and "release" build modes are supported\n')
    Exit(1)

print 'Build mode: ' + build_mode


# C++ flags and defines
ccflags = [
    '-std=c++11',
    '-Wall',
    '-pedantic-errors',
    '-Wfatal-errors', # stop at the first error
    '-I/usr/local/include/mongocxx/v0.0',
    '-I/usr/local/include/libmongoc-1.0',
    '-I/usr/local/include/bsoncxx/v0.0',
    '-I/usr/local/include/libbson-1.0',
    '-L/usr/local/lib'
]

cppdefines = []

if build_mode == 'debug':
    ccflags += ['-g', '-O0']
    cppdefines += ['_DEBUG']
elif build_mode == 'release':
    ccflags += ['-O2']
    cppdefines += ['NDEBUG']

# this is to allow colorgcc
custom_env = {
    'PATH': os.environ['PATH'],
    'TERM': os.environ['TERM'],
    'HOME': os.environ['HOME'],
}

# create root environment
env = Environment(CCFLAGS=ccflags,
                       CPPDEFINES=cppdefines,
                       ENV=custom_env,
                       CPPPATH=['#/include'])

# custom C++ compiler
if 'CXX' in os.environ:
    env['CXX'] = os.environ['CXX']

Export('env', 'build_mode')

# library and tests
# lib = SConscript(os.path.join('src', 'SConscript'))

libs = [
    'cppunit',
    'boost_system',
    'mongocxx',
    'bsoncxx'
]

# files = glob.glob('src/core/*_test.cpp')

# for file in files:
#     t = env.Program(target=file[9:-4], source=[file], LIBS=libs)

t = env.Program(target='hellomongo', source=['hellomongo.cpp'], LIBS=libs)
