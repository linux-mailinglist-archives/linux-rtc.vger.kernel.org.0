Return-Path: <linux-rtc+bounces-3655-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F524A72BE7
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Mar 2025 09:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54393189A6B6
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Mar 2025 08:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F8F20B21A;
	Thu, 27 Mar 2025 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f9EIa3z+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469F20B20B
	for <linux-rtc@vger.kernel.org>; Thu, 27 Mar 2025 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065807; cv=none; b=B9QDCKM2U/dFdn8KdTrtb46nwmLec66CdAJyY3NjPBLGChYmy0Uuj+YgaJcwECnmAMTay8zivxiWoXmSjXAjzzWzBBGPiyzF46L2UD5+rsJgoRj0I9/XiuyPjpfdNKvOljdL+hb7oOCy5M0a43AWqlfUphBrm2DSGrlJUz+Ju4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065807; c=relaxed/simple;
	bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCTO9zG0hsNPtEMd/g5N38yys/oNMMvvZcvszCnoNqwrhtiEMGFlHth7Qf6aAk2EtpyOa17OWjKzjz+wK8ZrUpUvzMEam7y3EeohZEXp3j0JtfX1TmhKqC+t4VsFuBm/zuNGDXP0oI9v33q0S+LJtjZy18e+/1CarT7m/lohajE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f9EIa3z+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913958ebf2so506667f8f.3
        for <linux-rtc@vger.kernel.org>; Thu, 27 Mar 2025 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743065804; x=1743670604; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=;
        b=f9EIa3z+WG3ihErGNo5scvrjbc3TWVbr1yXum03sHB5O1vlZwZJ2LWsWhi9c/Erpyz
         pDHBJrhhg/kl1JYkoUW2DvVwv5zXmNrBIpnoGDK7t3r0LErmLGK4mt+b9oDq6dR/ACbT
         h3yO8ewgkhjzo0ULTYzEeX8AMKfEHWN7uiMOQO2OBcBuoNEPW537c7kP9L0EFehXJC+w
         W6mFwVOxXIgUVd8FY1GafWAdg+kfCix8vS7Uk9nkAh/cjjiBIfLxT1r/4JL0eE02Uf9R
         pWb9MJag9OwNf9ymAFuL7xvWnOhlwPATHgmw4mihphDFXarzPumdjSnZ4nnOVPSwxr1s
         xpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065804; x=1743670604;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIYwhtEw1euleTwTcbZCNX9K84qUUjXQZZcm3DuTqE0=;
        b=Drhz99QFk+kfZaHclLkWx0NSRls25wnbhs5iWn2QwS3laL6WYIuufrevMLIMkf5naN
         dYfE4IRwJhu3RA9n2UCTIUJ8rhDU48pldiSUA3/iD82nGuJLzqMx/etLJi+5AIsfr58o
         OtoWvX9Onr3ERQOz1zqM65K+AENw8WTPRd/k+1M/mw5J11GDCk8R6o5i8MVlT2PgzCVi
         T8olugLJho6QUO4GVJnZbUHn7Z6hV/uITALxJKVQyGKpx11ObW3Vtc5S1rHPug69nUdV
         PsTaug08mcZwhah5wMO9qBhi8LwcvoPlL23jTsK4My/xF8mZgn4OEjpjFS2P6ccLtwU2
         KDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ekuv+IQc2e5dbScq9so70qn7Y6sMTr0uCdqTb4NiMawpZe9wcrhBEWjwqbLJkt3LQFSHvvwwOrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3bwXBdrIJx5nWntbeLO04lQUfjsgaUjP1YTRNDuhDhvpunOT
	xrEON6M0rr/xpL8uy5Tvp82zgzXG+HaCtXpGoqpteh43zgI2yFmXjqsgOE+OFU8=
X-Gm-Gg: ASbGncsMLGGAkzLV1iEXQo/2EFzOn5AjCualjE2ISJO3xRJpKLD0OWJ6riaWHRE1qkZ
	UNOQG3THGAJhR3RluWC2hcdPUcm/7oaub4cQZfVx13GwcE+0ObH/ed8oSSOFUG5DCNivWmUWD3o
	H3mR00pIuxmdIIjPM12fOBxYpj3zEvIhqo5FdaETQcRw/IgPHhKwyPIzb+PqqRkWH9Mqt13kMaO
	cHkp/3uxO702Lx7RHDEn8pxlOADng1N98ub4Lo5uNysLQr/47A5xcXPT7SKHR3HKBDKbhPwq0M9
	lHpDqLmenZwmzGirvh0iU8EpbsGKTLQPz8ZeGdI+WZ3Ne0VUnA==
X-Google-Smtp-Source: AGHT+IFYnqDl6ib4NKqjPWss5rPeynt8Vendp/W2yLiXx4uK7gmEAWHDdxKjvkNq1tkjNGSpWl64yQ==
X-Received: by 2002:a5d:59a7:0:b0:38d:eb33:79c2 with SMTP id ffacd0b85a97d-39ad174e4famr1984580f8f.32.1743065803956;
        Thu, 27 Mar 2025 01:56:43 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82f1bb80sm30629875e9.28.2025.03.27.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:56:43 -0700 (PDT)
Message-ID: <62bf00c37566964d6be794ed12a34cd057d9bb1d.camel@linaro.org>
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
Date: Thu, 27 Mar 2025 08:56:41 +0000
In-Reply-To: <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-11-d08943702707@linaro.org>
	 <b733eff2-171e-4ab6-8546-565d87d5ba84@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:16 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > We are adding support for Samsung PMICs that aren't using I2C and
> > therefore had to rename the Kconfig symbol.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0arch/arm/configs/exynos_defconfig=C2=A0=C2=A0 | 2 +-
> > =C2=A0arch/arm/configs/multi_v7_defconfig | 2 +-
> > =C2=A0arch/arm/configs/pxa_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 =
+-
> > =C2=A0arch/arm64/configs/defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> > =C2=A04 files changed, 4 insertions(+), 4 deletions(-)
> defconfigs go separate tree, so this must not be in the middle of the
> patchset. Bisectability, as for defconfig, is anyway broken in previous
> change, so no benefit of putting this in the middle anyway.

OK. Should it still be part of this series, e.g. at the start, after
the binding changes, or a completely separate stand-alone patch with
a reference to this series?

Cheers,
Andre'


