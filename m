Return-Path: <linux-rtc+bounces-3627-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 139FBA71377
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Mar 2025 10:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D573BA57D
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Mar 2025 09:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D684D1AA79C;
	Wed, 26 Mar 2025 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jqbjhubh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE931A5B8E
	for <linux-rtc@vger.kernel.org>; Wed, 26 Mar 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742980798; cv=none; b=BZb62UXayZHMamymJsZsWkCq1dWjYX6TA5rJz4GJTP6t/7rpSlG3pI4oGxsOzoTYFi4qKSkt4mA7ekLnIWxhmoaANZ4M9N5MRXPjrAbu5lw0hPO6vxci1EKHnoPCeY9xAqGkjRrDlpgQbenx3aD2vi5KImNfCcCOxW4mw4R7PIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742980798; c=relaxed/simple;
	bh=vv+ysNhuxY3ikjLOktcTQGdujTO/tv4t8ztEeTYdJ4I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kcVsSjVOpMCTU96SpNR85AD0yzTCd2NKJ2xNlwR0Iz3dKQr71OUsm6HObIla1K4/TSMB55wegCEKoIbo1BIDSv9FPm1m0UVcsSIvIbNjxL9V+8mv/n55lbs6mNS3LIyCyRNh2XxUBXOjWWkaIeQOo2AsAtEE9TvvwPMTKmR1PI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jqbjhubh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-399749152b4so1807584f8f.3
        for <linux-rtc@vger.kernel.org>; Wed, 26 Mar 2025 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742980795; x=1743585595; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQ0qjLT5jo3q/gpm8poDUSRXpTxAB+PQfhlD12KVxh4=;
        b=JqbjhubhfeEfIMNzE2UY81wFJ4/6cyejFr+EjI0Lm1FuPPwpd9AEv15RSMf09NbrcD
         OSG26KV0C7eMU3CDWiEsdm4asvFvLKNNRxnCSENqsOaLfCP0O+sPai2b7KWwwMJFY6Wv
         ekk2BGni5kNRLNPtcT6i+Hu3Hh5f6fOhmqYIXKvGR/ROCOemuQ9raoKg08JrefYFd5zi
         DIb8XMhd5Jlxmw8CMw5ybCqqIOl+U10u4w3Fl3TEN45+r/IBO4+fB138SLtM6nwHlcLJ
         qKZkYOLCgE7GQlz4m9UUE9oeoigmThHZbhDW4fDg1/FfvPD4RYPuGzkn0jC8mI1w/M3P
         /vPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980795; x=1743585595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQ0qjLT5jo3q/gpm8poDUSRXpTxAB+PQfhlD12KVxh4=;
        b=ux5iLyh1Cpk62/WwGcJngX0tz2BHJ8/zXjPUvd4wdZ9we9zLMohqH/rOb1/U80S8Ln
         HDsdfLe1kjt9se7LQvH2uLNU63pZkRcgVP4+A2Vx9a3tgQi1wsjeKqRqbKR/7mKGMyK3
         f0W9dc3JVQaClrQx4Jaw+aKmA37Tx7uxmyyr3V1RM1hbfuaxkSoAKkYoMSzof0ATT8G+
         qqXfxT7P2JaGuX0myknFQHMXWMUmldus1VuTz8eBpylD8/7FYkiEO1sIOs/79XYuvSwE
         QVdpZxY1Rg+Ie7qY7GpDriSaznlyxumfS6wOnNijw7ZIpKUsmfZjtwx3aVyUIlRS5R2K
         nqCA==
X-Forwarded-Encrypted: i=1; AJvYcCXiUGCXoBh5T3X8oesro5l6WUyGjgnVS24rxQ+fszBJkwM0ez2JKMSnAwDCeS067xZKoOq5xxJdvPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4mvoTj9WEU4c8MMCYnjbe4xTmzPvJtfOD8Ra4wTtA3QqW1bAC
	af2PM5s99EDBw4YZzB0aYJxRHJPauh8bb5RCb0R3EdwDHUh/hp+xX6eO/9R1XOo=
X-Gm-Gg: ASbGnctvtvcnYy0Gm9+XnfjJJGtIl9iG73qdSj67jlrvnSwyZMd8SoQA+NwGiVpewtP
	sFGhatQmwVl/OxWV6KyPGkIQc9DeB52g9Sju3g5MvYTeN2nuC9MWeIQvuuglSHGnMlTwBeHODDG
	H/GEbMlIx1X2RD4yfSP75l0pr/D0T7jSY6WGs4XhYtM3VtckA9crh5IygdKvz7q23U49h2GS75V
	GpcRpiK/GMoZi410eh6pAyCBbjlYmCZyw5LHnWQ3VvVm1EBmIpm5ZrL/37KVpGKsaRjQfYWMJoy
	RRNMaH3UEnejAuuBXNjW4hF7gtmN3fIgNpQIVjvs0pM2cB/hYw==
X-Google-Smtp-Source: AGHT+IHdYeX3HXK3HliuVZenB8pY2eBivucP0XkMIaG7LHTPqNsbiA+5ps8ir+J/tmMzC0VVoMgrVA==
X-Received: by 2002:a05:6000:4027:b0:397:8ef9:9963 with SMTP id ffacd0b85a97d-3997f93d54dmr19401353f8f.55.1742980795153;
        Wed, 26 Mar 2025 02:19:55 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed5e0sm224956845e9.37.2025.03.26.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:19:54 -0700 (PDT)
Message-ID: <8c167b83a469d24373486af5936b466d44319409.camel@linaro.org>
Subject: Re: [PATCH 03/34] firmware: exynos-acpm: export
 devm_acpm_get_by_phandle()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:19:53 +0000
In-Reply-To: <f1e24507-7cf3-4e0d-8989-05ef3aaa2708@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-3-d08943702707@linaro.org>
	 <f1e24507-7cf3-4e0d-8989-05ef3aaa2708@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:03 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > The upcoming Samsung S2MPG10 PMIC driver will need this symbol to
> > communicate with the IC.
> >=20
> > Export it.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/firmware/samsung/exynos-acpm.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/=
samsung/exynos-acpm.c
> > index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..7525bee4c6715edb964fc77=
0ac9d8b3dd2be2172 100644
> > --- a/drivers/firmware/samsung/exynos-acpm.c
> > +++ b/drivers/firmware/samsung/exynos-acpm.c
> > @@ -741,6 +741,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(=
struct device *dev,
> > =C2=A0
> > =C2=A0	return handle;
> > =C2=A0}
> > +EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>=20
> If binding changes to parent-child relationship, this might not be needed=
.

Indeed, I've instead added devm_acpm_get_by_node(), and clients are meant t=
o
pass the parent node pointer into it.

Cheers,
Andre'


