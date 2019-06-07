Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB92A39619
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jun 2019 21:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729791AbfFGTno (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 7 Jun 2019 15:43:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729482AbfFGTno (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 7 Jun 2019 15:43:44 -0400
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net [71.197.186.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACD9720868;
        Fri,  7 Jun 2019 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559936623;
        bh=tFAX1TrUh+zWhm4cmBHIYK3G5smuy2djcrTGV59Ksuw=;
        h=From:To:Cc:Subject:Date:From;
        b=0oUCfe4AFMgIqpLhsK2SHdwXSoWkt+P20/GrYCplr6QfJXa76J7i7SRSkPx2TloI3
         epYMnraxb41OXVZvSeBI71eWnQWkNU/VlY0qfL2tTCNmFOX2EkIT+SS6RFNmF7ui3p
         cbaYb85XTpJX3G1h3pDJN5LREahcfvbK12lP7dns=
From:   Kevin Hilman <khilman@kernel.org>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: rtc: new binding for Amlogic VRTC
Date:   Fri,  7 Jun 2019 12:43:42 -0700
Message-Id: <20190607194343.18359-1-khilman@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Kevin Hilman <khilman@baylibre.com>

Add binding fo the new VRTC driver for Amlogic SoCs.  The 64-bit
family of SoCs only has an RTC managed by firmware, and this VRTC
driver provides the simple, one-register firmware interface.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 .../devicetree/bindings/rtc/rtc-meson-vrtc.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
new file mode 100644
index 000000000000..f02886179788
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
@@ -0,0 +1,16 @@
+* Amlogic Virtual RTC (VRTC)
+
+This is a Linux interface to an RTC managed by firmware, hence it's
+virtual from a Linux perspective.  The interface is 1 register where
+an alarm time is to be written.
+
+Required properties:
+- compatible: should be "amlogic,meson-vrtc"
+- reg: physical address for the alarm register
+
+Example:
+
+	vrtc: rtc@0a8 {
+		compatible = "amlogic,meson-vrtc";
+		reg = <0x0 0x000a8 0x0 0x4>;
+	};
-- 
2.21.0

