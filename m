Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CF22C0383
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Nov 2020 11:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgKWKkg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Nov 2020 05:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgKWKkf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Nov 2020 05:40:35 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D300C0613CF
        for <linux-rtc@vger.kernel.org>; Mon, 23 Nov 2020 02:40:35 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id m6so18065240wrg.7
        for <linux-rtc@vger.kernel.org>; Mon, 23 Nov 2020 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RergrObuZ7nJbj82NXrvmDmOiyMDnI5ohePqhGaidew=;
        b=qYswqWJqMPRsxXaW6Plzhdij7IeMXZHKJndVV/0Ub4DQkp/K1Vkml+EGj7LHtFKnrT
         1x1KfhcLtPr9p67u+cRqkNQSdJZ4Ej6YA1vUHSQcZfk/f3PtzaF9qijF9o92luPVK1J1
         lqAvla7xfUIAVMjSYZ4yT9SKfWs0odfIhAWu4KINwYTx+bKek3n28Y8NkOrwIJKc7+8Y
         Tbf1BY23jkoqtAaWMkXK2HtTLBbXPBTkZY1rjPfU+fgDhmC3j44F8baOKQoGhchsIHM5
         XR8xavClUPsgJPMuQOhsJWBpzIw/KHEzgNsLS4+Q5WUpF3c1mo2rFlKhZk0wj4Zq7IIx
         /I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RergrObuZ7nJbj82NXrvmDmOiyMDnI5ohePqhGaidew=;
        b=ECiL+Y7wyNtlwAU+H+HyWvjOJM5dsqO5Yq7r6jpiV4ehrsYJEGqWeEtguU89ZqN1ve
         yFCVmrSa/JkhxwPMLUutTQRozyO6mBdHAaCMEW9CzGiBt+iF9YaDTLkgNUt42aLysTOq
         tKodkcKfb479qZQc5bXIskE4pmdrX5SRCv2TNgd1i3un9gJHNvOQxBvoVCAn9V1zFI3K
         amsLyWTZtcyUM3RnJr3XM/vLBWnXsPRXYzYrDADB7YjSw3zWCUDrgIL9/w/Ku7TtgdpW
         Bq1ktquCuNgnOw/vXVyJwBcpNZP6l7Vk+uq00xOskbpMgZLzIXzt0dRAZuqDygvsT6L3
         mHsA==
X-Gm-Message-State: AOAM532o1UEB/bUaK8O06rvURA97C61qH/4RUg2Mp95HLhjY1+0489sT
        RJHMK7EX4DgsGckeaGifYu/vqNjOX+0HJw==
X-Google-Smtp-Source: ABdhPJz9hjQBfqKXrt5xoSemDCe1JRxiD6cLeYcGku5fIU/F12YML4nxCDUAwNkJaU9Wfo7n2yVO3g==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr30019992wrq.256.1606128033873;
        Mon, 23 Nov 2020 02:40:33 -0800 (PST)
Received: from tool.localnet ([213.177.199.100])
        by smtp.gmail.com with ESMTPSA id j4sm17718376wrn.83.2020.11.23.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:40:33 -0800 (PST)
From:   Daniel =?ISO-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
To:     a.zummo@towertech.it
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org
Subject: [PATCH 1/2] rtc: rs5c372: support alarms up to 1 week
Date:   Mon, 23 Nov 2020 11:38:44 +0100
Message-ID: <2876529.n6mMd1HPca@tool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Ricoh R2221x, R2223x, RS5C372, RV5C387A chips can handle 1 week
alarms.

Read the "wday" alarm register and convert it to a date to support up 1
week in our driver.

Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
=2D--
 drivers/rtc/rtc-rs5c372.c | 48 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 3bd6eaa0d..94b778c6e 100644
