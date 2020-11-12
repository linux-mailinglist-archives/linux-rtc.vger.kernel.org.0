Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F5B2B05FB
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Nov 2020 14:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgKLNIM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Nov 2020 08:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgKLNIM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Nov 2020 08:08:12 -0500
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2547C0613D1;
        Thu, 12 Nov 2020 05:08:11 -0800 (PST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4CX22x11vVz1s1VY;
        Thu, 12 Nov 2020 14:08:09 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4CX22x0PBXz1sQ3W;
        Thu, 12 Nov 2020 14:08:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id q6gpOA37gQEH; Thu, 12 Nov 2020 14:08:08 +0100 (CET)
X-Auth-Info: JCA9EuGNcr+mkFQruI18TFxtUDD/gDMOMWHSDb1eiZI=
Received: from localhost (dslb-094-220-156-233.094.220.pools.vodafone-ip.de [94.220.156.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 12 Nov 2020 14:08:08 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH v2 3/3] rtc: Kconfig: Fix typo in help message of rx 6110
Date:   Thu, 12 Nov 2020 14:07:34 +0100
Message-Id: <20201112130734.331094-4-ch@denx.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112130734.331094-1-ch@denx.de>
References: <20201112130734.331094-1-ch@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The help message in the Kconfig for the RX-6110 erronously stated
RX-6610.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 1fe411ffb19c..c7fb749c1c2f 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -933,7 +933,7 @@ config RTC_DRV_RX6110
 	select REGMAP_SPI if SPI_MASTER
 	select REGMAP_I2C if I2C
 	help
-	  If you say yes here you will get support for the Epson RX-6610.
+	  If you say yes here you will get support for the Epson RX-6110.
 
 	  This driver can also be built as a module. If so the module
 	  will be called rtc-rx6110.
-- 
2.20.1

