Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16801251F8
	for <lists+linux-rtc@lfdr.de>; Tue, 21 May 2019 16:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbfEUO2J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 21 May 2019 10:28:09 -0400
Received: from mail1.skidata.com ([91.230.2.99]:38017 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfEUO2J (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 21 May 2019 10:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1558448911; x=1589984911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B2hSHlQm+l5Bj0jq+eLK8pzuGFSFBmz1fzAh0yI5TTo=;
  b=GeNN20td0/AEI1rlaIUfohbmhcMDOAP+YOCB+Ui1Tgx+JHezbqrHhjUe
   V4Xe5qwtSlkdnsJIoGcS+nX0oREie11pvmqAW9VWgIxNXh1ov+ASJIh7L
   D3ukLpn8x3RbZcNpXJxIcwHE6InOHbFoSGJkPfSffj0g5FFjF0APAGuz4
   UysVLlnxBFlhSjamBOB+1/QLhuKUJmlEZXF132PbQNTSJ8BH9+N56VnSN
   CH6Mu+FsfK+UoBN/NwFLRWgTIkjdVuyU2rHtTt2nsfqMSZeatjiww8A2Y
   mKzRx8oj3PZdGG88q2GV3tI9AXW17t7oq5TtGrkHh8c7WJUriugqvAiAr
   w==;
IronPort-SDR: abjqOS7YmmpNOOT4RZGfXJPRsSyfyHUk4y0k1FG9HRv1LBl6EXFdzYv5o7cS69xJYlpt/0OI2h
 sIvZ5dmigP1RLgxbb2IYVDFoOs21Pi0IvqlDEbObJicwr9RlWV81FaA+A5o+TlJSLoUKyXOEW4
 xHEgnE+VhQ8JtR/7QlxcplWoNbGmj7dbSGkvLNDZoKqzZxW8bSfA/zVssszZRt7Rn2HDurI8OL
 8uvLRC7et4YC34p80oFn8RU0e+76DCISrCoWnobroChf4vH9h2TA+gZbTpFgLA8xwdWvwNOPZ+
 sIg=
X-IronPort-AV: E=Sophos;i="5.60,495,1549926000"; 
   d="scan'208";a="17196614"
From:   Richard Leitner <richard.leitner@skidata.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 1/3] rtc: s35390a: clarify INT2 pin output modes
Date:   Tue, 21 May 2019 16:20:22 +0200
Message-ID: <20190521142024.25894-2-richard.leitner@skidata.com>
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

Fix the INT2 mode mask to not include the "TEST" flag. Furthermore
remove the not needed reversion of bits when parsing the INT2 modes.
Instead reverse the INT2_MODE defines.

Additionally mention the flag names from the datasheet for the different
modes in the comments.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/rtc/rtc-s35390a.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 3c64dbb08109..6fb6d835b178 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -45,12 +45,13 @@
 /* flag for STATUS2 */
 #define S35390A_FLAG_TEST	0x01
 
-#define S35390A_INT2_MODE_MASK		0xF0
-
+/* INT2 pin output mode */
+#define S35390A_INT2_MODE_MASK		0x0E
 #define S35390A_INT2_MODE_NOINTR	0x00
-#define S35390A_INT2_MODE_FREQ		0x10
-#define S35390A_INT2_MODE_ALARM		0x40
-#define S35390A_INT2_MODE_PMIN_EDG	0x20
+#define S35390A_INT2_MODE_ALARM		0x02 /* INT2AE */
+#define S35390A_INT2_MODE_PMIN_EDG	0x04 /* INT2ME */
+#define S35390A_INT2_MODE_FREQ		0x08 /* INT2FE */
+#define S35390A_INT2_MODE_PMIN		0x0C /* INT2ME | INT2FE */
 
 static const struct i2c_device_id s35390a_id[] = {
 	{ "s35390a", 0 },
@@ -303,9 +304,6 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	else
 		sts = S35390A_INT2_MODE_NOINTR;
 
-	/* This chip expects the bits of each byte to be in reverse order */
-	sts = bitrev8(sts);
-
 	/* set interupt mode*/
 	err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(sts));
 	if (err < 0)
@@ -343,7 +341,7 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	if (err < 0)
 		return err;
 
-	if ((bitrev8(sts) & S35390A_INT2_MODE_MASK) != S35390A_INT2_MODE_ALARM) {
+	if ((sts & S35390A_INT2_MODE_MASK) != S35390A_INT2_MODE_ALARM) {
 		/*
 		 * When the alarm isn't enabled, the register to configure
 		 * the alarm time isn't accessible.
-- 
2.20.1