=2D-- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -393,7 +393,9 @@ static int rs5c_read_alarm(struct device *dev, struct r=
tc_wkalrm *t)
 {
 	struct i2c_client	*client =3D to_i2c_client(dev);
 	struct rs5c372		*rs5c =3D i2c_get_clientdata(client);
=2D	int			status;
+	int			status, wday_offs;
+	struct rtc_time 	rtc;
+	unsigned long 		alarm_secs;
=20
 	status =3D rs5c_get_regs(rs5c);
 	if (status < 0)
@@ -403,6 +405,30 @@ static int rs5c_read_alarm(struct device *dev, struct =
rtc_wkalrm *t)
 	t->time.tm_sec =3D 0;
 	t->time.tm_min =3D bcd2bin(rs5c->regs[RS5C_REG_ALARM_A_MIN] & 0x7f);
 	t->time.tm_hour =3D rs5c_reg2hr(rs5c, rs5c->regs[RS5C_REG_ALARM_A_HOURS]);
+	t->time.tm_wday =3D ffs(rs5c->regs[RS5C_REG_ALARM_A_WDAY] & 0x7f) - 1;
+
+	/* determine the day, month and year based on alarm wday, taking as a
+	 * reference the current time from the rtc
+	 */
+	status =3D rs5c372_rtc_read_time(dev, &rtc);
+	if (status < 0)
+		return status;
+
+	wday_offs =3D t->time.tm_wday - rtc.tm_wday;
+	alarm_secs =3D mktime64(rtc.tm_year + 1900,
+			      rtc.tm_mon + 1,
+			      rtc.tm_mday + wday_offs,
+			      t->time.tm_hour,
+			      t->time.tm_min,
+			      t->time.tm_sec);
+
+	if (wday_offs < 0 || (wday_offs =3D=3D 0 &&
+			      (t->time.tm_hour < rtc.tm_hour ||
+			       (t->time.tm_hour =3D=3D rtc.tm_hour &&
+				t->time.tm_min <=3D rtc.tm_min))))
+		alarm_secs +=3D 7 * 86400;
+
+	rtc_time64_to_tm(alarm_secs, &t->time);
=20
 	/* ... and status */
 	t->enabled =3D !!(rs5c->regs[RS5C_REG_CTRL1] & RS5C_CTRL1_AALE);
@@ -417,12 +443,20 @@ static int rs5c_set_alarm(struct device *dev, struct =
rtc_wkalrm *t)
 	struct rs5c372		*rs5c =3D i2c_get_clientdata(client);
 	int			status, addr, i;
 	unsigned char		buf[3];
+	struct rtc_time 	rtc_tm;
+	unsigned long 		rtc_secs, alarm_secs;
=20
=2D	/* only handle up to 24 hours in the future, like RTC_ALM_SET */
=2D	if (t->time.tm_mday !=3D -1
=2D			|| t->time.tm_mon !=3D -1
=2D			|| t->time.tm_year !=3D -1)
+	/* chip only can handle alarms up to one week in the future*/
+	status =3D rs5c372_rtc_read_time(dev, &rtc_tm);
+	if (status)
+		return status;
+	rtc_secs =3D rtc_tm_to_time64(&rtc_tm);
+	alarm_secs =3D rtc_tm_to_time64(&t->time);
+	if (alarm_secs >=3D rtc_secs + 7 * 86400) {
+		dev_err(dev, "%s: alarm maximum is one week in the future (%d)\n",
+			__func__, status);
 		return -EINVAL;
+	}
=20
 	/* REVISIT: round up tm_sec */
=20
@@ -443,7 +477,9 @@ static int rs5c_set_alarm(struct device *dev, struct rt=
c_wkalrm *t)
 	/* set alarm */
 	buf[0] =3D bin2bcd(t->time.tm_min);
 	buf[1] =3D rs5c_hr2reg(rs5c, t->time.tm_hour);
=2D	buf[2] =3D 0x7f;	/* any/all days */
+	/* each bit is the day of the week, 0x7f means all days */
+	buf[2] =3D (t->time.tm_wday >=3D 0 && t->time.tm_wday < 7) ?
+		  BIT(t->time.tm_wday) : 0x7f;
=20
 	for (i =3D 0; i < sizeof(buf); i++) {
 		addr =3D RS5C_ADDR(RS5C_REG_ALARM_A_MIN + i);
=2D-=20
2.29.2




