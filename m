Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAF9245A27
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Aug 2020 01:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgHPX5k (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 16 Aug 2020 19:57:40 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:47188 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgHPX5j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 16 Aug 2020 19:57:39 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2D25F806B6;
        Mon, 17 Aug 2020 11:57:34 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1597622254;
        bh=JhXIFBqKeT7URz6eflkuIZsdIt3uBksb0ispn1x1xTk=;
        h=From:To:Cc:Subject:Date;
        b=ZTmL/jg0TgMZmwa2D+p6g4e6h/9m7a7rOGt0jct1upuAZyQURrFJgRiPyyo1+gkR2
         swwr67p3h6sPYiKKxzdYccDtFw6QRWxe6scq2YDg0gfHvqMEo4QKvK8mCJ0+FzPMpM
         r4Xl5CgQtIr83Hu2/4eHLTBtZzO29/dfm3sPKRzWHqcbE0QBh7bD18GuW88O+kZVqO
         pajI+oy0cJvjkbBAW/8CyNBV3ctIKAKqHa0jO8c3AssVwuR03f3PhaMnrQCGXZKqfI
         IUgndDi7x0goUm8ybo6tbmeL0D6D3+zMYTLV/j4OYU90UmPt9DHubeQfyVTM1wgBDN
         1SDBODP89HZ6Q==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f39c7ee0000>; Mon, 17 Aug 2020 11:57:34 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 6959113ED33;
        Mon, 17 Aug 2020 11:57:33 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id F365A28005D; Mon, 17 Aug 2020 11:57:33 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] rtc: ds1307: Ensure oscillator is enabled for DS1388
Date:   Mon, 17 Aug 2020 11:57:31 +1200
Message-Id: <20200816235731.21071-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Similar to the other variants the DS1388 has a bit to stop the
oscillator to reduce the power consumption from VBAT. Ensure that the
oscillator is enabled when the system is up.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/rtc/rtc-ds1307.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 54c85cdd019d..2182f4e97c0a 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -153,6 +153,7 @@ enum ds_type {
 #define DS1388_REG_CONTROL		0x0c
 #	define DS1388_BIT_RST		BIT(0)
 #	define DS1388_BIT_WDE		BIT(1)
+#	define DS1388_BIT_nEOSC		BIT(7)
=20
 /* negative offset step is -2.034ppm */
 #define M41TXX_NEG_OFFSET_STEP_PPB	2034
@@ -1881,6 +1882,19 @@ static int ds1307_probe(struct i2c_client *client,
 				     DS1307_REG_HOUR << 4 | 0x08, hour);
 		}
 		break;
+	case ds_1388:
+		err =3D regmap_read(ds1307->regmap, DS1388_REG_CONTROL, &tmp);
+		if (err) {
+			dev_dbg(ds1307->dev, "read error %d\n", err);
+			goto exit;
+		}
+
+		/* oscillator off?  turn it on, so clock can tick. */
+		if (tmp & DS1388_BIT_nEOSC) {
+			tmp &=3D ~DS1388_BIT_nEOSC;
+			regmap_write(ds1307->regmap, DS1388_REG_CONTROL, tmp);
+		}
+		break;
 	default:
 		break;
 	}
--=20
2.28.0

