Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B8B9C8A8
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 07:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbfHZFXJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 01:23:09 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47672 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729244AbfHZFXJ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 26 Aug 2019 01:23:09 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9409B2000CA;
        Mon, 26 Aug 2019 07:23:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 64D3320007B;
        Mon, 26 Aug 2019 07:23:03 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E54A8402A5;
        Mon, 26 Aug 2019 13:22:57 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        leoyang.li@nxp.com, broonie@kernel.org, nandor.han@vaisala.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [v3] rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Date:   Mon, 26 Aug 2019 13:12:56 +0800
Message-Id: <20190826051256.42139-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Issue:
    - hwclock -w
      hwclock: RTC_SET_TIME: Invalid argument

Why:
    - Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch
      will always check for unwritable registers, it will compare reg
      with max_register in regmap_writeable.
    - In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS
      is 0, max_regiter is 0x2f, then reg will be equal to 0x30,
      0x30 < 0x2f is false,so regmap_writeable will return false.

How:
    - increase max_register to skip failed
      when checking max_register.

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v3:
	- replace old scheme with new scheme:
	  increase max_register.

Change in v2:
	- add Why and How into commit message.

 drivers/rtc/rtc-pcf85363.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index a075e77617dc..e9d4ef59febd 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -336,7 +336,8 @@ static const struct pcf85x63_config pcf_85263_config = {
 	.regmap = {
 		.reg_bits = 8,
 		.val_bits = 8,
-		.max_register = 0x2f,
+		.max_register = 0x2f * 2, /* skip failed when
+					     checking max_register */
 	},
 	.num_nvram = 1
 };
-- 
2.17.1

