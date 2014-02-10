# ios_config

This gem provides an easy way to generate profiles and configuration payloads for use with Apple iOS devices. These profiles and payloads can be delivered via Apple MDM or Apple's Configurator or iPhone Configuration Utility (IPCU).

Not all of the possible configuration payloads have been implemented yet. Some options may be missing. If you need a particular payload or need additional support from an existing payload, please fork and implement it so that we can all benefit from your efforts!

## Installation

Add this line to your application's Gemfile:

    gem 'ios_config'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ios_config

## Usage

Profiles contain basic identification and labeling information in addition to a collection of payloads. When you use this gem, you'll want to do two things:

1. Create your payloads
2. Create a profile that includes your payloads

### Example

Here is an example of how you might do this:

```ruby
# Create a payload

vpn_payload = IOSConfig::Payload::VPN.new connection_name:     "My VPN",
                                          authentication_type: :password,
                                          connection_type:     :pptp,
                                          encryption_level:    :auto,
                                          proxy_type:          :none,
                                          send_all_traffic:    true,
                                          server:              "example.org",
                                          username:            "macdemarco",
                                          password:            "viceroy"

payloads = [vpn_payload.build]

# Create a profile instance

profile = IOSConfig::Profile.new type:           "Configuration",
                                 display_name:   "A Profile Name",
                                 identifier:     "org.example.examplemdmservice.exampleprofile",
                                 organization:   "A Company Name",
                                 uuid:           SecureRandom.uuid,
                                 allow_removal:  false,
                                 client_certs:   [OpenSSL::X509::Certificate.new], # Array of client certificates
                                 payloads:       payloads # must be an array when type is "Configuration" 


# Generate a plist version of the profile, ready for delivery to the device

unsigned_profile = profile.unsigned

# Or, generate a signed plist version of the profile

signed_profile = profile.signed_from_file( signing_cert_path,
                                           signing_cert_intermediate_path,
                                           signing_cert_key_path )

signed_profile = profile.signed( signing_cert,
                                 signing_cert_intermediate,
                                 signing_cert_key )
```

### Profile

```ruby
# Create the profile

profile = IOSConfig::Profile.new [parameters]

# Then, generate your config one of two ways:

profile_plist = profile.unsigned # OR
profile_plist = profile.signed( [signing_cert_path], [intermediate_path], [key_path] )
```

#### Parameters

```ruby
allow_removal # if profile can be deleted by device user. defaults to true
description   # (optional) displayed in device settings 
display_name  # displayed in device settings
identifier
organization  # (optional) displayed in device settings
type          # (optional) default is 'Configuration'
uuid
version       # (optional) defaults to '1'
payloads      # (optional) payloads to be contained in the profile. should be an array if type is 'Configuration'
client_certs  # (optional) certificates used to encypt payloads
```

### Payloads

#### Common Parameters

```ruby
uuid
identifier
description
```

#### AirPlay

```ruby
payload = IOSConfig::Payload::AirPlay.new(parameters).build
```

Available parameters:

```ruby
whitelist   # array of DeviceIDs
passwords   # array of dictionaries with keys :device_name and :password
```

#### AirPrint

```ruby
payload = IOSConfig::Payload::AirPrint.new(parameters).build
```

Available parameters:

```ruby
airprint    # array of dictionaries with keys :ip_address and :resource_path
```

#### Single Sign-On Account

```ruby
payload = IOSConfig::Payload::SingleSignOnAccount.new(parameters).build
```

Available parameters:

```ruby
name
principal_name,
realm,
url_prefix_matches,    # array of strings
app_identifier_matches # array of strings
```

#### VPN

```ruby
payload = IOSConfig::Payload::VPN.new(parameters).build
```

Available parameters:

```ruby
connection_name    
authentication_type  # :password, :rsa_securid
connection_type      # :l2tp, :pptp, :ipsec, :anyconnect, :juniper_ssl, :f5_ssl, :sonicwall_modile_connect, :aruba_via
encryption_level     # :none, :manual, :auto
group_name           
prompt_for_password  # true, false
proxy_type           # :none, :manual, :auto
proxy_port          
proxy_server        
send_all_traffic     # true, false
server               
proxy_url            
group_or_domain      
password             
username             
proxy_password      
proxy_username       
realm     
role             
shared_secret      
```

#### Wi-Fi


```ruby
payload = IOSConfig::Payload::WiFi.new(parameters).build
```

Available parameters:

```ruby
ssid
hidden_network  # true false
auto_join       # true false
encryption_type # wep wpa any none
is_hotspot      # true false
domain_name
hessid
service_provider_roaming_enabled  # true false
roaming_consortium_ois            # array of strings
nai_realm_names                   # array of strings
mcc_and_mncs                      # array of strings
displayed_operator_name
password
priority        # integer
proxy_type      # none manual auto
proxy_server
proxy_port
proxy_username
proxy_password
proxy_url
```

### Restrictions

```ruby
payload = IOSConfig::Payload::Restrictions.new(parameters).build
```

Available parameters:

```ruby
allow_adding_game_center_friends # true false
allow_app_installation # true false
allow_app_removal # true false
allow_assistant # true false
allow_assistant_while_locked # true false
allow_bookstore # true false
allow_bookstore_erotica # true false
allow_camera # true false
allow_chat # true false
allow_cloud_backup # true false
allow_cloud_document_sync # true false
allow_explicit_content # true false
allow_fingerprint_for_unlock # true false
allow_game_center # true false
allow_global_background_fetch_when_roaming # true false
allow_in_app_purchases # true false
allow_multiplayer_gaming # true false
allow_open_from_managed_to_unmanaged # true false
allow_open_from_unmanaged_to_managed # true false
allow_passbook_while_locked # true false
allow_photo_stream # true false
allow_safari # true false
allow_screen_shot # true false
allow_shared_stream # true false
allow_shared_stream_receive_invitation # true false
allow_shared_stream_send_invitation # true false
allow_u_i_configuration_profile_installation # true false
allow_untrusted_t_l_s_prompt # true false
allow_video_conferencing # true false
allow_voice_dialing # true false
allow_you_tube # true false
allowi_tunes # true false
force_assistant_profanity_filter # true false
force_encrypted_backup # true false
force_i_tunes_store_password_entry # true false
```

### Custom Payloads

If you need to create a payload that isn't supported by the library, you can do so using the `IOSConfig::Payload::Custom` class. 

The construction of this payload is similar to the ready-made ones with two exceptions: You must specify the payload type and the actual structure of the payload.

Example:

```ruby
payload = IOSConfig::Payload::Custom.new(payload_type: 'com.apple.app.lock', payload: { 'App' => { 'Identifier' => 'com.spotify.client' } } ).build
```

Available parameters:

```ruby
payload_type    # string
payload_version # integer, defaults to 1
payload         # hash of payload structure
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
