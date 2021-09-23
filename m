Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C72D415EE0
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Sep 2021 14:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241119AbhIWMzd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Sep 2021 08:55:33 -0400
Received: from mout01.posteo.de ([185.67.36.65]:32859 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241155AbhIWMza (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Sep 2021 08:55:30 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 0C893240028
        for <linux-rtc@vger.kernel.org>; Thu, 23 Sep 2021 14:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1632401632; bh=A0hAzvAdjPLf8rM6gEcHQ/+hfe52dMr9Cqmfl5fwqCI=;
        h=Date:From:To:Cc:Subject:From;
        b=U0T/bG+eMpue4APgVi9Z8PLW1TywwfPGNABZhT5C9uYG24oJJGl4dxDrt8ZXHjr29
         9YxB06vo59oW10ANG5Vg90cYNknSzp8ym3q+m7sxErsAIjN++pXIShED7al1XXh88L
         OcHocBQDlbccDpVLypbAhUVj8s9zdk4/wygWsPLwGoq0vC3rkHfYTmOR8blsTMX82J
         sAGTYkiaP4URHqelnDfFwBQo/r3wziISc8poKAoUh6Ng1Q4gFv5Jept+Iafm5iIkgg
         8mOLh8wKZPONRqKzm70GG7+HfzAOU3/MMbm76lg/37tUWQ+WOgXVFNp/bsDyIhCm+Y
         42pOobbhqSS1A==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4HFZq325jHz9rxD;
        Thu, 23 Sep 2021 14:53:51 +0200 (CEST)
Date:   Thu, 23 Sep 2021 12:53:49 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     linux-kernel@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joerg Reiling <joerg.reiling@jenoptik.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: rtc-isl12022: add isl12020 device support
Message-ID: <YUx43WuvwrYIvjxe@monster.powergraphx.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Adds the isl12020 device, which is fully compatible to isl12022.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Signed-off-by: Joerg Reiling <joerg.reiling@jenoptik.com>
---
 drivers/rtc/rtc-isl12022.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 961bd5d1d109..c62770ec99c9 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -257,6 +257,8 @@ static int isl12022_probe(struct i2c_client *client,
 static const struct of_device_id isl12022_dt_match[] = {
 	{ .compatible = "isl,isl12022" }, /* for backward compat., don't use */
 	{ .compatible = "isil,isl12022" },
+	{ .compatible = "isl,isl12020" }, /* for backward compat., don't use */
+	{ .compatible = "isil,isl12020" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, isl12022_dt_match);
@@ -264,6 +266,7 @@ MODULE_DEVICE_TABLE(of, isl12022_dt_match);
 
 static const struct i2c_device_id isl12022_id[] = {
 	{ "isl12022", 0 },
+	{ "isl12020", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl12022_id);
-- 
2.33.0

