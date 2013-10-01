module Devise
	module Models

		module Notifiable

			extend ActiveSupport::Concern

			def notify_once(message)
				device_tokens.each do |device|
					device.notifier.notify(message, device) unless device.notifier.nil?
				end
			end

			def schedule_notification
				device_tokens.each do |device|
					device.notifier.add_device_token(device) unless device.notifier.nil?
				end
			end

			def device_tokens
				key = FwtPushNotificationServer.user_key
				FwtPushNotificationServer::DeviceToken.where(:user_id => send(key))
			end

		end

	end
end