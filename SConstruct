import os
import sys
from os.path import join;

def GetCompiler(env):
  compiler = env['CXX']

  # resolve envvar if it refers to another
  while compiler[0] == '$':
    compiler = env[compiler[1:]];

  return compiler

vars = Variables(None, ARGUMENTS)
vars.Add('RELEASE', default=0)
env = Environment(variables=vars, tools = ['mingw'], CPPDEFINES={'RELEASE_BUILD': '${RELEASE}'}, ENV = os.environ)

release = bool(ARGUMENTS['RELEASE'])
buildResult = env.Program('wx-config-win.cpp')

env.Append(CPPDEFINES = ["NDEBUG"])

compilerIsVC = (GetCompiler(env) == "cl")

if compilerIsVC:
  if not release:
    env.Append(CXXFLAGS = ["/Zi"])
    env.Append(CXXFLAGS = ["/RTCcsu", "/GS"]) # generate stack corruption checks
    env.Append(CXXFLAGS = ["/MDd"]);
    env.Append(LINKFLAGS = ["/debug"]);
  else:
    env.Append(CXXFLAGS = ["/MD"]);
    env.Append(CXXFLAGS = ["/O2", "/GR-"]);
    env.Append(CXXFLAGS = ["/EHsc"]);
    env.Append(LINKFLAGS = ["/release", "/OPT:REF", "/OPT:ICF=64"]);
else:
  if not release:
    env.Append(CXXFLAGS = ["-g3"]);
  else:
    env.Append(CXXFLAGS = ["-s", "-Os", "-fno-rtti", "-ffunction-sections", "-fdata-sections"]);
    env.Append(LINKFLAGS = ["-flto", "-Wl,-gc-sections"]);
    env.AddPostAction(buildResult, 'strip --strip-all ${TARGET}')
