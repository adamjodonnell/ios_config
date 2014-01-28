module IOSConfig
  module Payload
    class Restrictions < Base

      attr_accessor :allow_adding_game_center_friends, # true, false
                    :allow_app_installation, # true, false
                    :allow_app_removal, # true, false
                    :allow_assistant, # true, false
                    :allow_assistant_while_locked, # true, false
                    :allow_bookstore, # true, false
                    :allow_bookstore_erotica, # true, false
                    :allow_camera, # true, false
                    :allow_chat, # true, false
                    :allow_cloud_backup, # true, false
                    :allow_cloud_document_sync, # true, false
                    :allow_explicit_content, # true, false
                    :allow_fingerprint_for_unlock, # true, false
                    :allow_game_center, # true, false
                    :allow_global_background_fetch_when_roaming, # true, false
                    :allow_in_app_purchases, # true, false
                    :allow_multiplayer_gaming, # true, false
                    :allow_open_from_managed_to_unmanaged, # true, false
                    :allow_open_from_unmanaged_to_managed, # true, false
                    :allow_passbook_while_locked, # true, false
                    :allow_photo_stream, # true, false
                    :allow_safari, # true, false
                    :allow_screen_shot, # true, false
                    :allow_shared_stream, # true, false
                    #:allow_shared_stream_receive_invitation, # true, false
                    #:allow_shared_stream_send_invitation, # true, false
                    :allow_u_i_configuration_profile_installation, # true, false
                    :allow_untrusted_t_l_s_prompt, # true, false
                    :allow_video_conferencing, # true, false
                    :allow_voice_dialing, # true, false
                    :allow_you_tube, # true, false
                    :allowi_tunes, # true, false
                    :force_assistant_profanity_filter, # true, false
                    :force_encrypted_backup, # true, false
                    :force_i_tunes_store_password_entry # true, false

      private

      def payload_type
        "com.apple.applicationaccess"
      end

      def payload
        p = {}

        p['allowAddingGameCenterFriends'] = @allow_adding_game_center_friends unless @allow_adding_game_center_friends.nil?
        p['allowAppInstallation'] = @allow_app_installation unless @allow_app_installation.nil? 
        p['allowAppRemoval'] = @allow_app_removal unless @allow_app_removal.nil? 
        p['allowAssistant'] = @allow_assistant unless @allow_assistant.nil? 
        p['allowAssistantWhileLocked'] = @allow_assistant_while_locked unless @allow_assistant_while_locked.nil? 
        p['allowBookstore'] = @allow_bookstore unless @allow_bookstore.nil? 
        p['allowBookstoreErotica'] = @allow_bookstore_erotica unless @allow_bookstore_erotica.nil? 
        p['allowCamera'] = @allow_camera unless @allow_camera.nil? 
        p['allowChat'] = @allow_chat unless @allow_chat.nil? 
        p['allowCloudBackup'] = @allow_cloud_backup unless @allow_cloud_backup.nil? 
        p['allowCloudDocumentSync'] = @allow_cloud_document_sync unless @allow_cloud_document_sync.nil? 
        p['allowExplicitContent'] = @allow_explicit_content unless @allow_explicit_content.nil? 
        p['allowFingerprintForUnlock'] = @allow_fingerprint_for_unlock unless @allow_fingerprint_for_unlock.nil? 
        p['allowGameCenter'] = @allow_game_center unless @allow_game_center.nil? 
        p['allowGlobalBackgroundFetchWhenRoaming'] = @allow_global_background_fetch_when_roaming unless @allow_global_background_fetch_when_roaming.nil? 
        p['allowInAppPurchases'] = @allow_in_app_purchases unless @allow_in_app_purchases.nil? 
        p['allowMultiplayerGaming'] = @allow_multiplayer_gaming unless @allow_multiplayer_gaming.nil? 
        p['allowOpenFromManagedToUnmanaged'] = @allow_open_from_managed_to_unmanaged unless @allow_open_from_managed_to_unmanaged.nil? 
        p['allowOpenFromUnmanagedToManaged'] = @allow_open_from_unmanaged_to_managed unless @allow_open_from_unmanaged_to_managed.nil? 
        p['allowPassbookWhileLocked'] = @allow_passbook_while_locked unless @allow_passbook_while_locked.nil? 
        p['allowPhotoStream'] = @allow_photo_stream unless @allow_photo_stream.nil? 
        p['allowSafari'] = @allow_safari unless @allow_safari.nil? 
        p['allowScreenShot'] = @allow_screen_shot unless @allow_screen_shot.nil? 
        p['allowSharedStream'] = @allow_shared_stream unless @allow_shared_stream.nil? 
        #p['allowSharedStreamReceiveInvitation'] = @allow_shared_stream_receive_invitation unless @allow_shared_stream_receive_invitation.nil? 
        #p['allowSharedStreamSendInvitation'] = @allow_shared_stream_send_invitation unless @allow_shared_stream_send_invitation.nil? 
        p['allowUIConfigurationProfileInstallation'] = @allow_u_i_configuration_profile_installation unless @allow_u_i_configuration_profile_installation.nil? 
        p['allowUntrustedTLSPrompt'] = @allow_untrusted_t_l_s_prompt unless @allow_untrusted_t_l_s_prompt.nil? 
        p['allowVideoConferencing'] = @allow_video_conferencing unless @allow_video_conferencing.nil? 
        p['allowVoiceDialing'] = @allow_voice_dialing unless @allow_voice_dialing.nil? 
        p['allowYouTube'] = @allow_you_tube unless @allow_you_tube.nil? 
        p['allowiTunes'] = @allowi_tunes unless @allowi_tunes.nil? 
        p['forceAssistantProfanityFilter'] = @force_assistant_profanity_filter unless @force_assistant_profanity_filter.nil? 
        p['forceEncryptedBackup'] = @force_encrypted_backup unless @force_encrypted_backup.nil? 
        p['forceITunesStorePasswordEntry'] = @force_i_tunes_store_password_entry unless @force_i_tunes_store_password_entry.nil? 

        p
      end
    end
  end
end