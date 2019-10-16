Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 376EAD9B5A
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2019 22:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389858AbfJPUQc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Oct 2019 16:16:32 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43561 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732607AbfJPUQc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Oct 2019 16:16:32 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 66BF31C0003;
        Wed, 16 Oct 2019 20:16:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Tony Prisk <linux@prisktech.co.nz>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/5] rtc: add timestamp for end of 2199
Date:   Wed, 16 Oct 2019 22:16:22 +0200
Message-Id: <20191016201626.31309-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some RTCs handle date up to 2199.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/linux/rtc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 2680f9b2b119..e86a9f307b82 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -165,6 +165,7 @@ struct rtc_device {
 #define RTC_TIMESTAMP_BEGIN_2000	946684800LL /* 2000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_END_2063		2966371199LL /* 2063-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2099		4102444799LL /* 2099-12-31 23:59:59 */
+#define RTC_TIMESTAMP_END_2199		7258118399LL /* 2199-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_9999		253402300799LL /* 9999-12-31 23:59:59 */
 
 extern struct rtc_device *devm_rtc_device_register(struct device *dev,
-- 
2.21.0

