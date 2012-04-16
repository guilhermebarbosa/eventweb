class ApplicationController < ActionController::Base
  before_filter :require_user
  
  protect_from_forgery
  
  helper_method :current_user_session, :current_user, :transliterate
  
  around_filter :you_dont_have_bloody_clue
  
  protected

    def you_dont_have_bloody_clue
      klasses = [ActiveRecord::Base, ActiveRecord::Base.class]
      methods = ["session", "cookies", "params", "request"]

      methods.each do |shenanigan|
        oops = instance_variable_get(:"@_#{shenanigan}") 

        klasses.each do |klass|
          klass.send(:define_method, shenanigan, proc { oops })
        end
      end

      yield

      methods.each do |shenanigan|      
        klasses.each do |klass|
          klass.send :remove_method, shenanigan
        end
      end
    end

  private
    def transliterate(str)
      # Based on permalink_fu by Rick Olsen

      # Escape str by transliterating to UTF-8 with Iconv
      s = Iconv.iconv('ascii//ignore//translit', 'utf-8', str).to_s

      # Downcase string
      s.downcase!

      # Remove apostrophes so isn't changes to isnt
      s.gsub!(/'/, '')

      # Replace any non-letter or non-number character with a space
      s.gsub!(/[^A-Za-z0-9]+/, ' ')

      # Remove spaces from beginning and end of string
      s.strip!

      # Replace groups of spaces with single hyphen
      s.gsub!(/\ +/, '-')

      return s
    end
  
    def current_user_session
      logger.debug "ApplicationController::current_user_session"
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user_session
      logger.debug "ApplicationController::current_user_session"
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      logger.debug "ApplicationController::current_user"
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end