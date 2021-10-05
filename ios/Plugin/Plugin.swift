import Capacitor
import Foundation
import UserNotifications
import YandexMobileMetrica
import YandexMobileMetricaPush

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AppmetricaPush)
public class AppmetricaPush: CAPPlugin {
    override public func load() {
        NotificationCenter.default.addObserver(self, selector: #selector(didRegisterWithToken(notification:)), name: Notification.Name(CAPNotifications.DidRegisterForRemoteNotificationsWithDeviceToken.name()), object: nil)
        let delegate = YMPYandexMetricaPush.userNotificationCenterDelegate()
        UNUserNotificationCenter.current().delegate = delegate
    }

    @objc func didRegisterWithToken(notification: NSNotification) {
        guard let deviceToken = notification.object as? Data else {
            return
        }

        do {
            YMPYandexMetricaPush.setDeviceTokenFrom(deviceToken)
        } catch {
            print("An error occurred while registering the YMPYandexMetricaPush token")
        }
    }
}
