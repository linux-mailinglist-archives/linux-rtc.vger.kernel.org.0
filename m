Return-Path: <linux-rtc+bounces-3660-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38886A73E47
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Mar 2025 20:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 078687A6CFF
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Mar 2025 18:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD4A1B87FD;
	Thu, 27 Mar 2025 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HX11PO3n"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02AE2914
	for <linux-rtc@vger.kernel.org>; Thu, 27 Mar 2025 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102033; cv=none; b=IAt1Q8xu0u0FlHBPlryJBqhrBT3XJPn+K71uAfN60R7phV9X4aqhAdKmUtDXXDXU9l+VL5b11Tjg5WlaB9vEeOHb9eEVf40Rit5S01SYUN76cbR1RgXJ1csPrL2/np/hmOD9KrkDarEq1/XBUYfBfjSTcRpb7iGFSLtFb/KthBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102033; c=relaxed/simple;
	bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uo8wgdlojwJlI8VrVEmzA/oSNFLlsIPm753ADZBN9/02ZU+33MmTV/SKtO8EwkBv7EtsureoPUh71WRFIC0yy2kqC9XNPjgWLTugixJWTXRcFSU6fJz/uF/2grMyzTUsdu6+1t77PQUsJPs+28jhJb/70px29eQUv0d137xRtYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HX11PO3n; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso10657175e9.0
        for <linux-rtc@vger.kernel.org>; Thu, 27 Mar 2025 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743102028; x=1743706828; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=;
        b=HX11PO3nBQGawmXvWlXH9KES6J7ZEfMsIf+vF+unJugBaXButx3DhLwINLQOV8kOkv
         a15PTjnqY99hr/nKMxXTMZorz1g6cpr/+WSP3U2CIkUJlIZbwJSg56if0q9YhGSn3oI3
         8Aw0F8YsD7tX9GdMZIr1IUoqgtxfLHOeVENDa7y5Afbpg1FGlOTxe6NvXYhzrG/37b/g
         mDsOVDr/3HpGMUsSM67RgLsimM4CfCUqa6D2+EFnZxyPI7GgPoVqiDKxGURJIbWPtcPy
         yOgqrrwS7TLp+6qxP3wtenR7mTl2Lmlmh8Z1rUMsRtIAB/qRo319FmgaMDF35zTAnHCz
         alUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102028; x=1743706828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zd5BXmlZnu1j0K9/QsEF8vrUJXh1mHUAcZQsH3zURHw=;
        b=Imh1KPF3xZMcLcK9wjgUnWJxaudJj1b10uiKUthRTurQniIxa6VsNUML+4GoIghBK1
         uwuWp5pnsOr4whau/YIp+7VNdxVxIq4E1mX0KpHmEqc+uCPc1ZxoayXoBzsmpVBmbMr1
         w+1eRZpsjZh4YAQBeYtiEpDqXz7YKMI6j1J8WA6Qm0exrA6xuZXfJ1i6/4vYRmXRXmoN
         9Q4iMmUEMqmV5b5LPHAHG9Gx3yHf6V0ltp1P+gWfEEsqQSoHeo+e+PM5x/ItqgTPqOkW
         USZ5pgOSNeK3f0pa7PFeeGOjTZDxFU/zH3muFm8VQ4uaHNTHkO1hVjr/b+8JskTT28t6
         kgTw==
X-Forwarded-Encrypted: i=1; AJvYcCVt0ulR5AzJzAaE9ZdgkT3//OYzYLdOocFn0hviWsM0UOhwpKBPEFjs5xIyWT8HtqO4f+u97Nr7H3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbd75M+I2gEQpXRtRqwW9b6I2mr1FdL8YnvVriTVO+xViXJ5C6
	moozVTw3PbYUVDGO7FB7/NrWYGERB2Lc+8BL1CzV2lFUcWOantGHFr7CuF3eTkw=
X-Gm-Gg: ASbGncveyOldCHahy+of+DXjpYduhbKC6xze+iYBSPcE10KMdg0OTVxaGXqQQb6HVYh
	PTFlUtNBj5ZykTirTen/TdkSKXwBkRncHe+lQ/xXPjgnrfaej6LClA68A6gMFyws/4tTodlde6+
	rGWQRJs9DWQjoVmaAX048bYX96dLYUYkAaRU9BKoUhcW4Gl1seEqOkNlvjxBwMJv1Fh7QdP+Ssv
	lQyiEk6Pkt1QWiqEDB6waHzuqLA65zczEB4P5AnDNLuzTXOhm+tJ+GzdTgQCKgVeiQFZ78+de+3
	9grIMyZ3rBSG4R1M5iVCRFSRLsxcR8NvEMrneGh5j54LXayOWg==
X-Google-Smtp-Source: AGHT+IGnQpe3KSpRW8OcMy9ZOhvZKg6FTDTo/56rh7+F2u2OEQyun5MJVX1ptbNmngH24DTaiRQADw==
X-Received: by 2002:a5d:47a4:0:b0:390:e853:85bd with SMTP id ffacd0b85a97d-39ad178a45amr4737166f8f.48.1743102028193;
        Thu, 27 Mar 2025 12:00:28 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8f404ac3sm4134315e9.0.2025.03.27.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:00:27 -0700 (PDT)
Message-ID: <c7169df63dfad34ecbda3554ec51631e5cc6a2ee.camel@linaro.org>
Subject: Re: [PATCH 11/34] defconfigs: rename CONFIG_MFD_SEC_CORE to
 CONFIG_MFD_SEC_I2C
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
Date: Thu, 27 Mar 2025 19:00:26 +0000
In-Reply-To: <fdb8ef9b-3053-4dbd-b3f0-e2fd512de770@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
	 <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
	 <62bf00c37566964d6be794ed12a34cd057d9bb1d.camel@linaro.org>
	 <fdb8ef9b-3053-4dbd-b3f0-e2fd512de770@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-27 at 17:57 +0100, Krzysztof Kozlowski wrote:
> On 27/03/2025 09:56, Andr=C3=A9 Draszik wrote:
> > On Wed, 2025-03-26 at 08:16 +0100, Krzysztof Kozlowski wrote:
> > > On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > > > We are adding support for Samsung PMICs that aren't using I2C and
> > > > therefore had to rename the Kconfig symbol.
> > > >=20
> > > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > > ---
> > > > =C2=A0arch/arm/configs/exynos_defconfig=C2=A0=C2=A0 | 2 +-
> > > > =C2=A0arch/arm/configs/multi_v7_defconfig | 2 +-
> > > > =C2=A0arch/arm/configs/pxa_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 2 +-
> > > > =C2=A0arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> > > > =C2=A04 files changed, 4 insertions(+), 4 deletions(-)
> > > defconfigs go separate tree, so this must not be in the middle of the
> > > patchset. Bisectability, as for defconfig, is anyway broken in previo=
us
> > > change, so no benefit of putting this in the middle anyway.
> >=20
> > OK. Should it still be part of this series, e.g. at the start, after
> > the binding changes, or a completely separate stand-alone patch with
> > a reference to this series?
> Hm, now as I am thinking, maybe we should just squash it with previous
> patch and take everything via MFD? defconfig could be mixed with the
> drivers, it's a kernel thing, not like DTS.

Happy to do that, and it would also ensure bisectability :-)

Cheers,
Andre'


