Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A8722E339
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jul 2020 01:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgGZXNO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 26 Jul 2020 19:13:14 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48503 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgGZXNO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 26 Jul 2020 19:13:14 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 58CAB891B0;
        Mon, 27 Jul 2020 11:13:09 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1595805189;
        bh=Wp+Zo0Glxzh1xirvrVu2neQRYBub3jLZKClW8M+YdYk=;
        h=From:To:Cc:Subject:Date;
        b=cbxFefq0E94SuYeBWloFTwntCR5et+YQWZVleBnC4XjjzXW2M46PD6ixqlC+P42Bi
         LcsGx75vdW/bUHzEZyGd8O/tAY8DozXjv7Z6pdm0pAgiS6w4hHSsolb+W38N4GbwZ6
         JrTOo9mFrceKWfVSH5IyUVrO96SgswgGSPfDGrlAypXrwzHvF5yVMc9Lv7B05qqKPd
         MUKEmtbbWxGi5BvqR1qpoU+2wqD5l4EaSe5Awp627sx8+8AN2acHpY0d3SESM5emUX
         PmLR4fTsSGJOc5ge/uqsopyJqjxI9jKfZDJDVBk+WAbkbWvGoCY5vhp2sngHmL8/SA
         jLdiaVedixxUg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f1e0e060000>; Mon, 27 Jul 2020 11:13:10 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id F3CCE13EEA1;
        Mon, 27 Jul 2020 11:13:08 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1D592280079; Mon, 27 Jul 2020 11:13:09 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux@roeck-us.net
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2] rtc: ds1307: provide an indication that the watchdog has fired
Date:   Mon, 27 Jul 2020 11:13:06 +1200
Message-Id: <20200726231306.734-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There's not much feedback when the ds1388 watchdog fires. Generally it
yanks on the reset line and the board reboots. Capture the fact that the
watchdog has fired in the past so that userspace can retrieve it via
WDIOC_GETBOOTSTATUS. This should help distinguish a watchdog triggered
reset from a power interruption.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- Set bootstatus to WDIOF_CARDRESET and let userspace decide what to do w=
ith
  the information.

 drivers/rtc/rtc-ds1307.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 49702942bb08..209736db510d 100644
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
+		wdt_dev->bootstatus =3D WDIOF_CARDRESET;
=20
 	ret =3D regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
 				 DS1388_BIT_WF, 0);
--=20
2.27.0

