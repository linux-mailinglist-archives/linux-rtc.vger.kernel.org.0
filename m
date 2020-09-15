Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4AD269FFE
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 09:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgIOHlV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 03:41:21 -0400
Received: from inva020.nxp.com ([92.121.34.13]:38032 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgIOHk7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 15 Sep 2020 03:40:59 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6EA691A07FB;
        Tue, 15 Sep 2020 09:40:51 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 503B81A07CC;
        Tue, 15 Sep 2020 09:40:47 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AA02E402A5;
        Tue, 15 Sep 2020 09:40:41 +0200 (CEST)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     alexandre.belloni@bootlin.com, leoyang.li@nxp.com,
        shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [PATCH 1/5] rtc: pcf2127: fix a bug when not specify interrupts property
Date:   Tue, 15 Sep 2020 15:32:09 +0800
Message-Id: <20200915073213.12779-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Fix a bug when not specify interrupts property in dts
as follows,
    rtc-pcf2127-i2c 1-0051: failed to request alarm irq
    rtc-pcf2127-i2c: probe of 1-0051 failed with error -22

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/rtc/rtc-pcf2127.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index ed6316992cbb..07a5630ec841 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -559,7 +559,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	pcf2127->rtc->set_start_time = true; /* Sets actual start to 1970 */
 	pcf2127->rtc->uie_unsupported = 1;
 
-	if (alarm_irq >= 0) {
+	if (alarm_irq > 0) {
 		ret = devm_request_threaded_irq(dev, alarm_irq, NULL,
 						pcf2127_rtc_irq,
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
@@ -570,7 +570,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		}
 	}
 
-	if (alarm_irq >= 0 || device_property_read_bool(dev, "wakeup-source")) {
+	if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
 		device_init_wakeup(dev, true);
 		pcf2127->rtc->ops = &pcf2127_rtc_alrm_ops;
 	}
-- 
2.17.1

