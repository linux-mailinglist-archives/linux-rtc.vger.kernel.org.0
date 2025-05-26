Return-Path: <linux-rtc+bounces-4154-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA66AC3A8B
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 09:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B66AB3AFC40
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 07:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0B41D6193;
	Mon, 26 May 2025 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GnHwpjCY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC6B145323;
	Mon, 26 May 2025 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244156; cv=none; b=eT/Wqz3SCBuE8SUZc0t56m+dNIny0RXBfoVqEvxYf6ity3L+ITsoVXav7RrnaH7lttBZ3c5Lbs8Py9Wj5xBqR1+3o7tJv9mTv9oVDTeIayVbZQg3AsIl9qRUFqSJRxyNZI4EQiS1JwU4xiph5qTK6HyCSLmiTNAQE9pzqsDgtDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244156; c=relaxed/simple;
	bh=7+leUUzEl/sJW/wbj442MrbCYKX4184+vQpnprE6/3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s6szfEbJVG8vo+yhruVRNcPQ0DJbipTYAionz0PSBXCczJ9Vapd5rr6Q1RAw0snMRt+96DbowGD90fVkv/wxVyOWcDl3WUE4GX1u22VwogSD6iuxEhhVY7rrcc9xxS2wt7hN8M43ZliqE4J8Li70ZmwMcG6el8AELELSfGe/waU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GnHwpjCY; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D7AD439C9;
	Mon, 26 May 2025 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748244152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv0RWT5m17bF5/zdjVw/YPkVgQLgWiqEuNaAakOp8vI=;
	b=GnHwpjCYPM96rA2pstv0Gd7Ns7qZARJ+oIM9/KOFCsP3cvmimcI7al4urRv8MuYhEvXhZe
	SlaKuyaxW6JshYavZI96dwt1ON/MmqCgzWAVdI2vJXqphs0nw4YJKn02QJyScFk5hvzPfw
	pqN9OBBwagjVv3XxGOZR2fa330uGmMfTWXdleWg+5FTkqvDOMpBbqDbQsa6Fq51Czh7CnY
	/y+Rkom4k/OM+wdaWFu/cZDFE9P8qSqL0us6zTPM9J7Di44hGs8NH3LCBAw2AINHjCDN20
	AIlWlXyqhsxbpZxI7anIdTBFHGBgIrUOOkkRTkefNM3RS4Za1R0MnAFE86842w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rtc: rzn1: support input frequencies other than
 32768Hz
In-Reply-To: <20250523150541.8390-4-wsa+renesas@sang-engineering.com> (Wolfram
	Sang's message of "Fri, 23 May 2025 17:05:40 +0200")
References: <20250523150541.8390-1-wsa+renesas@sang-engineering.com>
	<20250523150541.8390-4-wsa+renesas@sang-engineering.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 09:22:31 +0200
Message-ID: <87frgr4z0o.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduieeludculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegso
 hhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Wolfram,

...

> @@ -357,22 +359,21 @@ static int rzn1_rtc_set_offset(struct device *dev, =
long offset)
>  	return 0;
>  }
>=20=20
> -static const struct rtc_class_ops rzn1_rtc_ops =3D {
> +static struct rtc_class_ops rzn1_rtc_ops =3D {
>  	.read_time =3D rzn1_rtc_read_time,
>  	.set_time =3D rzn1_rtc_set_time,
>  	.read_alarm =3D rzn1_rtc_read_alarm,
>  	.set_alarm =3D rzn1_rtc_set_alarm,
>  	.alarm_irq_enable =3D rzn1_rtc_alarm_irq_enable,
> -	.read_offset =3D rzn1_rtc_read_offset,
> -	.set_offset =3D rzn1_rtc_set_offset,
>  };

...

> -	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUBU,
> -	       rtc->base + RZN1_RTC_CTL0);
> +	/* Set desired modes while leaving the controller disabled */
> +	writel(RZN1_RTC_CTL0_AMPM | scmp_val, rtc->base + RZN1_RTC_CTL0);
> +
> +	if (scmp_val) {
> +		writel(rate - 1, rtc->base + RZN1_RTC_SCMP);
> +	} else {
> +		rzn1_rtc_ops.read_offset =3D rzn1_rtc_read_offset;
> +		rzn1_rtc_ops.set_offset =3D rzn1_rtc_set_offset;

I guess this situation is not possible but let me ask. Do we care
about the very unlikely case where two RTCs are available and configured
differently? Because we are overwriting a static entry here. Maybe we
could have two static structures and pick the correct one during probe
instead.

> +	}
> +
> +	/* Enable controller finally */
> +	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | scmp_val, rtc->base + RZ=
N1_RTC_CTL0);
>=20=20
>  	/* Disable all interrupts */
>  	writel(0, rtc->base + RZN1_RTC_CTL1);

Anyhow, I don't see this comment as a no-go so,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

