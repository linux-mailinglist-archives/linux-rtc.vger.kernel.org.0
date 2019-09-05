Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4410AA3CA
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2019 15:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389658AbfIENDq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Sep 2019 09:03:46 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:53209 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732224AbfIENDp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Sep 2019 09:03:45 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46PLV62X8Fz1rQ5S;
        Thu,  5 Sep 2019 15:03:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46PLV6269mz1qqkk;
        Thu,  5 Sep 2019 15:03:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id XtxPMZD9CLUr; Thu,  5 Sep 2019 15:03:40 +0200 (CEST)
X-Auth-Info: uf1kD/uqLeL9DzsZas2OjfC2IkAUeEUjcqYP+q90f9E=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  5 Sep 2019 15:03:40 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-rtc@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Arnaud Ebalard <arno@natisbad.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH V2] rtc: ds1307: Enable battery backup on RX8130
Date:   Thu,  5 Sep 2019 15:03:36 +0200
Message-Id: <20190905130336.10651-1-marex@denx.de>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The battery backup can be disabled on this RTC, e.g. if populated right
out of production. Force the battery backup bit on to enable it.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Arnaud Ebalard <arno@natisbad.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Bastian Krause <bst@pengutronix.de>
---
V2: Drop the custom offset, let regmap handle that
---
 drivers/rtc/rtc-ds1307.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 1f7e8aefc1eb..f2d1e59478c2 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -121,6 +121,8 @@ enum ds_type {
 #define RX8130_REG_FLAG_AF		BIT(3)
 #define RX8130_REG_CONTROL0		0x1e
 #define RX8130_REG_CONTROL0_AIE		BIT(3)
+#define RX8130_REG_CONTROL1		0x1f
+#define RX8130_REG_CONTROL1_INIEN	BIT(4)
 
 #define MCP794XX_REG_CONTROL		0x07
 #	define MCP794XX_BIT_ALM0_EN	0x10
@@ -1750,6 +1752,11 @@ static int ds1307_probe(struct i2c_client *client,
 				     DS1307_REG_HOUR << 4 | 0x08, hour);
 		}
 		break;
+	case rx_8130:
+		/* make sure that the backup battery is enabled */
+		regmap_write(ds1307->regmap, RX8130_REG_CONTROL1,
+			     RX8130_REG_CONTROL1_INIEN);
+		break;
 	default:
 		break;
 	}
-- 
2.23.0.rc1

