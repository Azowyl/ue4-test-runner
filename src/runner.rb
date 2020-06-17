require_relative './parser'

module UE4TestRunner
  UE4_ROOT = "A:/Games/UE_4.23"
  EXECUTABLE_LOCATION = "/Engine/Binaries/Win64/UE4Editor-Cmd.exe"
  FLAGS = '-unattended -nopause -NullRHI -testexit="Automation Test Queue Empty" -log -log=RunTests.log'

  def run
    puts "Running tests..."
    system(build_command)

    tests = Parser::parse("#{current_directory}/index.json")
    tests.each {|test| puts test.pretty}
  end

  def build_command
    "#{UE4_ROOT}#{EXECUTABLE_LOCATION} #{project_file_path} #{FLAGS} #{tests_command} #{report_outputh_path}"
  end

  def project_file_path
    Dir.entries(".").select {|file_name| file_name.include?('.uproject')}.first
  end

  def tests_command
    "-ExecCmds=\"Automation RunTests #{tests_to_run}\""
  end

  def tests_to_run
    ARGV[0]
  end

  def report_outputh_path
    "-ReportOutputPath=\"#{current_directory}\""
  end

  def current_directory
    File.expand_path(File.dirname(__FILE__))
  end
end