$:.unshift File.dirname($0)
require 'runner'
include UE4TestRunner

UE4TestRunner::run()
