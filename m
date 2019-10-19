Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4056DDB0C
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 22:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbfJSUui (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 19 Oct 2019 16:50:38 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35057 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfJSUui (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 19 Oct 2019 16:50:38 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9E2351C0002;
        Sat, 19 Oct 2019 20:50:36 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: introduce lock helpers
Date:   Sat, 19 Oct 2019 22:50:34 +0200
Message-Id: <20191019205034.6382-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Introduce rtc_lock and rtc_unlock to shorten the code when locking and
unlocking ops_lock from drivers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/linux/rtc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index e86a9f307b82..4e9d3c71addb 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -159,6 +159,9 @@ struct rtc_device {
 };
 #define to_rtc_device(d) container_of(d, struct rtc_device, dev)
 
+#define rtc_lock(d) mutex_lock(&d->ops_lock)
+#define rtc_unlock(d) mutex_unlock(&d->ops_lock)
+
 /* useful timestamps */
 #define RTC_TIMESTAMP_BEGIN_0000	-62167219200ULL /* 0000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
-- 
2.21.0

