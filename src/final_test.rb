require 'rainbow/refinement'
using Rainbow

class FinalTest
  def initialize(data)
    @data = data
  end

  def success?
    true
  end

  def pretty
    "Total run: #{@data[:succeeded] + @data[:failed] + @data[:notRun]} \n" +
    "#{"Succeeded".green}: #{@data[:succeeded]} \n" +
    "#{"Failed".red}: #{@data[:failed"]} \n" +
    "#{"Not run".white}: #{@data[:notRun]} \n" +
    "#{"Total Time"}: #{@data[:totalDuration]} \n"
  end
end
