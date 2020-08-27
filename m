Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C862A254201
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Aug 2020 11:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgH0JWj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Aug 2020 05:22:39 -0400
Received: from inva021.nxp.com ([92.121.34.21]:42160 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728220AbgH0JWi (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 27 Aug 2020 05:22:38 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2A6E7200AF0;
        Thu, 27 Aug 2020 11:22:36 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 032DF20004A;
        Thu, 27 Aug 2020 11:22:33 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C27D5402A7;
        Thu, 27 Aug 2020 11:22:28 +0200 (CEST)
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 2/3] rtc: pcf2127: add "no-watchdog" property
Date:   Thu, 27 Aug 2020 17:14:40 +0800
Message-Id: <20200827091441.12972-2-qiang.zhao@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827091441.12972-1-qiang.zhao@nxp.com>
References: <20200827091441.12972-1-qiang.zhao@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Zhao Qiang <qiang.zhao@nxp.com>

Commit 0e735eaae165 ("rtc: pcf2127: add watchdog feature support")
adds watchdog feature for pcf2127, then it will be registered as
a watchdog device even though it is not used as watchdog.
Pcf2127 always be registered as watchdog0(default watchdog device),
even though it is not used as watchdog, meanwhile there is another
real watchdog device registered as watchdog1.
So add "no-watchdog" property, if the node has this property,
driver will not register it as a watchdog device

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
 drivers/rtc/rtc-pcf2127.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 02b069c..38d30e2 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -476,9 +476,11 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	}
 
 #ifdef CONFIG_WATCHDOG
-	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
-	if (ret)
-		return ret;
+	if (!of_property_read_bool(dev->of_node, "no-watchdog")) {
+		ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
+		if (ret)
+			return ret;
+	}
 #endif /* CONFIG_WATCHDOG */
 
 	/*
-- 
2.7.4

