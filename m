Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF96B8CFE2
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 11:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725265AbfHNJmo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 05:42:44 -0400
Received: from inva020.nxp.com ([92.121.34.13]:59448 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfHNJmo (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 14 Aug 2019 05:42:44 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A8AC1A02C2;
        Wed, 14 Aug 2019 11:42:42 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B0CF1A0119;
        Wed, 14 Aug 2019 11:42:39 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2DF0240293;
        Wed, 14 Aug 2019 17:42:35 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Date:   Wed, 14 Aug 2019 17:32:49 +0800
Message-Id: <20190814093249.40065-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Issue:
    # hwclock -w
    hwclock: RTC_SET_TIME: Invalid argument

The patch fixes error when run command hwclock -w
with rtc pcf85363/pcf85263

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/rtc/rtc-pcf85363.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index a075e77617dc..3450d615974d 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -166,7 +166,12 @@ static int pcf85363_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[DT_YEARS] = bin2bcd(tm->tm_year % 100);
 
 	ret = regmap_bulk_write(pcf85363->regmap, CTRL_STOP_EN,
-				tmp, sizeof(tmp));
+				tmp, 2);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(pcf85363->regmap, DT_100THS,
+				buf, sizeof(tmp) - 2);
 	if (ret)
 		return ret;
 
-- 
2.17.1

