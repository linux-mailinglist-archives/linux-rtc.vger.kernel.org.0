Return-Path: <linux-rtc+bounces-4016-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BCAA9F7FF
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 20:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03D827AC6AE
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 18:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B50E296151;
	Mon, 28 Apr 2025 18:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bs668uBa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25D2957A2
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 18:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863440; cv=none; b=IB0mVp/iOPCQFCWwwSuaJ0H7V/CBSI8XFIqX4fi3c5mCNC7p+ba0UM9vJN0V5TLKK8VDy0aamrqwED+HSxnddLsdxebgbMmn89gxVRFWJkB027IzKYTq1IKbwhBA3P4OCi0fFf9Nk/0g7Yunnc0HqbLJhVZW7GNN+13gPW+cgIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863440; c=relaxed/simple;
	bh=2l8v5GoV84d39u4DAVXZu15z37k8q2ZY6Rdpku5UUCk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NhAMJaN+L0Z0Ui3xjC5I1sTjhxh+lLPxyJLpMwDUtSCU2sb5NUInOWk9sFA+mAANX0E2fD0UAS17bQoyvUSVgFM036p3KqJTbm63MSlyHc4lTpCxJkHTfx8veU32Rdq8S1EbKNiqXPP6t+omBtAFtM+GS5FdRlxelU+M4uuSajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bs668uBa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ee651e419so2686609f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 11:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745863437; x=1746468237; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LhH2cWJiOFiPJwDHm1EMiooPrujkspMZlGWkH+fi+54=;
        b=Bs668uBaSvY4P1JahQrbvlmfhR/SnCL81rC6Hp7aJ0v+O6Q/KFCeQeGa2SQ7+Pe8Lu
         /F4OyEaeSoRUfDRJqlUL2pJcm2SbRwO9sLknWc3bUj1mrH1LtxuYR/IRnp6UgUtPvuzA
         2oaPU69vccyRLup0su+yxXjXn5Ax6UN/rSGpZ4/7OTZCADCJ4Muee4JbPI8b2Ti3VCNs
         KbkonCIZ/TEMc5QeaTKuaChAiR2a/nag+nfjHQuGYjQAQVMroXCoY0WnM8ZdA89Xaeix
         jzkXh3uiHusV5J2aeoq+f1MXb0uftAaLHnsJGCYni969eExB3e5rI+cEYGxnstj2hLRt
         Fafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745863437; x=1746468237;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LhH2cWJiOFiPJwDHm1EMiooPrujkspMZlGWkH+fi+54=;
        b=c8NYCFEEqFfNKpcNSwO5g94mWCLH2YH9fzuLDPrfifCiM4BHinLninZdDHpKP9UBD0
         OuY1FzQ9BEuNSMsktiuHIIVfAZ68DRePQlMK544lC7CabHYIcv6nAp+ibo7Vfwq+jRI1
         y1WHVnTnKOxyPTabSY6lNE1EkJiJKqOfr4N+GqJobxD9TkGzfM+6+F2WMNGsBCV78Rng
         auuiW/8e8biEFSilZu28RFJU8p0HcSfWA0FR4Mo8cCMkrDZVPKLwEojWv38sBgrKgT8N
         vMOXeMjbefAXLqgYMuGXr3Du1BnoIi2xrDQjmTllgvADKsbnWsLXN8HByrlN5Nkls6TM
         Np6w==
X-Forwarded-Encrypted: i=1; AJvYcCUG3XOH1VvmQYnUY90AyDtAiK3X0A7aSiJz5885nThtBnODraedwIz4WqrgV94RDa4APvEfHS0Uh8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68eTMcyfwUI3VeRNbLY7uWjG/Uv4Bt4pm/BMB2pk/wA3C7gbL
	00Sdu1O+Q081Y+vyN5hP2NL9+ij+6BvM9T7rzOl7PmoqAsjYjoPvGw1ti7dZfR8=
X-Gm-Gg: ASbGncuf2UV2f8ztj5Hqppmjil51yBaYQiHnoh8ShxTqiEpB5zggehpqaPISaIVTh4h
	8hdAbrt9ONZtSS8xhN97yYdKp+TI/KoXZefZpx+19LBsCJ6+cqaN0+ms6ylXrjgt5FwWKcWrbHa
	52fs8xDxDr3R7kmapJHDUtdXklGMIs3Ete9H5GJJ5JTbBrr80djoSz22xJIWu0750JV/eVZm/rD
	0BlvniXrYG3WwTU6c35zdmJ//FctqNpdXLXIED2kczNaP4R92WVF2iBlaxJ9O8HbE2beon0U7B/
	wLrnrnT+atHK8E8mTX40Z6X9Mmn3rYybesdZTynDKUoh
X-Google-Smtp-Source: AGHT+IFufjFxqWpK/DiwzoIhe+tnqis6Q5i4cTihbGu1kOEcV7a+TqrcCHr03xN9hBxN/HPNsngJAw==
X-Received: by 2002:a05:6000:4282:b0:39a:c9c1:5453 with SMTP id ffacd0b85a97d-3a08a3c8a48mr205683f8f.49.1745863436775;
        Mon, 28 Apr 2025 11:03:56 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b9c4sm167552465e9.3.2025.04.28.11.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:03:56 -0700 (PDT)
Message-ID: <e12bac66ea9158e058e48521e6906cb04960e980.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King	 <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 28 Apr 2025 19:03:54 +0100
In-Reply-To: <20250410-dancing-free-peacock-536c24@shite>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250410-dancing-free-peacock-536c24@shite>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2+build1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Thu, 2025-04-10 at 08:18 +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 09, 2025 at 09:37:21PM GMT, Andr=C3=A9 Draszik wrote:
> > This series adds initial support for the Samsung S2MPG10 PMIC using the
> > MFD framework. This is a PMIC for mobile applications and is used on
> > the Google Pixel 6 and 6 Pro (oriole / raven).
> >=20
> > *** dependency note ***
> >=20
> > To compile, this depends on the Samsung ACPM driver in Linux next with
>=20
> Are you sure these are build time dependencies? Do not look like.

Yes, there is a build time dependency on the ACPM driver (also
mentioned in Kconfig). In particular the last series mentioned
below (acpm-children) adds devm_acpm_get_by_node() which this
driver needs.

>  Also,
> if they are, the patchset will wait for quite some time.

All the dependencies appear to have landed in linux-next as of
writing this.

>=20
> > the following additional patches:
> > https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@lina=
ro.org/
> > https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linar=
o.org/
> > https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@li=
naro.org/
> >=20
> > *** dependency note end ***
> >=20
> > +++ Kconfig update +++
> >=20
> > There is a Kconfig symbol update in this series, because the existing
> > Samsung S2M driver has been split into core and transport (I2C & ACPM)
> > parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
> > the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.
> >=20
> > This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
> > talk via I2C, but via the Samsung ACPM firmware.
> >=20
> > +++ Kconfig update end +++
> >=20
> > This series must be applied in-order, due to interdependencies of some
> > of the patches. There are also various cleanup patches to the S2M
> > drivers. I've kept them ordered as:
>=20
> They should not depend... although actually not my trees, except the
> firmware.

The s2mpg10 core patch adds enums and register macros for the new
PMIC, which the clk and rtc drivers then use, hence I'm calling out
this dependency - they can not compile without the core patch in place.


Cheers,
Andre'


