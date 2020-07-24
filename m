Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B0E22BD2A
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jul 2020 06:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgGXEuY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 24 Jul 2020 00:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgGXEuY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 24 Jul 2020 00:50:24 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27E4C0619E3
        for <linux-rtc@vger.kernel.org>; Thu, 23 Jul 2020 21:50:23 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5B8C1891AE;
        Fri, 24 Jul 2020 16:50:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1595566220;
        bh=xBR9lydTuvfdjbHLpTaoL2pHDB7y89FzJEoZflkJcnY=;
        h=From:To:Cc:Subject:Date;
        b=Q22v6Maa/yVNF2x2ibLesaSfHoFKkt8PHl9rEYmWP1AofOJvqBp8nx0f7q6qXI5h7
         A7tvbXdapFKL0bM1fwNIj0pYbl+y6sNJQzdlQw9spIV1NazYWX6aDjsu6GrSpv0AJ0
         yvFb1phwv29T39V5iiRoNwnnYcM9dazJy/jrAtNsl/2VWgDmIilfJS/Jw+AEPQ8wo2
         AHmYtSvHjsX4nRS9odoglah6ILDv1aKg8htgQy7IUA2sXl7IRDRIzuGFZ8v1tmO/ln
         Q0Ekhp/oeUkMoDeGj8HSpXwLyWpRpEJk80YHtTZMXzK2tqElgbq0ngn5U9TBJ57T8+
         viuem0ruSmUPw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f1a68870000>; Fri, 24 Jul 2020 16:50:20 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id CC8E313EF9C;
        Fri, 24 Jul 2020 16:50:14 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1C341280079; Fri, 24 Jul 2020 16:50:15 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] rtc: ds1307: provide an indication that the watchdog has fired
Date:   Fri, 24 Jul 2020 16:50:09 +1200
Message-Id: <20200724045009.7293-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There's not much feedback when the ds1388 watchdog fires. Generally it
yanks on the reset line and the board reboots. To provide some feedback
indicate that the watchdog has fired in the past. This should help
distinguish a watchdog triggered reset from a power interruption.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/rtc/rtc-ds1307.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 49702942bb08..431b1a50c483 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -868,6 +868,14 @@ static int ds1388_wdt_start(struct watchdog_device *=
wdt_dev)
 	struct ds1307 *ds1307 =3D watchdog_get_drvdata(wdt_dev);
 	u8 regs[2];
 	int ret;
+	int val;
+
+	ret =3D regmap_read(ds1307->regmap, DS1388_REG_FLAG, &val);
+	if (ret)
+		return ret;
+
+	if (val & DS1388_BIT_WF)
+		dev_notice(ds1307->dev, "detected watchdog alarm flag\n");
=20
 	ret =3D regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
 				 DS1388_BIT_WF, 0);
--=20
2.27.0

