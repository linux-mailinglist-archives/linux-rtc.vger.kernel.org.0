Return-Path: <linux-rtc+bounces-2064-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5063987332
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Sep 2024 14:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E84811C21176
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Sep 2024 12:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F1D15B97B;
	Thu, 26 Sep 2024 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuu0tsT6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B41547D5;
	Thu, 26 Sep 2024 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352104; cv=none; b=ippnOk5l6vacY0v9fmr5rm4nhN+kDBV2Wp52WtHf0RGUYsMZTHyGnems1pHfvuDoVhZHDuF6mmiTzUjhBqdN5PK6utJpONO+fBNTR5XzsNlotO9z4buMZfAP9oVxIqmOpQ4/D3oSuoZt8BAy+rQlZgxg8HVlV3pgbMIZFRsB7Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352104; c=relaxed/simple;
	bh=Qtejn4ejaDVxmir4gnJLy1kmqVogaotwsTP/3Zg5i3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=igEmncMoDZJErc4COcOqBOhkufddwDI2yQXcbeUqKFU+V9LnRebxqsaPvS6GBaEtk4KdOrt7+GiRHw6/CKnSASGJkINmvC3oqkNBC0cnnaT6hADM9avEMbf+HGqjvJQAD0J/AzLAUqgce38SVAJz49BJf76KUvZ9NXBvC1rV9mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuu0tsT6; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f761461150so13958781fa.0;
        Thu, 26 Sep 2024 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727352101; x=1727956901; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJFMXan8tq9MCYTMLc/4X+wh6+u+NZsDcvLMiDaglKs=;
        b=fuu0tsT6K7LIAkBC4H4p2YjYNugmGi48fDzCq6aM3jAU4VfZ6n9bTZh1AcULZpGH7E
         N2l/zfDtRuYCdTK6nA8o0/T51e6BK14Nbyhx2mIGwGeaaNvYOHeEh4+teZ6nbmL5FibY
         MwefFL3SO0xn3+rG6WDgYvZf0htXOd0kqhbGbklkrpkesh4DvOhSlkOJ0qP2oC1Xi8iK
         T5a6luw3e/HoF1K/5YTJw2ZKT4wj57CGsDFbkVWCgHzXUmLwTdFU4jKYrVXWep0GQ9CY
         wnfA/zIv4g7L01z54jetFGKhNw1vjMy8UNDUxCPWs9YRjSWpuCI/76a00tSWnOT2whLy
         0Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727352101; x=1727956901;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJFMXan8tq9MCYTMLc/4X+wh6+u+NZsDcvLMiDaglKs=;
        b=qQS64/99R2iQLcAcZZY+bhP7xXb/rZ+ZTt0/kz6Xq+AkNl84+7df8jxqlU+6frxRO4
         vuheXQ/0eKV/ZGgBZvg3oUPX8Sny5GtOGQqdO2ZqfRJWaelkA7FctUjexEw8N2BNJVIi
         yc3gWS2EvaaKEVoWWbzgv790Y61b9BLdquSal8SItzCtFnD+9oyQFgIM68yTmBamsPAj
         q6JdCPtPzZPOKylnlW+tMoBXwEJlD6NEjUiJGxv+6jh6eNDCNcbz6lX5+TpMbeRGTXFQ
         4dtfz3aB3pOhAue7DPkwAurhM5sIUON05vm0zPSWRleb7QQTDZznBKR9fQrQMmFuW/04
         tVDw==
X-Forwarded-Encrypted: i=1; AJvYcCUn9SDAFOmBE27QdbDrHRAqKfuFX4lY2pUba+WarX0QmjRRiVWK/bZG4DzOU/CYscQ/9SblrSpbVB7mjjI=@vger.kernel.org, AJvYcCXYlQNmeKmwug3DVVslolqYXfA08q0oq1Pw8S7rrxDqXuOdRgTLY/Q8CExwxRmZyRP5Cabyw1JpSfM2@vger.kernel.org
X-Gm-Message-State: AOJu0YxmMh3BULyiRPt8xSPxfNAdbRMiy+JQSPAlie+f4v8zeFaj1vtn
	lkouIn/M6X6OVBNZVFTdlnSqOob+eVTHEZWj7n80bDANoGMbv4SBfGl88Q==
X-Google-Smtp-Source: AGHT+IFRYQrVx1ENjdeuxcQCQvovc1lCDV1v4+bjnOOhUSNllWE/tkhsYsczQSxLEeQzY/4TwrL3UQ==
X-Received: by 2002:ac2:4f13:0:b0:536:73b5:d961 with SMTP id 2adb3069b0e04-53877566349mr5700929e87.54.1727352100306;
        Thu, 26 Sep 2024 05:01:40 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e04a6sm780427e87.38.2024.09.26.05.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:01:37 -0700 (PDT)
Date: Thu, 26 Sep 2024 15:01:13 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Lee Jones <lee@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
Message-ID: <ZvVNCfk10ih0YFLW@fedora>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AWcGuu0+Dem7phy0"
Content-Disposition: inline


