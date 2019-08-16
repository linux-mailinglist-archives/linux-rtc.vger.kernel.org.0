Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 101148F945
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2019 04:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfHPC4e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Aug 2019 22:56:34 -0400
Received: from inva020.nxp.com ([92.121.34.13]:42208 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfHPC4e (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 15 Aug 2019 22:56:34 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 824A01A04D0;
        Fri, 16 Aug 2019 04:56:32 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 71B0C1A0110;
        Fri, 16 Aug 2019 04:56:29 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B49D040250;
        Fri, 16 Aug 2019 10:56:25 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [v2] rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Date:   Fri, 16 Aug 2019 10:46:36 +0800
Message-Id: <20190816024636.34738-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Issue:
    - # hwclock -w
      hwclock: RTC_SET_TIME: Invalid argument

Why:
    - Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch
      will always check for unwritable registers, it will compare reg
      with max_register in regmap_writeable.

    - In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS
      is 0, max_regiter is 0x2f, then reg will be equal to 0x30,
      '0x30 < 0x2f' is false,so regmap_writeable will return false.

    - Root cause: the buf[] was written to a wrong place in the file
      drivers/rtc/rtc-pcf85363.c

How:
    - Split of writing regs to two parts, first part writes control
      registers about stop_enable and resets, second part writes
      RTC time and date registers.

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- add Why and How into commit message.
	 
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

