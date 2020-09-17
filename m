Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCD326E3BE
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Sep 2020 20:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgIQSes (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Sep 2020 14:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgIQSde (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Sep 2020 14:33:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE03C061797
        for <linux-rtc@vger.kernel.org>; Thu, 17 Sep 2020 11:32:56 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kIyiE-0004GR-Q8; Thu, 17 Sep 2020 20:32:54 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/8] dt-bindings: rtc: ds1307: add rx8130 aux-voltage-chargeable support
Date:   Thu, 17 Sep 2020 20:32:41 +0200
Message-Id: <20200917183246.19446-4-bst@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917183246.19446-1-bst@pengutronix.de>
References: <20200917183246.19446-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Epson's RX8130 was not charged before. A related patch will allow
optional charging.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1:
- added Rob Herring's Reviewed-by

v1 notes:
Previous version:
https://lore.kernel.org/linux-rtc/20200415163701.21989-2-bst@pengutronix.de/
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
index 08ea9734da80..36f610bb051e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
@@ -31,7 +31,7 @@ Optional properties:
 	Selected resistor for trickle charger
 	Possible values are 250, 2000, 4000
 	Should be given if trickle charger should be enabled
-- aux-voltage-chargeable: ds1339, ds1340 and ds1388 only
+- aux-voltage-chargeable: ds1339, ds1340, ds1388 and rx8130 only
 	Tells whether the battery/supercap of the RTC (if any) is
 	chargeable or not.
 	Possible values are 0 (not chargeable), 1 (chargeable)
-- 
2.28.0

