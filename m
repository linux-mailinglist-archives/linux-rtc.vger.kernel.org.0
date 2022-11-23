Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD33A6358FC
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 11:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236472AbiKWKFC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 05:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236483AbiKWKEM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 05:04:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742B2112C68
        for <linux-rtc@vger.kernel.org>; Wed, 23 Nov 2022 01:55:32 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oxmTa-0005bT-NF; Wed, 23 Nov 2022 10:55:30 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oxmTY-0061TJ-N9; Wed, 23 Nov 2022 10:55:29 +0100
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oxmTY-00BdPi-Tt; Wed, 23 Nov 2022 10:55:28 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Alessandro Zummo <a.zummo@towertech.it>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/2] include/linux/bcd.h: provide bcd_is_valid() helper
Date:   Wed, 23 Nov 2022 10:55:26 +0100
Message-Id: <20221123095527.2771434-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123095527.2771434-1-s.hauer@pengutronix.de>
References: <20221123095527.2771434-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

bcd2bin(0x0A) happily returns 10, despite this being an invalid BCD
value. RTC drivers converting possibly corrupted BCD timestamps might
want to validate their input before calling bcd2bin().

Provide a macro to do so. Unlike bcd2bin and bin2bcd, out-of-line
versions are not implemented. Should the macro experience enough use,
this can be retrofitted.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 include/linux/bcd.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/bcd.h b/include/linux/bcd.h
index 118bea36d7d49..abbc8149178e6 100644
--- a/include/linux/bcd.h
+++ b/include/linux/bcd.h
@@ -14,8 +14,12 @@
 		const_bin2bcd(x) :			\
 		_bin2bcd(x))
 
+#define bcd_is_valid(x)					\
+		const_bcd_is_valid(x)
+
 #define const_bcd2bin(x)	(((x) & 0x0f) + ((x) >> 4) * 10)
 #define const_bin2bcd(x)	((((x) / 10) << 4) + (x) % 10)
+#define const_bcd_is_valid(x)	(((x) & 0x0f) < 10 && ((x) >> 4) < 10)
 
 unsigned _bcd2bin(unsigned char val) __attribute_const__;
 unsigned char _bin2bcd(unsigned val) __attribute_const__;
-- 
2.30.2

