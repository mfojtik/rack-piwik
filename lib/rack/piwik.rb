module Rack

  module PiwikTracking

    require 'uri'

    PIWIK_JAVASCRIPT = %Q[
<!-- Piwik --> 
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://%{hostname}/" : "http://%{hostname}/");
document.write(unescape("%%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%%3E%%3C/script%%3E"));
</script><script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", %{site_id});
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script><noscript><p><img src="%{url}/piwik.php?idsite=%{site_id}" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
    ]

    PIWIK_STATIC = %Q[
<!-- Piwik Image Tracker -->
<img src="%{url}/piwik.php?idsite=%{site_id}&amp;rec=1" style="border:0" alt="" />
<!-- End Piwik -->
]

    def __inject_piwik_code__(nojs=false)
      self.gsub(%r{</body>}, __piwik_code__(nojs) + "</body>")
    end

    private

    def __piwik_code__(nojs=false)
      uri = URI(Piwik.configuration[:url])
      (nojs ? PIWIK_STATIC : PIWIK_JAVASCRIPT) % {
        :url => uri.to_s,
        :hostname => "#{uri.host}" + (uri.port!=80 ? ":#{uri.port}" : ''),
        :site_id => Piwik.configuration[:site_id]
      }
    end

  end

  class Piwik

    def self.configuration
      @configuration ||- {}
    end

    def self.tracking(opts={})
      @configuration = opts
      self
    end

    def initialize(app, no_cache_control = nil, cache_control = nil)
      @app = app
    end

    def call(env)
      status, @headers, body = @app.call(env)
      response = Rack::Response.new([], @status, @headers)
      body.each { |fragment| response.write(fragment.extend(PiwikTracking).__inject_piwik_code__(self.class.configuration[:no_javascript])) }
      response.finish
    end

    private

    def is_html?
      @headers['Content-Type'].include? 'html'
    end

  end

end
