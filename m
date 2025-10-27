Return-Path: <linux-rtc+bounces-5178-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87DC0D419
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 12:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C4619A3BD6
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 11:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AD32FF654;
	Mon, 27 Oct 2025 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN1iBm/a"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696A52FCC1E
	for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565629; cv=none; b=hVPc0GoU5vZ6cgk/vgBcmw59JkoAP+K7Q5ZyHrfF2iKOulnio1TdIL91w8txovJXEyexQ7JkMKfl0kg8tRXzH+uVUXi59MfJbakuqhyEO3RAiv1vrOMU3FETkVpIhdn/w4ois/O11iF7Hg+YRVSOgLuFDCC90ZWQ1/sjDbOe6Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565629; c=relaxed/simple;
	bh=KbZYIBikwWSI+GVCWKg5+OPGcA2UgrEFkQgweLtQ6xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2gP2C0JgeHJoFr+6+E5mDcnvICx6w02m2r0DmirSra2SeJbtmWsQtM1F8Vfbp/6a5GX7RMW2CGfF1akbr8r+r154UY3BAUGmPoxa6u2CiKcrohZKT1G/I+T+uY37rHfYCDoAmxnGODej2Xyg3xtXGayC4u7ijNfqFXfVNdGzuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN1iBm/a; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3652d7800a8so36914551fa.0
        for <linux-rtc@vger.kernel.org>; Mon, 27 Oct 2025 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565623; x=1762170423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPhjrYnraGxNN/VaL/O/6qvA4/L6CwleXg/ScEIiVlQ=;
        b=gN1iBm/aT27avoIk/DrZG8G1WrMT7FSaFrGJsRmY3xXQJT/zDpvPTVBzfxjqF+J6En
         pkykq5+eBwgsQR5ujS48JaFusMQrESuHebjrPDO+JfwJ7yBSZFBs0M7v9HbadRgyZtyr
         tvjGzNgcSQcIPURCK7YcjQ1vkbtu5y5XHqiOxqJ4ZRbZj4Pe3TeimAI1uwwWHy8O6uYl
         uQWSizZNparIpxig4ziJ/WAV24OnbnRVRe7MvhUAJ/g4X9uZtZE2pFdagi1G1QLXKxwy
         lFLvFi9PTchxpXLlGuPgwBA4EC0ZUezbxAdVmV7DBl8FjNaLAjEOk+3asKKYAgznwowM
         Tekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565623; x=1762170423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPhjrYnraGxNN/VaL/O/6qvA4/L6CwleXg/ScEIiVlQ=;
        b=ojoHDEwIH3Fy9/fJLtuklH3LmhJkVYJkPtPpKpdCkzzDna4mH6AHwcdE90/30RQNMe
         nWXL31kDwnq+it/YNmbasCVGjtGamVRw77RTxpxn9Belz3q6rH6jQtGYDjN6vnqQbA6b
         o4QjTLoAAQtHoqWjJjkbIAoGIiZzq/RnNP7+GZvoMaC5F3RP72+4LJAmWDje188UFGUj
         04suRCp4qIVbh4L+cjQQn4wE3F1ZwGJd6AoO1IdgHGoeFAP85deHeYtvwsLjj4wB5ctA
         gvn0jjRYZS7gbpoFOZ55XiVDaV/jBhqIJqMMtStt2sVWuP6wRNZtpAnDrl2GYKG94p8W
         irUg==
X-Forwarded-Encrypted: i=1; AJvYcCUt9k9oKGyJjpZxWouzwdhGtN1A4E3uz9cGat71KXY5h1Vn8gefIOg74+Zte5jCIppubit5hxn/k54=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3R+ewli3/vS8CChb5qBxL7W1oLFYxvR0NStbiYkZxSKHaJb1U
	KxA1v4so3EpUCX8c9feXLA6+AtLT2slWGiuli/EXxZBe4eHzjEyqgYbc
X-Gm-Gg: ASbGncvZbUAw4AV5Jjo35o+m9I0eYyKW0nuWYFbUvYYYVBuLWA5GT2ZHXyFd8fRHcAJ
	NFZECko/XtTPS4dKTtcnXOTV2Cqjdo7+RpaqI0ZFsUEEeqW8fqPH64Ux34nWDrNHvs/yDdQ24wZ
	ky6CzwtSVjGaHZFZekvvHZcZT38SF9FfHENjHPiT1jUkh5Zg3BNDSvp9J47frK4ITuMIXSdMufy
	ysz0MsFMRY206qiJ6CzO3nunnt4HMVEC+1r8E/h0ySQRctzosKvcBXVJLjwC9UW/4ZSJb6jx9WI
	0P5SJAlcn3IppPciS2THb8NoQWekOddNtStJZzVEIzz8z4RBcvq0FIasHZVQwGqkyAVL8PC21/7
	Q0UZfvH+9rFU++9sWoTzOlZ03QzTlDfNOHIinS0vW1aR4OTeX3XywVIBME7DXRrP26B527UHXYS
	5Vw6ig9Tkd5rJPkGcWMg==
