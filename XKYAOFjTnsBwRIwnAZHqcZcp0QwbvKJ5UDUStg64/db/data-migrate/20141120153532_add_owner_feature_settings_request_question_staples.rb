feature_id = Feature.find_by_name(:map_html_editor.to_s.camelcase).id 
FeatureSetting.create({ :feature_id => feature_id, :level => 0, :key => "request_answer_html_editor", :value => '', :access_level => 1, :serialized => false }, :without_protection => true )

fs = { :styles => 
      { 
          :submit_button =>  'border: 0px; border-radius: 0px; text-transform: uppercase;text-decoration: none;-moz-background-clip: padding;-webkit-background-clip: padding-box; background-clip:padding-box; background-color: #fdc501;-moz-box-shadow: inset 0 1px 0 rgba(255,255,255,.6);-webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,.6); box-shadow: inset 0 1px 0 rgba(255,255,255,.6); background-image: -moz-linear-gradient(bottom, rgba(3,3,3,.08) 0%, rgba(255,255,255,.08) 100%);background-image: -o-linear-gradient(bottom, rgba(3,3,3,.08) 0%, rgba(255,255,255,.08) 100%); background-image: -webkit-linear-gradient(bottom, rgba(3,3,3,.08) 0%, rgba(255,255,255,.08) 100%);background-image: linear-gradient(bottom, rgba(3,3,3,.08) 0%, rgba(255,255,255,.08) 100%); background-color: rgb(204,0,1); color: white; text-shadow: 0 1px 0 rgba(174,136,3,.89); font_size: 11px; padding: 10px 17px;',
          :question => 'color: #222; font-size: 18px; font-weight: bold;',
          :question_date => 'color: #a3a3a3; font-size: 18px; font-style: normal;',
          :write_answer => 'color: #222; font-size: 18px; width: 100%; height:23px;',
          :separator => 'display: none !important;',
          :product => 'text-decoration: none; color: #6bb3e5;',
          :side_column => 'display: none !important;',
          :main_column => 'width: 100%;'
      }, 
      :texts => { 
          :submit_button => 'submit',
          :submit_button_td_class => 'y-row-center',
          :write_answer => 'Write your answer here:' 
          } 
  }

account = Account.where(app_key: "vEiVh2yHSPM9TzTjPeRkLRJ4pRGGIgwS4sxgfvSF").first
account.enable_feature(:map_html_editor, true)
account.set_feature_settings('MapHtmlEditor', {:request_answer_html_editor => fs })
