Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5A71AAE77
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2020 18:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416170AbgDOQh3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Apr 2020 12:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1416168AbgDOQh0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Apr 2020 12:37:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F3FC061A0C
        for <linux-rtc@vger.kernel.org>; Wed, 15 Apr 2020 09:37:25 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1jOl2S-0007eu-En; Wed, 15 Apr 2020 18:37:24 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Bastian Krause <bst@pengutronix.de>
Subject: [PATCH 2/3] dt-bindings: rtc: add chargeable flag for rx8130
Date:   Wed, 15 Apr 2020 18:37:00 +0200
Message-Id: <20200415163701.21989-2-bst@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200415163701.21989-1-bst@pengutronix.de>
References: <20200415163701.21989-1-bst@pengutronix.de>
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

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
index 66f0a31ae9ce..987a0c9e0cd7 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
@@ -34,6 +34,9 @@ Optional properties:
 - trickle-diode-disable : ds1339, ds1340 and ds 1388 only
 	Do not use internal trickle charger diode
 	Should be given if internal trickle charger diode should be disabled
+- aux-voltage-chargeable: rx8130 only
+	Epsons's rx8130 supports a backup battery/supercap.
+	This flag tells	whether the battery/supercap is chargeable or not.
 
 Example:
 	ds1339: rtc@68 {
-- 
2.26.0.rc2

