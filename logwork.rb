require 'date'

class Logwork
  LOG_END = "-end-"
  attr_accessor :filename, :log ,  :logger, :lognumber

  def getlog()
    logs = Array[]
    log = ""
    logger = ""
    lognumber = ""
    File.open(filename, "rb") do |f|
        f.each_line do |line|

            line = line.strip
            if line == LOG_END
                logs.push(lognumber +"|" + log)
            end

            if line.include? "Logger: "
                logger = line.sub "Logger: ", "" 
                next
            end    
            
            if line.include? "log number:"
                lognumber = line.sub "log number:", ""
                next
            end


            if line.include? "Log:" 
                log = line.sub "Log:", ""
	        	log = log.ljust(1)
                next
            end    

            if !line.eql? LOG_END and !line.include? "Logger:" and !line.include? "log number:"
                log = log + line.ljust(1)
                next
            end

        end
    end

    return logs
  end

  def writelog()
    File.open(filename,"a") do |f|
      f.write "Logger:" + logger + "\n"
      f.write "log number:" + lognumber + "\n"
      f.write "Log:" + log + "\n"
      f.write LOG_END + "\n"
    end
  end      
    
  def archiveoldfile()
    # must archive file with more than 500k lines of log entries.
    # or files can be segregated according to dates. this means files must 
    # be named according to month names or month numbers.
  end
end


# lw = Logwork.new()
# lw.filename='test.txt'
# puts lw.filename
# lw.getlog

#lw.logger = "jojo siao"
#lw.lognumber = DateTime.now.strftime("%Y%m%d-%H%I%S")
#lw.log = "this is a test log. for today."
#lw.writelog
