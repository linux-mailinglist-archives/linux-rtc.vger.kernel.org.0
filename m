Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C5C251FA
	for <lists+linux-rtc@lfdr.de>; Tue, 21 May 2019 16:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfEUO2P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 21 May 2019 10:28:15 -0400
Received: from mail2.skidata.com ([91.230.2.91]:32653 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfEUO2P (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 21 May 2019 10:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1558448917; x=1589984917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4wYDN3UAXBRcxIqLLW02Mm8kjVNFGjw+qsnwDcIrAEs=;
  b=XUr/Y8+e78n6WoJiipmm0vNUpctLF0oCp3dsClmhjoMcGU2ffyAjJQdM
   zSOdn3IosMXLf0GTZKG2/gYyNCo+cDkEFmphr3+P2/FBNx9DxoX9yYo8X
   u7XgWEOa7/ceWanYu6qXwq/wYe2+8yRUJ0VmhNhfrjqJoFF3n2iAv+r6y
   9loOewsk0ZxDWf8sf0g4Mw29URForzaGpLJM8exc8qf5U8QcMbFsWyw87
   D+26TYZy8DogZOs+GT0TgttGRhOdKCeAkeUu3DuKZXKTcNYhT4wn4as+l
   DT7nN3YzKp5lrU2PJmwwZJmXCUJnLYa0W8cgTmGcLYIQC9UUq8HPR1uSU
   A==;
IronPort-SDR: +GAVKJycoAjdGYaGZncjVkLVZ9thqrxZDrHcsWGGZQuWw6pVq5pFmLOrkv518mSEMtnfTFXMcc
 Wr2gEyYg9VhDHIq80iuSDpWvtANV7Px5ds9Ss1E317BRMmvXF/PE7LSEaDc8mMxJt/pOdm47Bm
 dwCtwRQJCAnMlXYRzSTJewuao+0SLDpuSoN8BXupgqkYw8shIlZsQLt6Ek7qqkjzNOYDrIHIcH
 v7MQ9/k1swGZNfe104Jm9PSrYQViRFCE8pGC+a1PrBTId7XGRnWfGR2/vyqOfQzxVckNbCz238
 ZCA=
X-IronPort-AV: E=Sophos;i="5.60,495,1549926000"; 
   d="scan'208";a="2150344"
From:   Richard Leitner <richard.leitner@skidata.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 2/3] rtc: s35390a: set uie_unsupported
Date:   Tue, 21 May 2019 16:20:23 +0200
Message-ID: <20190521142024.25894-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521142024.25894-1-richard.leitner@skidata.com>
References: <20190521142024.25894-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alarms are only supported on a per minute basis. This is why
uie_unsupported is set. Furthermore issue a warning when a second based
alarm is requested.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/rtc/rtc-s35390a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 6fb6d835b178..462407570750 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -289,6 +289,9 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 		alm->time.tm_min, alm->time.tm_hour, alm->time.tm_mday,
 		alm->time.tm_mon, alm->time.tm_year, alm->time.tm_wday);
 
+	if (alm->time.tm_sec != 0)
+		dev_warn(&client->dev, "Alarms are only supported on a per minute basis!\n");
+
 	/* disable interrupt (which deasserts the irq line) */
 	err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(sts));
 	if (err < 0)
@@ -500,6 +503,9 @@ static int s35390a_probe(struct i2c_client *client,
 		goto exit_dummy;
 	}
 
+	/* supports per-minute alarms only, therefore set uie_unsupported */
+	s35390a->rtc->uie_unsupported = 1;
+
 	if (status1 & S35390A_FLAG_INT2)
 		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
 
-- 
2.20.1

