Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8630319533F
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Mar 2020 09:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgC0Is3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Mar 2020 04:48:29 -0400
Received: from inva021.nxp.com ([92.121.34.21]:35726 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgC0Is3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 27 Mar 2020 04:48:29 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DC79E200CD5;
        Fri, 27 Mar 2020 09:48:27 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6DF0F200D01;
        Fri, 27 Mar 2020 09:48:24 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AF51B40281;
        Fri, 27 Mar 2020 16:48:19 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     alexandre.belloni@bootlin.com, leoyang.li@nxp.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, Biwen Li <biwen.li@nxp.com>
Subject: [PATCH] rtc: flextimer: report interrupt state to user mode
Date:   Fri, 27 Mar 2020 16:44:57 +0800
Message-Id: <20200327084457.45161-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Report interrupt state to user mode

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 8df2075af9a2..d7fa6c16f47b 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -151,6 +151,8 @@ static irqreturn_t ftm_rtc_alarm_interrupt(int irq, void *dev)
 {
 	struct ftm_rtc *rtc = dev;
 
+	rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
+
 	ftm_irq_acknowledge(rtc);
 	ftm_irq_disable(rtc);
 	ftm_clean_alarm(rtc);
-- 
2.17.1

