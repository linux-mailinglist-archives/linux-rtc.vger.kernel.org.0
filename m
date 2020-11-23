Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC0B2C0382
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Nov 2020 11:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgKWKkd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Nov 2020 05:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgKWKkc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Nov 2020 05:40:32 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890C2C0613CF
        for <linux-rtc@vger.kernel.org>; Mon, 23 Nov 2020 02:40:32 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id s8so18045602wrw.10
        for <linux-rtc@vger.kernel.org>; Mon, 23 Nov 2020 02:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=40LRMRXJpEquK55kz/fbNP/yDC1JkUoQT5oyO3TBh40=;
        b=IvH8i6ZK3cJCXanvHd/DqIMjcGe6c1hl2d9PJgluF5mmYrBnbbpuPCGj2zRod2tWS/
         OniWrdOrWuyW8H4sPqb0UApBsSHahlz0Sbx9fRVPUy8HbbEPw1wLSiAmZYEt/0pA6R8/
         6hn++nYnARQEk9yDOzpUtWDBQLDIjxbudoXV0EyJJg7sDxstC1wghQhXs4R5umqwwp9z
         mPcgj4O3f9aBNjN27mMzJslaKHe+nr7BepcCznrBil2xPxGqZLhD/8gxDGsgbC2ROR91
         NqGl3iA9rE+lYpIn/IIUpa4v8L/HNex5D5GKlIFVt0/UdaLB4GHP65e5RpTS5QSfsClf
         LhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=40LRMRXJpEquK55kz/fbNP/yDC1JkUoQT5oyO3TBh40=;
        b=mmaRoni4abHDCOKisYZKhSSWUqsnbLs8jUuizAJROWLBrS0yOG8yWPThAzsYklkjNg
         uuipCxj1GO9WLiWUmAuymrharA7xj8rcA0js1nEmiBTt4kCKy4xcpMeRyCslnCIpZxbg
         roZwlUe5TuIwTTHiGeO0dQHdqRt6oYlkkjdEuy/xdiVrEtsecNJuFJqi5F0ftcfPNNw0
         0JygEQ/1PifgPqnnuazu/BxIOFbWEQMn4iQMc+Rz5MrSIc+Gabn8QIJor6sa6j5Nu8ux
         Mr+HrW3xQ/ZMjvu26KWdctgHwAVrAvwQtVAsrudMnCrSo6LXe6XXSWVK7hywzzdQmzjG
         Y/KQ==
X-Gm-Message-State: AOAM531rzaFv8CKHMEhe17zWK9lqWEs0g0s5Nt4hvne/tWfNUU+WNS/2
        EKK/r4OCOAkugfg+T0YW0po=
X-Google-Smtp-Source: ABdhPJz7EdgST/jnBnTEcCJwHo7zBiKcQvX7N47IL2SNMWyf8KDUHZBekd/rti3T7W8NQikR5ICLCg==
X-Received: by 2002:adf:9043:: with SMTP id h61mr30944271wrh.237.1606128031350;
        Mon, 23 Nov 2020 02:40:31 -0800 (PST)
Received: from tool.localnet ([213.177.199.100])
        by smtp.gmail.com with ESMTPSA id l3sm17589521wmf.0.2020.11.23.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 02:40:30 -0800 (PST)
From:   Daniel =?ISO-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
To:     a.zummo@towertech.it
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org
Subject: [PATCH 2/2] rtc: rs5c372: let the alarm to be used as wakeup source
Date:   Mon, 23 Nov 2020 11:38:48 +0100
Message-ID: <2324307.0LpMOBvr9T@tool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Currently there is no use for the interrupts on the rs5c372 RTC and the
wakealarm isn't enabled. There are some devices like NAS which use this
RTC to wake up from the power off state when the INTR pin is activated by
the alarm clock.

Enable the alarm and let to be used as a wakeup source. Tested on a Buffalo
LS421DE NAS.

Signed-off-by: Daniel Gonz=C3=A1lez Cabanelas <dgcbueu@gmail.com>
=2D--
 drivers/rtc/rtc-rs5c372.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
index 94b778c6e..76775d66e 100644
=2D-- a/drivers/rtc/rtc-rs5c372.c
+++ b/drivers/rtc/rtc-rs5c372.c
@@ -654,6 +654,7 @@ static int rs5c372_probe(struct i2c_client *client,
 	int err =3D 0;
 	int smbus_mode =3D 0;
 	struct rs5c372 *rs5c372;
+	bool rs5c372_can_wakeup_device =3D false;
=20
 	dev_dbg(&client->dev, "%s\n", __func__);
=20
@@ -689,6 +690,12 @@ static int rs5c372_probe(struct i2c_client *client,
 	else
 		rs5c372->type =3D id->driver_data;
=20
+#ifdef CONFIG_OF
+	if(of_property_read_bool(client->dev.of_node,
+					      "wakeup-source"))
+		rs5c372_can_wakeup_device =3D true;
+#endif
+
 	/* we read registers 0x0f then 0x00-0x0f; skip the first one */
 	rs5c372->regs =3D &rs5c372->buf[1];
 	rs5c372->smbus =3D smbus_mode;
@@ -722,6 +729,8 @@ static int rs5c372_probe(struct i2c_client *client,
 		goto exit;
 	}
=20
+	rs5c372->has_irq =3D 1;
+
 	/* if the oscillator lost power and no other software (like
 	 * the bootloader) set it up, do it here.
 	 *
@@ -748,6 +757,10 @@ static int rs5c372_probe(struct i2c_client *client,
 			);
=20
 	/* REVISIT use client->irq to register alarm irq ... */
+	if (rs5c372_can_wakeup_device) {
+		device_init_wakeup(&client->dev, true);
+	}
+
 	rs5c372->rtc =3D devm_rtc_device_register(&client->dev,
 					rs5c372_driver.driver.name,
 					&rs5c372_rtc_ops, THIS_MODULE);
@@ -761,6 +774,9 @@ static int rs5c372_probe(struct i2c_client *client,
 	if (err)
 		goto exit;
=20
+	/* the rs5c372 alarm only supports a minute accuracy */
+	rs5c372->rtc->uie_unsupported =3D 1;
+
 	return 0;
=20
 exit:
=2D-=20
2.29.2




