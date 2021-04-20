Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF21365068
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Apr 2021 04:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhDTCk2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Apr 2021 22:40:28 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:42206 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhDTCk1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Apr 2021 22:40:27 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 13K2dc2q019361; Tue, 20 Apr 2021 11:39:38 +0900
X-Iguazu-Qid: 34ts1PSq9DIwrlqr4U
X-Iguazu-QSIG: v=2; s=0; t=1618886378; q=34ts1PSq9DIwrlqr4U; m=W01vTTr0wjDYL4octYmaG42SgzO/8PKDbHe8zkiEPv0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1511) id 13K2da2T007789
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 20 Apr 2021 11:39:37 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id A87DE1000BE;
        Tue, 20 Apr 2021 11:39:36 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 13K2da1A031876;
        Tue, 20 Apr 2021 11:39:36 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc:     linux-rtc@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2] rtc: ds1307: Fix wday settings for rx8130
Date:   Tue, 20 Apr 2021 11:39:17 +0900
X-TSB-HOP: ON
Message-Id: <20210420023917.1949066-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rx8130 wday specifies the bit position, not BCD.

Fixes: ee0981be7704 ("rtc: ds1307: Add support for Epson RX8130CE")
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/rtc/rtc-ds1307.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index cd8e438bc9c46b..8752620d8e34af 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -296,7 +296,11 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 	t->tm_min = bcd2bin(regs[DS1307_REG_MIN] & 0x7f);
 	tmp = regs[DS1307_REG_HOUR] & 0x3f;
 	t->tm_hour = bcd2bin(tmp);
-	t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
+	/* rx8130 is bit position, not BCD */
+	if (ds1307->type == rx_8130)
+		t->tm_wday = fls(regs[DS1307_REG_WDAY] & 0x7f);
+	else
+		t->tm_wday = bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
 	t->tm_mday = bcd2bin(regs[DS1307_REG_MDAY] & 0x3f);
 	tmp = regs[DS1307_REG_MONTH] & 0x1f;
 	t->tm_mon = bcd2bin(tmp) - 1;
@@ -343,7 +347,11 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 	regs[DS1307_REG_SECS] = bin2bcd(t->tm_sec);
 	regs[DS1307_REG_MIN] = bin2bcd(t->tm_min);
 	regs[DS1307_REG_HOUR] = bin2bcd(t->tm_hour);
-	regs[DS1307_REG_WDAY] = bin2bcd(t->tm_wday + 1);
+	/* rx8130 is bit position, not BCD */
+	if (ds1307->type == rx_8130)
+		regs[DS1307_REG_WDAY] = 1 << t->tm_wday;
+	else
+		regs[DS1307_REG_WDAY] = bin2bcd(t->tm_wday + 1);
 	regs[DS1307_REG_MDAY] = bin2bcd(t->tm_mday);
 	regs[DS1307_REG_MONTH] = bin2bcd(t->tm_mon + 1);
 
-- 
2.30.0

