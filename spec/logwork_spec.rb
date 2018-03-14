require_relative '../logwork'

RSpec.describe 'Logwork' do
  describe 'createlog' do
	  it 'creates a new log file if no log file yet' do
	  
		test_filename = 'new_log_file'
	    if File.exist? test_filename
			File.delete test_filename 
		end
		
		@lw = Logwork.new
		@lw.filename = 'new_log_file'
		@lw.createlog 
		expect(File.exist?(@lw.filename)).to eq true
	  end
  end
  
  describe 'writelog' do 
	  it 'writes a new log into the logfile' do
	  
		test_filename = 'new_log_file'
	    if File.exist? test_filename
			File.delete test_filename 
		end
		
		@lw = Logwork.new
		@lw.filename = 'new_log_file'
		@lw.createlog
		
		strftime = DateTime.now.strftime "%Y%m%d-%H%I%S"
		@lw.lognumber = strftime
		@lw.logger = 'Jojo Siao'
		@lw.log = 'This is a sample log.'
		@lw.writelog
		logs = @lw.getlog
		expect(logs.include? strftime + "|" + @lw.log).to eq true
	  end
  end
  
  
end


	