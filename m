Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A55615A456
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2020 10:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbgBLJMF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Feb 2020 04:12:05 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:35898 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgBLJLv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 Feb 2020 04:11:51 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id 1lBo2200R5USYZQ01lBp8P; Wed, 12 Feb 2020 10:11:49 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1o3g-0000Zh-TO; Wed, 12 Feb 2020 10:11:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1nhF-0002U8-LS; Wed, 12 Feb 2020 09:48:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] rtc: sh: Restore devm_ioremap() alignment
Date:   Wed, 12 Feb 2020 09:48:36 +0100
Message-Id: <20200212084836.9511-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The alignment of the continuation of the devm_ioremap() call in
sh_rtc_probe() was broken.  Join the lines, as all parameters can fit on
a single line.

Fixes: 4bdc0d676a643140 ("remove ioremap_nocache and devm_ioremap_nocache")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/rtc/rtc-sh.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index feb1f8e52c008405..9167b48014a1584c 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -504,8 +504,7 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	if (unlikely(!rtc->res))
 		return -EBUSY;
 
-	rtc->regbase = devm_ioremap(&pdev->dev, rtc->res->start,
-					rtc->regsize);
+	rtc->regbase = devm_ioremap(&pdev->dev, rtc->res->start, rtc->regsize);
 	if (unlikely(!rtc->regbase))
 		return -EINVAL;
 
-- 
2.17.1

