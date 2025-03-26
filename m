Return-Path: <linux-rtc+bounces-3630-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF8EA713CD
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Mar 2025 10:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22B221895304
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Mar 2025 09:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD9E1ACECE;
	Wed, 26 Mar 2025 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Meadw21h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDEF18C034
	for <linux-rtc@vger.kernel.org>; Wed, 26 Mar 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742981724; cv=none; b=f3Af0V+kMzSQ41a9er3OiD+ydeTqAyqpn1II226Yx05MOu5+M3svhWZdX4SSvCk6s20VVIOjG0s4plqMmtDrSqsIGyWKPO9q6U/RpPgXi61H7xj8tNgl4Jljz4gHKypEml0Ggu4eHKLM1mPqcrmMVdK2nHV3uwRwcHc2gCvMMl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742981724; c=relaxed/simple;
	bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cmGNvcoock2PX/Vnc7U7ZziUmVKGEQxY3JAwn1eN/kscwuL21CIsfacQ7UlNT9VKmzKaSoI7ecDfINLdCvyOfHpqrWCUaCt0m74T1n1xIsCM5F1Ywl/WXZsEkMXuGEEUgsiZQXR3c9E2v5F132oDS4qHL0QIkNYeZbK7DE8jG/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Meadw21h; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so63290475e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 26 Mar 2025 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742981720; x=1743586520; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=;
        b=Meadw21hAJAbPxHWIvE2IdbDLH8Iu3gP2LwW1a7LUKHThLlqX6CsngMPJQR3Q8jmMi
         Y/eXaeJ2x7qmckOmGM+Jt76QXYznKk6sayGrFiGmC3p4f12N30t7L+d30z9E2Q8aBkXP
         iQ9hoRNkYoHeidu7iB/Di4Nb87PM8VkZiIUZy8lIkD+LLt/igq+9XyvPqk1gxuPfoNxl
         az/n99XmR9iXn/FKMzOJ5s0zKA/MJzY5VQAMMlW+2epY2do+caRJMfrvEs7M1EEfVSIC
         BfJkoIRfkPD63mUG+g0R72X73Y+mHNCvriWSWpX1id9Hr4XFD9b76gm+Vt2PfVNWG7gs
         QRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981720; x=1743586520;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mO7U4m0oTja17D3RFzqvynDUKnVhiYqxVxjxnWasqbo=;
        b=LU12CHwR1oDMAc/e8bhvRQw26QecvQwcPCb6VGUKcPBIwjoMBzI/WoDgYdUXbO7g6i
         kUCBpOmqHM33a3dL/1m4GWa6JGwhdTQk+6xjZ3C/PxP59ibBfQ9BBXEBhQmFP+kDNjXi
         +yuezNjJeqBw6giU9AA/SQyO/0E4ZpL+ctRCOxDO8mpG6KIcHn3njJVG6KMu5g1oHsAx
         AvOztbVPxQ9DunLbE0fJc5jTztmuq5sf5imqDIy3pRZQu8r6GVy6qGmfc85YL9yc4vdO
         4ob+6MzWNkNhwpFSkJ5ePc93IbZblpnJyhtbsXIBgCowBET5ZFvcYia78wile6c+m5/S
         ZWzg==
X-Forwarded-Encrypted: i=1; AJvYcCWNQqdb33SqOu6/uzsQWJ3Zy0UnGdusb11iaVvIWIKfTuuFqRh10RfWd20XaxXvO5PBOslLp5QKX4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxngltuRmwzM8IIeQKxnZ58FmNeP1yx1PsSnFAEg3RZVHCKJcw
	ZLWGfOvrk3SGUKR9RdYkNBzdW3HCXJWe+OVZSTlRplIa/xmHQ4fXqRnt0qQC6aA=
X-Gm-Gg: ASbGncsf9ZMIUxTrGAG54cHsNoXFtwBLLLKZVgqK1EcUQJ4htdZjXkR6dbujRhKH8hG
	jdDRrs19VhBuzzR88xCk+UryS/VeIPW4Ks2kdAxg6ewdp+3e6A/QBYx20KWVIZ2UerOY0x23N5b
	b+ZaQxQC8IjikvF5LPj0afYWX+QpWlAnlDOQnYrswEMRwPR/RLlUkiF7dsIYwoRUznAwIdTV2k2
	Nn78nF+q+WGppo+KSYBXXwYHVJpiFZjgN2/ArPdL+EfPH5tMbIHhx7eOlNB6aj281/K46hljc0H
	XaBf2gX3BxxAEiZfYJQJZtiYE3RZt3P/1Uu4o+nkjlJ8b6y4CQ==
X-Google-Smtp-Source: AGHT+IGcfQ6I4FNrJirurd36EI4HsUJuWVwi1KHS1E2yEYqjMI56gm6awQtr8PEUURenI12KJk6YUQ==
X-Received: by 2002:a05:600c:c0d:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d50a33d03mr152636725e9.27.1742981719714;
        Wed, 26 Mar 2025 02:35:19 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f32fcdsm232615235e9.7.2025.03.26.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:35:19 -0700 (PDT)
Message-ID: <40a8d82aab764669cf755adbabac80a5c0044a5e.camel@linaro.org>
Subject: Re: [PATCH 12/34] mfd: sec: add support for S2MPG10 PMIC
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
Date: Wed, 26 Mar 2025 09:35:18 +0000
In-Reply-To: <25eb9c47-96ba-4037-b320-af16e0226f4c@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-12-d08943702707@linaro.org>
	 <25eb9c47-96ba-4037-b320-af16e0226f4c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:22 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > Add support for Samsung's S2MPG10 PMIC, which is a Power Management IC
> > for mobile applications with buck converters, various LDOs, power
> > meters, RTC, clock outputs, and additional GPIOs interfaces.
> >=20
> > Contrary to existing Samsung S2M series PMICs supported, communication
> > is not via I2C, but via the Samsung ACPM firmware.
> >=20
> > This commit adds the core driver.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Checkpatch suggests to update MAINTAINERS, but the new file is covered
> > already due to using a wildcard.
> > ---
>=20
> I did a quick look and seems fine, but I suspect small rework when PMIC
> becames child of ACPM, so full review later.

Thanks Krzysztof! And yes, there'll be a small change to support that appro=
ach
instead.


Cheers,
Andre'


