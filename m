Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0FA07203C
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 21:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbfGWTuj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 15:50:39 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:49702 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730398AbfGWTui (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jul 2019 15:50:38 -0400
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Jul 2019 15:50:38 EDT
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 4D60F73695E; Tue, 23 Jul 2019 21:45:21 +0200 (CEST)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tbm@cyrius.com, Oliver Hartkopp <socketcan@hartkopp.net>,
        Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH] ARM: kirkwood: ts219: disable the SoC's RTC
Date:   Tue, 23 Jul 2019 21:45:05 +0200
Message-Id: <20190723194505.28060-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The internal RTC doesn't work, loading the driver only yields

	rtc-mv f1010300.rtc: internal RTC not ticking

. So disable it.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 arch/arm/boot/dts/kirkwood-ts219.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/kirkwood-ts219.dtsi b/arch/arm/boot/dts/kirkwood-ts219.dtsi
index a88eb22070a1..994cabcf4b51 100644
--- a/arch/arm/boot/dts/kirkwood-ts219.dtsi
+++ b/arch/arm/boot/dts/kirkwood-ts219.dtsi
@@ -104,3 +104,11 @@
 &pcie0 {
 	status = "okay";
 };
+
+&rtc {
+	/*
+	 * There is a s35390a available on the i2c bus, the internal rtc isn't
+	 * working (probably no crystal assembled).
+	 */
+	status = "disabled";
+};
-- 
2.20.1

