Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41938F2414
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Nov 2019 02:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbfKGBNC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Nov 2019 20:13:02 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48993 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKGBNB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 Nov 2019 20:13:01 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3CA908365A;
        Thu,  7 Nov 2019 14:12:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1573089176;
        bh=BRGEYlyoHZxHSnXUdYbHANXyj64ZkbYo9cpJq3/Hmcs=;
        h=From:To:Cc:Subject:Date;
        b=q1dvCrlDc9Tclr+trmoR0TahhRju1SeYal0jv5KCqXXT+PaGDXZrVe01gQsicEy4e
         44LY2myFUIImDyHMeMi0uEy+HN3zs39ZD6KiJUienQpork3lPsa6mrQX7fbfp/mpS2
         Z1H+sI8UR42dBVZYh7eEuDZcGr117dkgajptclnTaL3kry6XTIHi35e1gleNicGD9h
         0++AXdyjdWe+yJgwOg0dMYhlSirvnzbDo0cYfBCijSEFvmLj41iRaj9VTilhjE0Qmb
         aBdcN/4bsTZ0djEvqRKi1UPc8rhvsUzXGCxIcTY0Q0r3ZHif+vXkk1o74vq2tWbMKe
         P6vqHsu2mv0TA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dc36f950000>; Thu, 07 Nov 2019 14:12:56 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 9A15213EEEB;
        Thu,  7 Nov 2019 14:12:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id F3EAC28005F; Thu,  7 Nov 2019 14:12:52 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        John Collis <john.collis@alliedtelesis.co.nz>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] rtc: ds1307: check for oscillator fault on ds1388
Date:   Thu,  7 Nov 2019 14:12:45 +1300
Message-Id: <20191107011245.26796-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Ensure that the oscillator is running and check the OSF bit for the
ds1388 variant. The FLAG and CONTROL registers are at a different
location to the other supported RTCs so this requires an extra case in
the existing switch statement.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/rtc/rtc-ds1307.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 1f7e8aefc1eb..865c06347d0a 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -101,6 +101,10 @@ enum ds_type {
 #	define DS1337_BIT_A2I		0x02
 #	define DS1337_BIT_A1I		0x01
 #define DS1339_REG_ALARM1_SECS	0x07
+#define DS1388_REG_FLAG		0x0b
+#	define DS1388_BIT_OSF		0x80
+#define DS1388_REG_CONTROL	0x0c
+#	define DS1388_BIT_nEOSC		0x80
=20
 #define DS13XX_TRICKLE_CHARGER_MAGIC	0xa0
=20
@@ -1688,6 +1692,26 @@ static int ds1307_probe(struct i2c_client *client,
 		}
 		break;
=20
+	case ds_1388:
+		err =3D regmap_bulk_read(ds1307->regmap, DS1388_REG_FLAG,
+				       regs, 2);
+		if (err) {
+			dev_dbg(ds1307->dev, "read error %d\n", err);
+			goto exit;
+		}
+
+		if (regs[1] & DS1388_BIT_nEOSC) {
+			regmap_write(ds1307->regmap, DS1388_REG_CONTROL,
+				     regs[1] & ~DS1388_BIT_nEOSC);
+		}
+
+		if (regs[0] & DS1388_BIT_OSF) {
+			regmap_write(ds1307->regmap, DS1388_REG_FLAG,
+				     regs[0]  & ~DS1388_BIT_OSF);
+			dev_warn(ds1307->dev, "SET TIME!\n");
+		}
+		break;
+
 	case rx_8025:
 		err =3D regmap_bulk_read(ds1307->regmap,
 				       RX8025_REG_CTRL1 << 4 | 0x08, regs, 2);
--=20
2.24.0

