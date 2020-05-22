Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51761DDD23
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2020 04:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgEVC3s (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 May 2020 22:29:48 -0400
Received: from inva020.nxp.com ([92.121.34.13]:59230 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726886AbgEVC3s (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 21 May 2020 22:29:48 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C74BD1A090D;
        Fri, 22 May 2020 04:29:46 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 662951A08FB;
        Fri, 22 May 2020 04:29:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0E0CF402AD;
        Fri, 22 May 2020 10:29:40 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/2] rtc: snvs: Make SNVS clock always prepared
Date:   Fri, 22 May 2020 10:19:55 +0800
Message-Id: <1590113996-31845-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In IRQ handler, ONLY clock enable/disable is called due to
clock prepare can NOT be called in interrupt context, but
clock enable/disable will return failure if prepare count
is 0, to fix this issue, just make SNVS clock always prepared
there, the SNVS clock has no prepare function implemented,
so it won't impact anything.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/rtc-snvs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index 35ee08a..b9371f4 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -362,7 +362,7 @@ static int __maybe_unused snvs_rtc_suspend_noirq(struct device *dev)
 	struct snvs_rtc_data *data = dev_get_drvdata(dev);
 
 	if (data->clk)
-		clk_disable_unprepare(data->clk);
+		clk_disable(data->clk);
 
 	return 0;
 }
@@ -372,7 +372,7 @@ static int __maybe_unused snvs_rtc_resume_noirq(struct device *dev)
 	struct snvs_rtc_data *data = dev_get_drvdata(dev);
 
 	if (data->clk)
-		return clk_prepare_enable(data->clk);
+		return clk_enable(data->clk);
 
 	return 0;
 }
-- 
2.7.4

