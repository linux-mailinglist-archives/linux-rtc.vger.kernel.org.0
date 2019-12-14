Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A18BB11F483
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfLNWDF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:05 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58119 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfLNWDE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:04 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 250C11C0005;
        Sat, 14 Dec 2019 22:03:02 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 02/17] rtc: Document RTC_VL_READ and RTC_VL_CLR ioctls
Date:   Sat, 14 Dec 2019 23:02:44 +0100
Message-Id: <20191214220259.621996-3-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
References: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RTC_VL_READ and RTC_VL_CLR have been introduced in 2012 with commit
0f20b767e20a ("drivers/rtc/rtc-pcf8563.c: add RTC_VL_READ/RTC_VL_CLR ioctl
feature")

Document them now that they have been unified.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 Documentation/ABI/testing/rtc-cdev | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/ABI/testing/rtc-cdev b/Documentation/ABI/testing/rtc-cdev
index 97447283f13b..25910c3c3d7e 100644
--- a/Documentation/ABI/testing/rtc-cdev
+++ b/Documentation/ABI/testing/rtc-cdev
@@ -33,6 +33,14 @@ Description:
 		  Requires a separate RTC_PIE_ON call to enable the periodic
 		  interrupts.
 
+		* RTC_VL_READ: Read the voltage inputs status of the RTC when
+		  supported. The value is a bit field of RTC_VL_*, giving the
+		  status of the main and backup voltages.
+
+		* RTC_VL_CLEAR: Clear the voltage status of the RTC. Some RTCs
+		  need user interaction when the backup power provider is
+		  replaced or charged to be able to clear the status.
+
 		The ioctl() calls supported by the older /dev/rtc interface are
 		also supported by the newer RTC class framework. However,
 		because the chips and systems are not standardized, some PC/AT
-- 
2.23.0

