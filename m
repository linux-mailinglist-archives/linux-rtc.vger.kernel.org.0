Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69BD517E05A
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2020 13:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgCIMfZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Mar 2020 08:35:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:37394 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbgCIMfZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 9 Mar 2020 08:35:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id DCCEEAD45;
        Mon,  9 Mar 2020 12:35:23 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: m48t35: remove SGI-IP27 kludge
Date:   Mon,  9 Mar 2020 13:35:14 +0100
Message-Id: <20200309123514.15543-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

With the IOC3 MFD driver it's no longer necessary to special case SGI-IP27.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/rtc/rtc-m48t35.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-m48t35.c b/drivers/rtc/rtc-m48t35.c
index e8194f1f01a8..92f19bf997b2 100644
--- a/drivers/rtc/rtc-m48t35.c
+++ b/drivers/rtc/rtc-m48t35.c
@@ -160,15 +160,10 @@ static int m48t35_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->size = resource_size(res);
-	/*
-	 * kludge: remove the #ifndef after ioc3 resource
-	 * conflicts are resolved
-	 */
-#ifndef CONFIG_SGI_IP27
 	if (!devm_request_mem_region(&pdev->dev, res->start, priv->size,
 				     pdev->name))
 		return -EBUSY;
-#endif
+
 	priv->baseaddr = res->start;
 	priv->reg = devm_ioremap(&pdev->dev, priv->baseaddr, priv->size);
 	if (!priv->reg)
-- 
2.25.0

