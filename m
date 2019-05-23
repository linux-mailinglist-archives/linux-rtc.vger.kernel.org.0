Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF8027C62
	for <lists+linux-rtc@lfdr.de>; Thu, 23 May 2019 14:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbfEWMCt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 May 2019 08:02:49 -0400
Received: from mail1.skidata.com ([91.230.2.99]:1640 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730718AbfEWMCt (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 May 2019 08:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1558612990; x=1590148990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dt1RwWKGRYAmHL3AQGW/WA+Xv9Nz3QFAbtm/2pBA4V8=;
  b=kr7EZROgALQK3PAU5bdZTG/k65AC8oC4toCZA0o6vHQI8+h0DHFk6rFF
   Lm220aUD+efn+6BbdkiKScptnwSX65c4LnKJabekSIL+Zxgg+dR4NU9qa
   FIEsqRgMupAwuGXJxpqjCbntSA8wL18ve9hD5RaBAqIiTNGzuNAtOGUjc
   y2950S8AMsT1r6iBIP4nYAilu9ot9kdeDPL61Es3xaBbu/1GWeXIcoUYg
   ISJuHAWIla65/0ENK39g8Yf0sjrfBYN5d8FGYbvv+b48fOxSKWrXK6j4a
   QyIoVdrcPYxbAAqvpHP9JIloRUqX4pqdgQ/mxggENiv28e4L1JWBuHeQG
   g==;
IronPort-SDR: XfBgvtQ6XG95VFargmwHfeGTmwywlni3u9DY3/VMccbeIT9OT6G5vz5anaLVQnNErCM46IfWP5
 3BoO8nqsG48Qslyuxh5xrtGxLgQObJw4mgbqkLXoGDN1RflzoLQExoogRLIM9SA3D5e6bA6GD+
 1L6liGYURFeJhNZW0RWWeCXaY3Vi5Xwy16jBgJhTtMQQcy8qHsv+oHhZG4Ze1yNFCZswLqEAar
 Bgfzn/FqLYCqVHD2k31mMvuu+lwp1RIkVeENr0QW6Laslyef3KUpMdhIwnzMxJYT19XAeRs+bo
 Y5c=
X-IronPort-AV: E=Sophos;i="5.60,502,1549926000"; 
   d="scan'208";a="17248266"
From:   Richard Leitner <richard.leitner@skidata.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v2 2/4] rtc: s35390a: set uie_unsupported
Date:   Thu, 23 May 2019 13:54:49 +0200
Message-ID: <20190523115451.20007-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523115451.20007-1-richard.leitner@skidata.com>
References: <20190523115451.20007-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
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
index fb795c454077..4ca37f281ed9 100644
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

