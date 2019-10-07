Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30FC2CE426
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 15:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbfJGNrc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 09:47:32 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54871 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbfJGNrb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 09:47:31 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3FFCA1BF203;
        Mon,  7 Oct 2019 13:47:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 01/10] rtc: add a timestamp for year 0
Date:   Mon,  7 Oct 2019 15:47:15 +0200
Message-Id: <20191007134724.15505-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

A few RTCs handle dates from year 0 to year 9999. Add a timestamp even if
years before 1970 will probably never be used.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/linux/rtc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index df666cf29ef1..2680f9b2b119 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -160,6 +160,7 @@ struct rtc_device {
 #define to_rtc_device(d) container_of(d, struct rtc_device, dev)
 
 /* useful timestamps */
+#define RTC_TIMESTAMP_BEGIN_0000	-62167219200ULL /* 0000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
 #define RTC_TIMESTAMP_BEGIN_2000	946684800LL /* 2000-01-01 00:00:00 */
 #define RTC_TIMESTAMP_END_2063		2966371199LL /* 2063-12-31 23:59:59 */
-- 
2.21.0

