Return-Path: <linux-rtc+bounces-5177-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83800C0D448
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 12:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 380B34F7C9E
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 11:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40C42FF658;
	Mon, 27 Oct 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzn0a5qA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3C2FE58A
	for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565589; cv=none; b=gHV3PLR2n4pFSr2JICFX7WqGpnCZSg3b9+yQrtVsUjCdi0OQvbvg0VpPEbugnKo2CRG3ZrSs4zMe+qqUmwUs31PocwsDal+uZsgZoagBqy+ARz3z74kT3ZVdddioQh+azkhLCuInajJbqrYIXcck/S/G1eVPDrYWFdNlnFfPADA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565589; c=relaxed/simple;
	bh=X8Txm7kc9NXs2r256KmcYLuDmAR0emVi9S0sVtw0zWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaSQD6gaDCv/sMXP6m0SzPCbr9I0LFN2r6q5HSXbEomriqcAq9equrgfMWrWCO7MKmrfD2R+D/Rj+PoAY5kDxKKigCfM0ZB8sgtoYLOVbpI07tW68PQKxf+DibG3LR4EJ+gLL9+3AfNVS2geTFxEWZcw2IwwV89i3BtGaeQcGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zzn0a5qA; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-378d50e1c82so45928401fa.3
        for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 04:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565586; x=1762170386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q8/LJkLd6VtsTiiJs7/2Xg8b/Gt7K4vmantUteWzghg=;
        b=Zzn0a5qACylBxIJxs7qh0SSk247rpH3cEUne5bvCp8DQ+wwZUfPPpm9EgJJqcStFVB
         nSAgGecjNY98RMeECl8/vErgBsrnVhliFDH+1v66fPDiqx43cRdRCXnDmeiNWa11gCJw
         GnBxYEuqcy4wAEXUPRQsirWKE7ZzOwBd3Q/bkwVbEFguEGCESgf1KR19GKfY6DKKmiyX
         GPj0GAmVbpZQzrAE2oph7TxEe7ml5pu6jxCNAdcnct0VFd6b85ccGQna0c0rmzRS42Q7
         pP5i/O+iq5AGkIPd8fk7XDzknD1vuiy+Xtb9DOluLKVdmdZ994XWaDaoyydXKmtFCF+i
         h0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565586; x=1762170386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8/LJkLd6VtsTiiJs7/2Xg8b/Gt7K4vmantUteWzghg=;
        b=g+5du7G0sILCN6vgy5c32GQydWXCy/RJgR1im0RtbTKKNUMLtznmBVnOE3ntCtOisn
         bzmqJEOP9SIqdEdBaklmLIO0PHyehkpQmoFaeXTC21v7GujQB1Rr7/r2WSQ0qPyWse5u
         n+S4EQt/GphLJOf6PE72Niwx8tTwrHlu1MpSuWt1skJan7pIH6YPXZFQX06HgZzSfq2Y
         0ivA6d2j6yvDLfm314buV8XX1mu1Z757nPM4B1FDhoPYbJ1QUYNcQNRg5ylqb1KHsxUX
         ACZ5sOs4qKCf84UBAQFtMSLOvDmitahVz5yKbmyTgns0PDqn5P75sOx2xhB5ND+h0JOM
         HYow==
X-Forwarded-Encrypted: i=1; AJvYcCVZXafeJUCSevvOaC9SvRGhgCUlkmkapECU040vKZZ0APkF+y0ZtyidYjtpddW5kd88wF1Aoe0iKvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/chJYrgkPbP4DdmBQUPy2oboxgVLw8gdDWaTpSvzy90fBCBE
	wbesxbvGq49glw/3dThczkoDkvtAULyJBSg+hwaHK9Bm/+imZSB6qPlq
X-Gm-Gg: ASbGncshagqwEz525gyjNHUrt4Cri7iuNYg9Uda8f+/B38+65379NOv4udiuHn73xpb
	bLeuKbvWz3e6loQXv1jRxyrhTxquMYY46A+UuG35VVJ1cm7qcJsMeKRSqEWZ2XxzoB9azM45JEg
	C+QTVS0eAJpW6iX4q0qI4Xi6f8IRPhKj5F8N1IsD54A2e68p44ppZNELIYKegHunCKiPuK1ylgI
	RXpNVoUEef6NFesaGFs7Itvt/I/XdK6oCWz6hnVrByEJcQs6mjVIioDvz3kWUNcmzQga8WBnYsI
	CA+LwdS1Uoq31LMgeRIx9BcB/oj8kT+f8p48BlrRbiO7g+xFIeKVBhcBq8c4pAnw1KW/1P1Ztas
	qNyQpexqtcVvUrLuK2DobOLEYBITpJKKGMIsQWNg917nEai5NCoi+OrPg8YHUMpNQslDKvOfxg4
	5Qg5c2vafN9xElT+xXVQ==
X-Google-Smtp-Source: AGHT+IGoMGmaOl5pCr2S2zDRvn1ZEtFuP5D29PR12nByl2G/phztcf3r74wdfl+o7a+i+LtD36g7XQ==
X-Received: by 2002:a05:651c:1989:b0:36d:6d71:4ec5 with SMTP id 38308e7fff4ca-377978ab84emr116585471fa.17.1761565585321;
        Mon, 27 Oct 2025 04:46:25 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d43c7sm18901911fa.40.2025.10.27.04.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:46:24 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:46:19 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Kemnade <andreas@kemnade.info>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 06/15] mfd: rohm-bd71828: Use regmap_reg_range()
