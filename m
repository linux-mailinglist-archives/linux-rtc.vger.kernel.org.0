Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7EE961E1F4
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Nov 2022 12:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiKFL7e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Nov 2022 06:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiKFL7d (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Nov 2022 06:59:33 -0500
Received: from smtp-out-04.comm2000.it (smtp-out-04.comm2000.it [212.97.32.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D644BD2C3
        for <linux-rtc@vger.kernel.org>; Sun,  6 Nov 2022 03:59:30 -0800 (PST)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-04.comm2000.it (Postfix) with ESMTPSA id 7670FBC2247;
        Sun,  6 Nov 2022 12:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1667735966;
        bh=QH6Jrzw/KVF+RLpnjBWHyGxKzG49p3CfSqSXG7p1tfw=;
        h=From:To:Cc:Subject:Date;
        b=Pt8ri7dxWGnb53lVzhMA4ZcrEtyMYL9COKMQUg5yScfTH2v33dswYQxrAAY4pm042
         5Ds5oQKEcKnct6cNdk7Cf5pK4LB3cOkL4M9DjoxLTr8HrVmDLaxndbMKnYt8ll2Cit
         LIJb1yIPamY7hQHYlyjPbo7K0KOBGBzCRfQVXTVJXb+OQ91YhahZwJDdupMLUS3vup
         GEDWLjD5UrQqyxVjBNvyGAGuMWoLlJz32QE6XMzPkH9XDKmKzQikiE3i9JAZG1ohrl
         UKF6VDrDPIogqR4OUR1v0JcU6qrDZ1U4Hxz2t05EWniNEVKhM1HYDIJMAq9IHMpNEF
         8afKWYcD1lXng==
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2] rtc: snvs: Allow a time difference on clock register read
Date:   Sun,  6 Nov 2022 12:59:15 +0100
Message-Id: <20221106115915.7930-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

On an iMX6ULL the following message appears when a wakealarm is set:

echo 0 > /sys/class/rtc/rtc1/wakealarm
rtc rtc1: Timeout trying to get valid LPSRT Counter read

This does not always happen but is reproducible quite often (7 out of 10
times). The problem appears because the iMX6ULL is not able to read the
registers within one 32kHz clock cycle which is the base clock of the
RTC. Therefore, this patch allows a difference of up to 320 cycles
(10ms). 10ms was chosen to be big enough even on systems with less cpu
power (e.g. iMX6ULL). According to the reference manual a difference is
fine:
- If the two consecutive reads are similar, the value is correct.
The values have to be similar, not equal.

Fixes: cd7f3a249dbe ("rtc: snvs: Add timeouts to avoid kernel lockups")
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Francesco Dolcini <francesco@dolcini.it>
---
v2: enforce counter read to be strictly greater than previous one, removed abs()
---
 drivers/rtc/rtc-snvs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index bd929b0e7d7d..d82acf1af1fa 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -32,6 +32,14 @@
 #define SNVS_LPPGDR_INIT	0x41736166
 #define CNTR_TO_SECS_SH		15
 
+/* The maximum RTC clock cycles that are allowed to pass between two
+ * consecutive clock counter register reads. If the values are corrupted a
+ * bigger difference is expected. The RTC frequency is 32kHz. With 320 cycles
+ * we end at 10ms which should be enough for most cases. If it once takes
+ * longer than expected we do a retry.
+ */
+#define MAX_RTC_READ_DIFF_CYCLES	320
+
 struct snvs_rtc_data {
 	struct rtc_device *rtc;
 	struct regmap *regmap;
@@ -56,6 +64,7 @@ static u64 rtc_read_lpsrt(struct snvs_rtc_data *data)
 static u32 rtc_read_lp_counter(struct snvs_rtc_data *data)
 {
 	u64 read1, read2;
+	s64 diff;
 	unsigned int timeout = 100;
 
 	/* As expected, the registers might update between the read of the LSB
@@ -66,7 +75,8 @@ static u32 rtc_read_lp_counter(struct snvs_rtc_data *data)
 	do {
 		read2 = read1;
 		read1 = rtc_read_lpsrt(data);
-	} while (read1 != read2 && --timeout);
+		diff = read1 - read2;
+	} while (((diff < 0) || (diff > MAX_RTC_READ_DIFF_CYCLES)) && --timeout);
 	if (!timeout)
 		dev_err(&data->rtc->dev, "Timeout trying to get valid LPSRT Counter read\n");
 
@@ -78,13 +88,15 @@ static u32 rtc_read_lp_counter(struct snvs_rtc_data *data)
 static int rtc_read_lp_counter_lsb(struct snvs_rtc_data *data, u32 *lsb)
 {
 	u32 count1, count2;
+	s32 diff;
 	unsigned int timeout = 100;
 
 	regmap_read(data->regmap, data->offset + SNVS_LPSRTCLR, &count1);
 	do {
 		count2 = count1;
 		regmap_read(data->regmap, data->offset + SNVS_LPSRTCLR, &count1);
-	} while (count1 != count2 && --timeout);
+		diff = count1 - count2;
+	} while (((diff < 0) || (diff > MAX_RTC_READ_DIFF_CYCLES)) && --timeout);
 	if (!timeout) {
 		dev_err(&data->rtc->dev, "Timeout trying to get valid LPSRT Counter read\n");
 		return -ETIMEDOUT;
-- 
2.25.1