--AWcGuu0+Dem7phy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A few ROHM PMICs have an RTC block which can be controlled by the
rtc-bd70528 driver. The RTC driver needs the alarm interrupt information
=66rom the parent MFD driver. The MFD driver provides the interrupt
information as a set of named interrupts, where the name is of form:
<PMIC model>-rtc-alm-<x>, where x is an alarm block number.

=46rom the RTC driver point of view it is irrelevant what the PMIC name
is. It is sufficient to know this is alarm interrupt for a block X. The
PMIC model information is carried to RTC via the platform device ID.
Hence, having the PMIC model in the interrupt name is only making things
more complex because the RTC driver needs to request differently named
interrupts on different PMICs, making code unnecessary complicated.

Simplify this slightly by always using the RTC driver name 'bd70528' as
the prefix for alarm interrupts, no matter what the exact PMIC model is,
and always request the alarm interrupts of same name no matter what the
PMIC model is.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
This contains both the RTC and MFD changes in order to not break the
functionality between commits to different subsystems.

Changes are based to stuff being merged in for v6.12-rc1. I can rebase
and re-spin when 6.12-rc1 is out if needed.
---
 drivers/mfd/rohm-bd71828.c | 12 ++++++------
 drivers/rtc/rtc-bd70528.c  |  5 +----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 39f7514aa3d8..738d8b3b9ffe 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -32,15 +32,15 @@ static struct gpio_keys_platform_data bd71828_powerkey_=
data =3D {
 };
=20
 static const struct resource bd71815_rtc_irqs[] =3D {
-	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd71815-rtc-alm-0"),
-	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd71815-rtc-alm-1"),
-	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC2, "bd71815-rtc-alm-2"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd70528-rtc-alm-0"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd70528-rtc-alm-1"),
+	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC2, "bd70528-rtc-alm-2"),
 };
=20
 static const struct resource bd71828_rtc_irqs[] =3D {
-	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd71828-rtc-alm-0"),
-	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd71828-rtc-alm-1"),
-	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd71828-rtc-alm-2"),
+	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC0, "bd70528-rtc-alm-0"),
+	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC1, "bd70528-rtc-alm-1"),
+	DEFINE_RES_IRQ_NAMED(BD71828_INT_RTC2, "bd70528-rtc-alm-2"),
 };
=20
 static struct resource bd71815_power_irqs[] =3D {
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 59b627fc1ecf..954ac4ef53e8 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -236,7 +236,6 @@ static int bd70528_probe(struct platform_device *pdev)
 {
 	struct bd70528_rtc *bd_rtc;
 	const struct rtc_class_ops *rtc_ops;
-	const char *irq_name;
 	int ret;
 	struct rtc_device *rtc;
 	int irq;
@@ -259,7 +258,6 @@ static int bd70528_probe(struct platform_device *pdev)
=20
 	switch (chip) {
 	case ROHM_CHIP_TYPE_BD71815:
-		irq_name =3D "bd71815-rtc-alm-0";
 		bd_rtc->reg_time_start =3D BD71815_REG_RTC_START;
=20
 		/*
@@ -276,7 +274,6 @@ static int bd70528_probe(struct platform_device *pdev)
 		hour_reg =3D BD71815_REG_HOUR;
 		break;
 	case ROHM_CHIP_TYPE_BD71828:
-		irq_name =3D "bd71828-rtc-alm-0";
 		bd_rtc->reg_time_start =3D BD71828_REG_RTC_START;
 		bd_rtc->bd718xx_alm_block_start =3D BD71828_REG_RTC_ALM_START;
 		hour_reg =3D BD71828_REG_RTC_HOUR;
@@ -286,7 +283,7 @@ static int bd70528_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
=20
-	irq =3D platform_get_irq_byname(pdev, irq_name);
+	irq =3D platform_get_irq_byname(pdev, "bd70528-rtc-alm-0");
=20
 	if (irq < 0)
 		return irq;

base-commit: abf2050f51fdca0fd146388f83cddd95a57a008d
--=20
2.45.2


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--AWcGuu0+Dem7phy0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmb1TPYACgkQeFA3/03a
ocXM2wf/TJsvnxsoKL3yZQ7TUg2mD3Z5ZPUBICLPmvYDzTClzXG2QyAFNtk+4uXf
XsnP1/gyrdHogyprRA+0B7vFlCT8F7ZS+GXRlOH++nCF+OxJWURLDB4CMh2F5Ib9
gaBvjN/bOPP+cvXdgHmFIyp0pAc8Jd1mlYjweUXxNwyjK7qNzxImAPc8EOpOReY6
9gG6xRFnae20+DID56GszMuHhgYEUWU392rSSJmecSeq3HuS5PZ+fdKKHmesJN28
Gqc7YaP2pQQXroRQ0++DclxHLwBpCqePa96qBY3idkWL2U6i+e+MgviNzFBzDMri
stv5XDac4cxEyGj63r2MHNe46LL5rQ==
=9uG7
-----END PGP SIGNATURE-----

--AWcGuu0+Dem7phy0--

