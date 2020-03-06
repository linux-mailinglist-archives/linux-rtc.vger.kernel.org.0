Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F3A17B34C
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Mar 2020 01:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgCFA7V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 19:59:21 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:59973 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgCFA7V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 19:59:21 -0500
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 981CD200004;
        Fri,  6 Mar 2020 00:59:19 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: starfire: switch to rtc_time64_to_tm
Date:   Fri,  6 Mar 2020 01:59:10 +0100
Message-Id: <20200306005910.38939-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200306005910.38939-1-alexandre.belloni@bootlin.com>
References: <20200306005910.38939-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Call the 64bit version of rtc_tm time conversion.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-starfire.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-starfire.c b/drivers/rtc/rtc-starfire.c
index f21f4f961f3a..37a26279e107 100644
--- a/drivers/rtc/rtc-starfire.c
+++ b/drivers/rtc/rtc-starfire.c
@@ -27,7 +27,7 @@ static u32 starfire_get_time(void)
 
 static int starfire_read_time(struct device *dev, struct rtc_time *tm)
 {
-	rtc_time_to_tm(starfire_get_time(), tm);
+	rtc_time64_to_tm(starfire_get_time(), tm);
 	return 0;
 }
 
-- 
2.24.1

