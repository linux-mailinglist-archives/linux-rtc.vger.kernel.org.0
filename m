Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E107322E487
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jul 2020 05:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgG0DqW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 26 Jul 2020 23:46:22 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:49679 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgG0DqW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 26 Jul 2020 23:46:22 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 341A9891AD;
        Mon, 27 Jul 2020 15:46:17 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1595821577;
        bh=MywvN3R7ImwNGUm6gdbp7R4JmN5HK8Bmgrie8Wzx3zg=;
        h=From:To:Cc:Subject:Date;
        b=1U3QnYpt7IEJvdQWcVBHz8SGuQnXEIP6HWyqDwqmZh6Vqp5mHTK0Vvw+ot7P0GvcJ
         6WGgT9A3eYdLZIjfvTia5qu2n6Mc0Q4AvpSzcDkS3vBI7FOmb1q8Nt1h6zGFZgzKtR
         hnBEUyUG0oV1kticYCm9lL3Swxkey4vq92dN6ox0ECi48YQdQ05zyg+2PJmKvRCqIT
         +Ok0teLDu5O0LDb0hAdg19DSZNlVwrIf8KzIl+/lDEnZwz1F1XMD9CdCQ9ioxEgEMw
         irMeHucJ42lcJ/HhU/mRZxdbK9K2cRP5MjfAq3jcJsvXDD/Mc1N1D5YwoyohoA7k+o
         x9jOUqQB20B0A==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f1e4e090000>; Mon, 27 Jul 2020 15:46:17 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id BC1EF13EEA1;
        Mon, 27 Jul 2020 15:46:16 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 03DC1280077; Mon, 27 Jul 2020 15:46:16 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux@roeck-us.net
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3] rtc: ds1307: provide an indication that the watchdog has fired
Date:   Mon, 27 Jul 2020 15:46:14 +1200
Message-Id: <20200727034615.19755-1-chris.packham@alliedtelesis.co.nz>
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
Changes in v3:
- Check for watchdog flag in ds1307_wdt_register()
Changes in v2:
- Set bootstatus to WDIOF_CARDRESET and let userspace decide what to do w=
ith
  the information.

 drivers/rtc/rtc-ds1307.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 49702942bb08..54c85cdd019d 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1668,6 +1668,8 @@ static const struct watchdog_ops ds1388_wdt_ops =3D=
 {
 static void ds1307_wdt_register(struct ds1307 *ds1307)
 {
 	struct watchdog_device	*wdt;
+	int err;
+	int val;
=20
 	if (ds1307->type !=3D ds_1388)
 		return;
@@ -1676,6 +1678,10 @@ static void ds1307_wdt_register(struct ds1307 *ds1=
307)
 	if (!wdt)
 		return;
=20
+	err =3D regmap_read(ds1307->regmap, DS1388_REG_FLAG, &val);
+	if (!err && val & DS1388_BIT_WF)
+		wdt->bootstatus =3D WDIOF_CARDRESET;
+
 	wdt->info =3D &ds1388_wdt_info;
 	wdt->ops =3D &ds1388_wdt_ops;
 	wdt->timeout =3D 99;
--=20
2.27.0

