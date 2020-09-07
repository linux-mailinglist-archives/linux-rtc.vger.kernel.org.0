Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FBD25FC18
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Sep 2020 16:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbgIGO3T (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Sep 2020 10:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbgIGO2b (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Sep 2020 10:28:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF94C061795
        for <linux-rtc@vger.kernel.org>; Mon,  7 Sep 2020 07:27:45 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kFI7U-0003nx-1v; Mon, 07 Sep 2020 16:27:44 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH 2/8] dt-bindings: rtc: ds1307: let aux-voltage-chargeable supersede trickle-diode-disable
Date:   Mon,  7 Sep 2020 16:27:21 +0200
Message-Id: <20200907142727.26472-3-bst@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907142727.26472-1-bst@pengutronix.de>
References: <20200907142727.26472-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

trickle-diode-disable is deprecated, so reflect that in the driver's
binding and add the new aux-voltage-chargeable.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
Previous version:
https://lore.kernel.org/linux-rtc/20200415163701.21989-2-bst@pengutronix.de/
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
index 66f0a31ae9ce..08ea9734da80 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
@@ -31,9 +31,16 @@ Optional properties:
 	Selected resistor for trickle charger
 	Possible values are 250, 2000, 4000
 	Should be given if trickle charger should be enabled
-- trickle-diode-disable : ds1339, ds1340 and ds 1388 only
+- aux-voltage-chargeable: ds1339, ds1340 and ds1388 only
+	Tells whether the battery/supercap of the RTC (if any) is
+	chargeable or not.
+	Possible values are 0 (not chargeable), 1 (chargeable)
+
+Deprecated properties:
+- trickle-diode-disable : ds1339, ds1340 and ds1388 only
 	Do not use internal trickle charger diode
 	Should be given if internal trickle charger diode should be disabled
+	(superseded by aux-voltage-chargeable)
 
 Example:
 	ds1339: rtc@68 {
-- 
2.28.0

