#!/usr/bin/env ruby

require './utils'

p RouterFingerprint.match( '*.*.*.*', 8080 )
