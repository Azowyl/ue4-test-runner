require_relative './parser'
require 'fileutils'

module UE4TestRunner
  UE4_ROOT = "A:\\Games\\UE_4.24"
  EXECUTABLE_LOCATION = "\\Engine\\Binaries\\Win64\\UE4Editor-Cmd.exe"
  FLAGS = '-unattended -silent -nopause -NullRHI -testexit="Automation Test Queue Empty" -log -log=RunTests.log'
  MISSING_FILE_ERROR_MESSAGE = "File does not exists D:"
  TEST_RESULT_DIR = 'TestResult'

  def run
    puts "Running tests..."
    system(build_command, :out => File::NULL)
    file_name = "#{current_directory}\\#{TEST_RESULT_DIR}\\index.json"

    puts "#{file_name}: #{MISSING_FILE_ERROR_MESSAGE}" and return unless File.file?(file_name)

    tests = Parser::parse(file_name)
    tests.each {|test| puts test.pretty}

    FileUtils.rm_rf("#{current_directory}#{TEST_RESULT_DIR}")
  end

  def build_command
    "#{UE4_ROOT}#{EXECUTABLE_LOCATION} #{project_file_path} #{FLAGS} #{tests_command} #{report_outputh_path}"
  end

  def project_file_path
    file = Dir.entries(".").select {|file_name| file_name.include?('.uproject')}.first
    File.expand_path(file, File.dirname(file))
  end

  def tests_command
    "-ExecCmds=\"Automation RunTests #{tests_to_run}\""
  end

  def tests_to_run
    ARGV[0]
  end

  def report_outputh_path
    "-ReportOutputPath=\"#{current_directory}\\#{TEST_RESULT_DIR}\""
  end

  def current_directory
    File.expand_path(File.dirname(__FILE__))
  end

end
