Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E971069D8
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 11:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVKWv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 05:22:51 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55055 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVKWv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 05:22:51 -0500
X-Originating-IP: 92.184.97.94
Received: from localhost (unknown [92.184.97.94])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C4DF440005;
        Fri, 22 Nov 2019 10:22:37 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/8] rtc: sysfs: fix hctosys_show kerneldoc
Date:   Fri, 22 Nov 2019 11:22:05 +0100
Message-Id: <20191122102212.400158-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix undocumented function parameters:
drivers/rtc/sysfs.c:112: warning: Function parameter or member 'dev' not described in 'hctosys_show'
drivers/rtc/sysfs.c:112: warning: Function parameter or member 'attr' not described in 'hctosys_show'
drivers/rtc/sysfs.c:112: warning: Function parameter or member 'buf' not described in 'hctosys_show'

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/sysfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
index be3531e7f868..b7ca7d79fb28 100644
--- a/drivers/rtc/sysfs.c
+++ b/drivers/rtc/sysfs.c
@@ -103,8 +103,11 @@ static DEVICE_ATTR_RW(max_user_freq);
 
 /**
  * rtc_sysfs_show_hctosys - indicate if the given RTC set the system time
+ * @dev: The device that the attribute belongs to.
+ * @attr: The attribute being read.
+ * @buf: The result buffer.
  *
- * Returns 1 if the system clock was set by this RTC at the last
+ * buf is "1" if the system clock was set by this RTC at the last
  * boot or resume event.
  */
 static ssize_t
-- 
2.23.0

