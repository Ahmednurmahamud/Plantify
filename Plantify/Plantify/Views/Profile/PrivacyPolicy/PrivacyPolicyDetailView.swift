//
//  PrivacyPolicyDetailView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct PrivacyPolicyDetailView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("""
    This Privacy Policy describes how Plantify collects, uses, and shares information when you use our Plant Shopping mobile application.
    
    **Information We Collect**
    
    **Personal Information**: When you use the App, we may collect certain personal information such as your name, email address, shipping address, and payment information. We collect this information when you create an account, place an order, or communicate with us.
    
    **Device Information**: We may collect information about your mobile device, including the device model, operating system version, unique device identifiers, and mobile network information.
    
    **Usage Information**: We collect information about how you use the App, such as the pages you visit, the features you use, and the actions you take. This helps us improve the App and provide a better user experience.
    
    **How We Use Your Information**
        We use the information we collect for various purposes, including:
    
        - To process and fulfill orders you place through the App.
        - To communicate with you about your orders, account, and promotions.
        - To provide customer support and respond to your inquiries.
        - To personalize your experience and provide relevant content and recommendations.
        - To improve the App, develop new features, and conduct research and analysis.
    
    **Data Security**
    
    We take the security of your information seriously and implement appropriate measures to protect it against unauthorized access, alteration, disclosure, or destruction. However, please note that no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.
    
    **Sharing of Information**
    
    We may share your information with third-party service providers who assist us in operating the App, processing payments, fulfilling orders, and providing other services. We may also share information with law enforcement agencies, government authorities, or other third parties when required by law or to protect our rights or the rights of others.
    
    **Your Choices**
    
    You can control and manage certain types of information we collect through your device settings or by adjusting your preferences within the App. You may also choose not to provide certain information, although this may limit your ability to use certain features of the App.
    
    **Changes to This Privacy Policy**
    
    We may update this Privacy Policy from time to time to reflect changes in our practices or legal requirements. We will notify you of any material changes by posting the updated policy on our website or within the App.
    
    **Contact Us**
    
    If you have any questions or concerns about this Privacy Policy or our privacy practices, please contact us at [plantify@email.com].
    """).padding(.horizontal, 16)
                }
            }
            .navigationTitle("Privacy Policy")
        }
    }
}

#Preview {
    PrivacyPolicyDetailView()
}
