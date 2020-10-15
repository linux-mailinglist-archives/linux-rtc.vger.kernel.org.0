Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01ABB28F94B
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Oct 2020 21:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388874AbgJOTLv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Oct 2020 15:11:51 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46579 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388410AbgJOTLq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Oct 2020 15:11:46 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9DF5740008;
        Thu, 15 Oct 2020 19:11:43 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] rtc: r9701: stop setting RWKCNT
Date:   Thu, 15 Oct 2020 21:11:33 +0200
Message-Id: <20201015191135.471249-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201015191135.471249-1-alexandre.belloni@bootlin.com>
References: <20201015191135.471249-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

tm_wday is never checked for validity and it is not read back in
r9701_get_datetime. Avoid setting it to stop tripping static checkers:

        drivers/rtc/rtc-r9701.c:109 r9701_set_datetime()
        error: undefined (user controlled) shift '1 << dt->tm_wday'

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Cc: Dan Carpenter <dan.carpenter@oracle.com>

 drivers/rtc/rtc-r9701.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-r9701.c b/drivers/rtc/rtc-r9701.c
index 4b688e9c4192..183c5a0fe78c 100644
--- a/drivers/rtc/rtc-r9701.c
+++ b/drivers/rtc/rtc-r9701.c
@@ -100,7 +100,6 @@ static int r9701_set_datetime(struct device *dev, struct rtc_time *dt)
 	ret = ret ? ret : write_reg(dev, RDAYCNT, bin2bcd(dt->tm_mday));
 	ret = ret ? ret : write_reg(dev, RMONCNT, bin2bcd(dt->tm_mon + 1));
 	ret = ret ? ret : write_reg(dev, RYRCNT, bin2bcd(dt->tm_year - 100));
-	ret = ret ? ret : write_reg(dev, RWKCNT, 1 << dt->tm_wday);
 
 	return ret;
 }
-- 
2.26.2

