Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA0B2B5EF9
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 13:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbgKQMSg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 07:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbgKQMSg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 07:18:36 -0500
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF01C0613CF;
        Tue, 17 Nov 2020 04:18:35 -0800 (PST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Cb4jQ4Wd0z1rxY9;
        Tue, 17 Nov 2020 13:18:34 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Cb4jQ3j0yz1qvgd;
        Tue, 17 Nov 2020 13:18:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Imk7fUfCWHBf; Tue, 17 Nov 2020 13:18:33 +0100 (CET)
X-Auth-Info: xzRuexL6If0jgsxAOgAdnsQHRu70IYWXHdIhIXsAQDg=
Received: from localhost (dslb-084-056-254-185.084.056.pools.vodafone-ip.de [84.56.254.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 17 Nov 2020 13:18:33 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>,
        Werner Zeh <werner.zeh@siemens.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH v3 1/2] rtc: Kconfig: Fix typo in help message of rx 6110
Date:   Tue, 17 Nov 2020 13:18:16 +0100
Message-Id: <20201117121817.953924-2-ch@denx.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117121817.953924-1-ch@denx.de>
References: <20201117121817.953924-1-ch@denx.de>
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
index 65ad9d0b47ab..f74c7aad126a 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -821,7 +821,7 @@ config RTC_DRV_RX6110
 	tristate "Epson RX-6110"
 	select REGMAP_SPI
 	help
-	  If you say yes here you will get support for the Epson RX-6610.
+	  If you say yes here you will get support for the Epson RX-6110.
 
 	  This driver can also be built as a module. If so the module
 	  will be called rtc-rx6110.
-- 
2.20.1