X-Google-Smtp-Source: AGHT+IFGTBYWCW3ld91Gaf4BxcDyit2xahwuUUbRDChRLg+8atXmQtWwSm/UbdG2xVg1KoE+9y6aEg==
X-Received: by 2002:a05:651c:221f:b0:337:e151:9ec with SMTP id 38308e7fff4ca-377978aeff0mr114706621fa.16.1761565622062;
        Mon, 27 Oct 2025 04:47:02 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d3712sm20091881fa.36.2025.10.27.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:47:01 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:46:57 +0200
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
Subject: [PATCH v2 08/15] regulator: bd71828: rename IC specific entities
Message-ID: <aa2b31267e6cc93bad4c823ef1ba07ba43efd572.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHlLATUC+NJoLwSU"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--hHlLATUC+NJoLwSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new ROHM BD72720 PMIC has similarities with the BD71828. It makes
sense to support the regulator control for both PMICs using the same
driver. It is often more clear to have the IC specific functions and
globals named starting with the chip-name. So, as a preparatory step,
prefix the BD71828 specific functions and globals with the bd71828.

It would be tempting to try also removing the chip ID from those
functions which will be common for both PMICs. I have bad experiences on
this as it tends to lead to problems when yet another IC is being
supported with the same driver, and we will have some functions used for
all, some for two of the three, and some for just one. At this point
I used to start inventing wildcards like BD718XX or BD7272X. This
approach is pretty much always failing as we tend to eventually have
something like BD73900 - where all the wildcard stuff will break down.

So, my approach these days is to:
 - keep the original chip-id prefix for anything that had it already
   (and avoid the churn).
 - use same prefix for all things that are used by multiple ICs -
   typically the chip-ID of the first chip. This typically matches also
   the driver and file names.
 - use specific chip-ID as a prefix for anything which is specific to
   just one chip.

As a preparatory step to adding the BD72720, add bd71828 prefix to all
commonly usable functions and globals.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 RFCv1 =3D>:
 - No changes
No functional changes intended.
---
 drivers/regulator/bd71828-regulator.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71=
828-regulator.c
index dd871ffe979c..3d18dbfdb84e 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -28,7 +28,7 @@ struct bd71828_regulator_data {
 	int reg_init_amnt;
 };
=20
-static const struct reg_init buck1_inits[] =3D {
+static const struct reg_init bd71828_buck1_inits[] =3D {
 	/*
 	 * DVS Buck voltages can be changed by register values or via GPIO.
 	 * Use register accesses by default.
@@ -40,7 +40,7 @@ static const struct reg_init buck1_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck2_inits[] =3D {
+static const struct reg_init bd71828_buck2_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK2_CTRL,
@@ -48,7 +48,7 @@ static const struct reg_init buck2_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck6_inits[] =3D {
+static const struct reg_init bd71828_buck6_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK6_CTRL,
@@ -56,7 +56,7 @@ static const struct reg_init buck6_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck7_inits[] =3D {
+static const struct reg_init bd71828_buck7_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK7_CTRL,
@@ -102,9 +102,9 @@ static int buck_set_hw_dvs_levels(struct device_node *n=
p,
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }
=20
-static int ldo6_parse_dt(struct device_node *np,
-			 const struct regulator_desc *desc,
-			 struct regulator_config *cfg)
+static int bd71828_ldo6_parse_dt(struct device_node *np,
+				 const struct regulator_desc *desc,
+				 struct regulator_config *cfg)
 {
 	int ret, i;
 	uint32_t uv =3D 0;
@@ -212,8 +212,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			 */
 			.lpsr_on_mask =3D BD71828_MASK_LPSR_EN,
 		},
-		.reg_inits =3D buck1_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck1_inits),
+		.reg_inits =3D bd71828_buck1_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck1_inits),
 	},
 	{
 		.desc =3D {
@@ -253,8 +253,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK2_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck2_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck2_inits),
+		.reg_inits =3D bd71828_buck2_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck2_inits),
 	},
 	{
 		.desc =3D {
@@ -399,8 +399,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK6_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck6_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck6_inits),
+		.reg_inits =3D bd71828_buck6_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck6_inits),
 	},
 	{
 		.desc =3D {
@@ -440,8 +440,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK7_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck7_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck7_inits),
+		.reg_inits =3D bd71828_buck7_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck7_inits),
 	},
 	{
 		.desc =3D {
@@ -633,7 +633,7 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			 * LDO6 only supports enable/disable for all states.
 			 * Voltage for LDO6 is fixed.
 			 */
-			.of_parse_cb =3D ldo6_parse_dt,
+			.of_parse_cb =3D bd71828_ldo6_parse_dt,
 		},
 	}, {
 		.desc =3D {
--=20
2.51.0


--hHlLATUC+NJoLwSU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W7EACgkQeFA3/03a
ocXFRAf/X2TvPapTD+az8EHYbCCnjJcIvHuUfnEQlERv5ijnP0Gl1KSmtaVPlpvl
VEVmc5eK8QfVVA8akUmsAFtEQ17BUXteFoPdjVb37GJGuyW+tH+R4GpNKRXbpsPT
kxqHs/o5fxk7ESJZhWCSErb1jZyKhuluMo8331A00dHZW9zGIielOf/2Cs8eoxMf
tF4+VUmvy/nfAGhfOyfvPy7WLouZFhQdgUI/u7KhsibBAlIBjVrWz2pcXsCAx2qu
dtxESaLBV3H3wleVqN84Hxhiok+cPhW8tz85MtBhBxHT7tNbM+QjUe/jHxk2GnOM
5t6EpGBTVdq0zs4EwAkPzUE5uFCr2Q==
=9ybE
-----END PGP SIGNATURE-----

--hHlLATUC+NJoLwSU--

