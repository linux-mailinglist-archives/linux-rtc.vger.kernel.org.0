Return-Path: <linux-rtc+bounces-4382-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF198AEB76E
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 14:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3832D17F93D
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 12:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF202D3EDF;
	Fri, 27 Jun 2025 12:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fh1mssCM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BF2D3EDB
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026560; cv=none; b=AJwNkxy6XsuQy8CQi11uO6Wlr99s9JN0Rg9sUOXzh+DMN3ZF+qtfozBp9HE64Mdk1ajzQnUPkS/RlbJnuW5+D7Im3PPb1OrsJYi71ar5K4VLyeN8DmGWEHrlgjfCKbnK3HYxv6/UmwoHMwX3/MK1ta1gPMVcgR8mkfv/5YUulkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026560; c=relaxed/simple;
	bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IRpGFyuyjbSyccoZ7DJNp2BZwlgzi8tprCwmKGS0I2+1IFBe0/RLswu3A7BXmPpCIIWLHdOLqi5uNztlHiwUErDcf0suAr1sqxBYmXSGPcJgbBLbmjmJ6AP/BJo3dZTjqhzeMWvN4uKpy7Cj/5j3ul+5Rat0r8Rb/70vT10v9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fh1mssCM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453426170b6so17185545e9.1
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751026557; x=1751631357; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
        b=fh1mssCMbwMs6+0c8SaQ1DL4WEUjPfHl44PEovi3ImZqcHUlWw/2iokUKIo5jtlw5n
         irNdOSQdtQp4h9+9NULTdwwfErSr5Ew+IAkMflLxbqsWHhrVg++4gARJR0OSwOWtQe9S
         xvdYt5unnfTZ7Go4UItxHEPC7cDqTJ6asy0kBxerZtXhjbDN835E063MTNT5KYxh5MkS
         euYZqoxK1WoMfNSnASUClEnoG6cx+RutnGcu+BaPEtw4N0kT5LSvct2rdddKBimxEyIX
         Z5xAkH5q6zMgatVEAaX8Xx3pmtaWtujrUsLR4zjaEHt8KEPlSPp82t58dRUKlWoL2BYp
         I0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026557; x=1751631357;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bnO/bwKwvz0W9dml3PFN0tff+1CpXP9/A1In0KM8MU=;
        b=CJ3tv7RnBsPrrtxt2nr7D0aDMJSgGqVKGrgzSn9ss1MrtUepaZ3AF2dWF85eb82ob1
         zhN5Hvm8MthMShUtQ9on3wectLM9aAHma62RCryibluEtNx2KG/4a/yv7ZjXV1+RiaaA
         JQmaqrab9ZnWgRODSDK+m/32u4BGxO/nKWQm2Uc6yjeuTHhl+6TISqXKa41xdnuZ+kR0
         3HJj0NXKFUen1tCxS8HGSD9IgWOhEXWNvnTJbFuCLDErzh274mSApFXnUlB6858tnZtU
         m7EamdpfTOeL66C1oVpk881w/y+vNDmEGDuHNZ83YZ4hGT6FsGq8o/XZUw5j01b8ewWZ
         GAfw==
X-Forwarded-Encrypted: i=1; AJvYcCX+jENrudG+4PTc10iUN+faGjkn7OS9soBvDmY/rarlpgtLnT3+fn6uFA2DyxkPABq+RyCABhmFpDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbkkXzYNqZfoxct1Ie2t8VQaJ+AkxVcWbUvJMAuOMsg1uWQpv
	kYhyQK9VmZpXuCW6XWmj9mXhcWd+yY/jJ0plLUMnYQnSTe8r6P2cXc8wy7D2ncYpae4=
X-Gm-Gg: ASbGnctJYwwH13N17JMOpg36v8CvXOpuPM7ioYgQYTK7C6HEfXwjUgAVjHjq/M13wPp
	mIfduLdjOyNcX/IbvgS6Y6VRWd1fo1MuCt0tFUi4kUD1VKbMX1o2/ZwSNv+6WxMNAf3TenB12VW
	1s9Md4pQA5Z8aVSpMOUF2/64M99MMh8B3NPvQvUBhNtf4Vd6kZ3C9cBSP+NdIUj4hdCSIqMTqnG
	duW483Iotc+0Im4zVaFJP4HHr9xgMom/I/3wJEIqMvhv3cYptcN7u4vz/Rd4A2Jv7Ur6Ppy+dSj
	OMav7pdd2jDRJ/7B+MYxcd0o9BORc9n0dxWDH/ou22PDVJEYgmBWS6G38gO5dXlbPvM=
X-Google-Smtp-Source: AGHT+IEQFM3pQCiRU5lNSKxbqFCgvUVf7e/LcmOK+L4hhlaL9cMKkmMb9g/3CGCF3L4wxugIwNImYA==
X-Received: by 2002:a05:6000:40d9:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3a6f3162238mr7238080f8f.25.1751026556678;
        Fri, 27 Jun 2025 05:15:56 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4076ebsm48177435e9.31.2025.06.27.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:15:56 -0700 (PDT)
Message-ID: <ba42a719df8dfb74406336e8adb80b5286bd6fbc.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
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
Date: Fri, 27 Jun 2025 13:15:54 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping.

Cheers,
Andre'

