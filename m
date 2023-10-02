Return-Path: <linux-rtc+bounces-41-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C26577B4D48
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 10:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 40EC62815FB
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Oct 2023 08:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB1F1C38;
	Mon,  2 Oct 2023 08:27:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB4A17C3
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 08:27:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5689BC4
	for <linux-rtc@vger.kernel.org>; Mon,  2 Oct 2023 01:27:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnEHM-0007HX-Bo; Mon, 02 Oct 2023 10:27:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnEHL-00ATqX-Qa; Mon, 02 Oct 2023 10:27:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qnEHL-007h1w-HO; Mon, 02 Oct 2023 10:27:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] MAINTAINERS: Drop Alessandro Zummo from rtc entry
Date: Mon,  2 Oct 2023 10:27:43 +0200
Message-Id: <20231002082743.2537954-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=807; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oOTNWUgJZcEdO0zIQqpHiOxolT/f0xWR1iaZlb2tpmI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlGn7+54ren35XC7mvtbHxJCM32kIYT4jyqo7Lw bKpPRpYBvyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRp+/gAKCRCPgPtYfRL+ TpbhCACm4SQOUCGLiJ2FwwId02LSMThNoNfp/sQdSv7677zizPqMNspCjQeYArVDuoT1xMKYvAI Yf7H3b84aLnyn9wQme1sJARrZb+Od1rNpnCCpke3ye8HD+7zHGrEJzR6nkpMotDXmRHVgtbQlEI RwSK1IAeMqjQ1bOVT6cQ5khY3WHkHfiolaiAW70/Hfk7vA2HueryeQPCGjJP2/oooU5sFl3zJNO AhK97eCRMYJ5baGEMUKWsI1WJrycJR0lF+3LVpAJy+J/+Pe+KzxxKkKm3WELAF2ojo1gnSEPhC6 ELpJZQHOopAYTUDiH+7PLM3elgUoeG4NzupzFqdyTkq2SyZQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Alessandro's last sign of life in the git history is an Ack in 2015, on
the mailing list[1] their last post is from January 2016.

I think it's safe to assume Alessandro doesn't do any rtc maintenance
any more, so drop the entry.

[1] https://lore.kernel.org/linux-rtc/?q=f%3AZummo

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..76008f46dd62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18085,7 +18085,6 @@ X:	include/linux/srcu*.h
 X:	kernel/rcu/srcu*.c
 
 REAL TIME CLOCK (RTC) SUBSYSTEM
-M:	Alessandro Zummo <a.zummo@towertech.it>
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 L:	linux-rtc@vger.kernel.org
 S:	Maintained
-- 
2.40.1