Message-ID: <2ad8c8b15a9eef421b5a1f83a38fd899677ac3c8.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yX+aGkytnEYWZinw"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--yX+aGkytnEYWZinw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The regmap range tables tend to be somewhat verbose. Using the
regmap_reg_range() can make the definitions slightly mode compact.

Tidy the regmap range tables by using the regmap_reg_range().

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
 RFCv1 =3D> v2:
 - New patch
---
 drivers/mfd/rohm-bd71828.c | 64 +++++++++++---------------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 84a64c3b9c9f..2a43005b67ee 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -157,55 +157,27 @@ static struct mfd_cell bd71828_mfd_cells[] =3D {
 };
=20
 static const struct regmap_range bd71815_volatile_ranges[] =3D {
-	{
-		.range_min =3D BD71815_REG_SEC,
-		.range_max =3D BD71815_REG_YEAR,
-	}, {
-		.range_min =3D BD71815_REG_CONF,
-		.range_max =3D BD71815_REG_BAT_TEMP,
-	}, {
-		.range_min =3D BD71815_REG_VM_IBAT_U,
-		.range_max =3D BD71815_REG_CC_CTRL,
-	}, {
-		.range_min =3D BD71815_REG_CC_STAT,
-		.range_max =3D BD71815_REG_CC_CURCD_L,
-	}, {
-		.range_min =3D BD71815_REG_VM_BTMP_MON,
-		.range_max =3D BD71815_REG_VM_BTMP_MON,
-	}, {
-		.range_min =3D BD71815_REG_INT_STAT,
-		.range_max =3D BD71815_REG_INT_UPDATE,
-	}, {
-		.range_min =3D BD71815_REG_VM_VSYS_U,
-		.range_max =3D BD71815_REG_REX_CTRL_1,
-	}, {
-		.range_min =3D BD71815_REG_FULL_CCNTD_3,
-		.range_max =3D BD71815_REG_CCNTD_CHG_2,
-	},
+	regmap_reg_range(BD71815_REG_SEC, BD71815_REG_YEAR),
+	regmap_reg_range(BD71815_REG_CONF, BD71815_REG_BAT_TEMP),
+	regmap_reg_range(BD71815_REG_VM_IBAT_U, BD71815_REG_CC_CTRL),
+	regmap_reg_range(BD71815_REG_CC_STAT, BD71815_REG_CC_CURCD_L),
+	regmap_reg_range(BD71815_REG_VM_BTMP_MON, BD71815_REG_VM_BTMP_MON),
+	regmap_reg_range(BD71815_REG_INT_STAT, BD71815_REG_INT_UPDATE),
+	regmap_reg_range(BD71815_REG_VM_VSYS_U, BD71815_REG_REX_CTRL_1),
+	regmap_reg_range(BD71815_REG_FULL_CCNTD_3, BD71815_REG_CCNTD_CHG_2),
 };
=20
 static const struct regmap_range bd71828_volatile_ranges[] =3D {
-	{
-		.range_min =3D BD71828_REG_PS_CTRL_1,
-		.range_max =3D BD71828_REG_PS_CTRL_1,
-	}, {
-		.range_min =3D BD71828_REG_PS_CTRL_3,
-		.range_max =3D BD71828_REG_PS_CTRL_3,
-	}, {
-		.range_min =3D BD71828_REG_RTC_SEC,
-		.range_max =3D BD71828_REG_RTC_YEAR,
-	}, {
-		/*
-		 * For now make all charger registers volatile because many
-		 * needs to be and because the charger block is not that
-		 * performance critical.
-		 */
-		.range_min =3D BD71828_REG_CHG_STATE,
-		.range_max =3D BD71828_REG_CHG_FULL,
-	}, {
-		.range_min =3D BD71828_REG_INT_MAIN,
-		.range_max =3D BD71828_REG_IO_STAT,
-	},
+	regmap_reg_range(BD71828_REG_PS_CTRL_1, BD71828_REG_PS_CTRL_1),
+	regmap_reg_range(BD71828_REG_PS_CTRL_3, BD71828_REG_PS_CTRL_3),
+	regmap_reg_range(BD71828_REG_RTC_SEC, BD71828_REG_RTC_YEAR),
+	/*
+	 * For now make all charger registers volatile because many
+	 * needs to be and because the charger block is not that
+	 * performance critical.
+	 */
+	regmap_reg_range(BD71828_REG_CHG_STATE, BD71828_REG_CHG_FULL),
+	regmap_reg_range(BD71828_REG_INT_MAIN, BD71828_REG_IO_STAT),
 };
=20
 static const struct regmap_access_table bd71815_volatile_regs =3D {
--=20
2.51.0


--yX+aGkytnEYWZinw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W4sACgkQeFA3/03a
ocVpYwgApX+kp0HBYeSpSy5UViGym7Dedvy9fcHINt+oeCJZEs7sGMWWjus+vkfI
u8E7Cm85Di9wLPSGkApvouqpjSIQiHdypYDtFN+gTkgmUHN0hk4UlplixA1ndJmW
BYkG4Ns5RmDWoXUprdSh0AWjE/NOxPmfG0EmDOaUvzAkuTFrxHK/bNFJZOdLv4fX
qmLQqmsvRV1AxvZwwxSBVj9dTQ9KFR8q1rhlo2G3Bmxs7wDIaXNZuu32OTY59Eeg
DNhxIXic+lhDozq7w2x/MK6p5mUYW8g1WH6PfdYcT0fxuGxD3PpnVV+Wu7A1cJTt
lpR//jRSTmONw5WWN7qp5BMEbfys8A==
=cZvA
-----END PGP SIGNATURE-----

--yX+aGkytnEYWZinw--

