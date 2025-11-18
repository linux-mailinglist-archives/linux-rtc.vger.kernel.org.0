Return-Path: <linux-rtc+bounces-5403-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49893C6A99E
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 17:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5037A4F3DB2
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 16:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C873A1CF9;
	Tue, 18 Nov 2025 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="NA23H0BR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5DA36829B
	for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482588; cv=none; b=pFX3DV1gjRMIRC6vdGexEZckesbguxZXy1jNfCsozjc321LlzhJvrSVC24bNr2mpJleT+px7Kxrddx0TtpYKr/Cu2b1yXGgKH9UhMl0uc0As5g6ZAO/iPBt2OSWCUBo3LB2Ux7OkH6BeJV8aBINtgtOXnCcilwtXSjKq2nlf6hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482588; c=relaxed/simple;
	bh=btv3uPBsVnXpVNmS4qDs/R7pyu+51TWUj9EIVRnOgio=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzNUkkCoeFGY/CPTVDW4VPV7rDefwavtOesNIFytjrr0xVUAu/dJAJclIW50BLdurJxrIm3PVFTA2Uu4xkIqe4kc8XAlpXWSsgaTCDMOeuj0QLbkKIPW/uyUSTuUC54TjI0H36yQ0wWAoUqekYaNpZVWKLM1u23rjd8OrxvuAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=NA23H0BR; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E5773F29F
	for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 16:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763482582;
	bh=mIyOErqpwna01AMHHTOqB9yVf2/6iPsT5MoLCulL3dY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NA23H0BRIHHg4VdBucuTrC+dBTTq9NQRQotNCm44yEeHuwXYI1R86DbMXnuG6/I0f
	 w5CedOqT7oWnsT8BzRV/eV+MTnkdEeFWteaDqsMCSKkTVd8sR+MlA4riZgJYjPnj4b
	 8zDxnMpYldgCkidZsOqBuxWNra+GHso6H6QjsgoErt5PFlbUuezGCVUDsb2XcSjajZ
	 fELUsraU4iWMyy0I6/zY6v2rHGi8CsloAzSBuyx2mlyqJmOqvzoCjMCwoJIGq8ssUP
	 27pX6wZL91yj3dcLyk/S3FIXh/AE12+TJUKB3F09GYDBk400+ZPqn8MN1VNqQxvrfL
	 xqDkoGPjLnrGt6cqobEdXjlAyL6NttDfRP1UtksjM2J2qHVxGbiDbpqYwIZuyge1cn
	 thcXSnOqtSIrFZ1dybbZZpZc2BPc6ehTUvZtG+kr4FTlv2G7XcRdnvLTNJCpJ2u3sx
	 PVoFKPq1kAnfs76dCYE5Q9H9GSjme1u4llmOautmshzZFw7A5reUT2XvI9/UvsK7MW
	 cZqvu8Rp5dxSFa/HscRzhJjgbft2ut+Nwuc5MEH/LN+8ObSbWT4L5qfK08OG9/dKHR
	 BuTWEueC+Teud0k+aTC+7KkuWCF0UsJlo5ffrv9EOQm5OBHgEAH2xa4m0p1tyl6MfP
	 KmIRj5xIKgEIHNj4dIJUAmEU=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b70b2a89c22so554752466b.0
        for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 08:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482582; x=1764087382;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIyOErqpwna01AMHHTOqB9yVf2/6iPsT5MoLCulL3dY=;
        b=s31LmJwDmDkLwjQsnqQ1hCVeNJi6VqUCcMWIO0fVpsOMglIr196tc8oCr1toopKGxl
         J94Zalcdzer6ogZSk5XPifBxrRho/yDAs4/5FSZh5lE0Sv54IaM8q/MZ29HhRSQXayEY
         mVOyKvnTBaAjR93JVo/C1WK0Ge9fgK7kYbBlgo7etORr2HAv7R5hbq1O0oQmdngZ7RZk
         uc67IqE6oThx0LRayxf0fmrlTYuuKsurixLhGh1LgH9QsSXk4q5T4L205SpXmSTroKbO
         CHXi54LqCBvJMnHEmwV3Uod8SyeGC7AjR8XVsHjcQOUXXXStW0yv6pNRPGhIeETGXzr3
         3W3g==
X-Forwarded-Encrypted: i=1; AJvYcCXzZ5zcEyUJf0f0GVF82J4mlG3WAGUBdSFmFbg9t9NjeMhav+yfNjLJAwGGU5fViaC6rZBKgIIVKu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2q6JHGWPasKwGlglFvYs+myHVhG2w2TaRJ9Gcr+YDg3i85L8
	ZetK1x8rc3xm3n7jUV8AQlD5u52u/hHPWqHvzBw96r8Gk2Mh+Ow2NLvTZvLFD97EoEQ0CUJX404
	JYlsCL7myXEpTiwu5J2Qtlb/JulZlzz3sRT3HJZRqsRO2BuQa+zyVUPyGLYkeAQFA9vzcg8ho1e
	gduFA80PatlPPiZeKQicWFzC6dzebDJ9i+pNOXp3dDGrEQUl6aCSW0
X-Gm-Gg: ASbGncuPIR0z2jqjxu0uNB+TnojU/bp1mI11G/BNfQEpoJZnR4FXiKbsX5+/q+Th/Jj
	qwouEZowT1bcwplSAhSPqX/ar8l+o7np2SHzwtd9PK03H8NNyr5//TuWY9DpQ/AGRcsFveQFZAV
	UYulNTgEFIhwTnic9GbRh82zOwXgdFsWxJyh3ZWgio+ADa6SuF7D5D3A==
X-Received: by 2002:a17:906:c10a:b0:b61:e088:b560 with SMTP id a640c23a62f3a-b76346ef9cemr3648766b.4.1763482581760;
        Tue, 18 Nov 2025 08:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBn7K4EsQ1/VADA/bQzwH86ZFXAYwYh29/z7evvXjdMBNS0csaU/n5+W/6S5nKTtDNtgN/9vlYqKGmpyFhzys=
X-Received: by 2002:a17:906:c10a:b0:b61:e088:b560 with SMTP id
 a640c23a62f3a-b76346ef9cemr3644766b.4.1763482581386; Tue, 18 Nov 2025
 08:16:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 08:16:20 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 08:16:20 -0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com> <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Tue, 18 Nov 2025 08:16:20 -0800
X-Gm-Features: AWmQ_blHnUdEuO_Xk-xLGxCSBj91WsT4QrqSPcs0Pl7bY6VmfVJn7i7Sg1yCEAQ
Message-ID: <CAJM55Z9Ep6xAR_TP+dCrSqWWyk8n=31-W3H4Ad6BkWUAWsbObg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mfd: simple-mfd-i2c: add default value
To: Alex Elder <elder@riscstar.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Troy Mitchell (2025-11-18 07:08:08)
> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/mfd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..b0f109b3acc40b074e4d0178e123437495853496 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1260,6 +1260,7 @@ config MFD_SPACEMIT_P1
>         depends on I2C
>         select I2C_K1
>         select MFD_SIMPLE_MFD_I2C
> +       default ARCH_SPACEMIT

Can this not be default m if ARCH_SPACEMIT?

/Emil

