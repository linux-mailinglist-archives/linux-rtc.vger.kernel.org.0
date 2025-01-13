Return-Path: <linux-rtc+bounces-2895-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DDDA0B970
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 15:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20E491652F4
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 14:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6002451C1;
	Mon, 13 Jan 2025 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTFFo/Nc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D5123A591
	for <linux-rtc@vger.kernel.org>; Mon, 13 Jan 2025 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778458; cv=none; b=L1rMhNm1L7jcfN1W/O5ZNvMAt9hxZbV5nUpBwp+jzx6gYEdYryoa0Ui23RavrkBuRETXPlP5j5EvZqrdB/llEL0iUtdlVVf9gHm7eC8MmrFrMoZPpygjlpPdTRNAtARb2zuV/ilbGvgOLz2Wy/466w2Cg/QVViP/gJgIj7TsMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778458; c=relaxed/simple;
	bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqBryiI2Of8SD41+rjAlqqzXb5ESV29zRo9LyPwK1HtHYvMndNAygWpGkE3fp/5S6hMQIyXhQCl83KH50bfLQu9mwX6d8j8YBp6dyd7KP9fwZZEExgwnyYW8Y0uRyNDMUwPVfxaPh2v5YDTcD4Q64Utq9s3MdNbkE2uZikeFWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTFFo/Nc; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54021daa6cbso3767971e87.0
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jan 2025 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778454; x=1737383254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
        b=RTFFo/Nc0I67EKGVoQ2fVY+cBYZ1TOo4yfCkuQsrfXiUN/mMDNf6gKE+5xAGtzcZr4
         S4LQ/2JOuspC6iCEE6RPYMePSsDMdxS96zqIoZ6zkeHgAX5KEv6Zqj0banLzNt1rcx/D
         wtF/RTZoReuro9wI7XOMvVU/Ne7O/mmmPbcbo98ltio+r0vjyTtOeE24eW51Cy73M2pT
         GuDi+9Cv5csdLtMI+/KXAHpuBCDNKIMW6MSrFFVP1CBPpYZW2WFpNl5h41yd6IMDr15r
         OuY4IANWYquM0Ap6hYB2mGitr/D9Z8IcxjFNNLymHhIi4pgkp3NYGW/YJ/UoVlo7FMxq
         xnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778454; x=1737383254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
        b=KBk8YjSsaov4Ye43ZRREC1Q1nQn/CKMK33W02unNjGRdHIW+JhdtedhMaWQPV7Rjar
         qGH+pxyZv//abg28pSKCPxsGXG7hn2mO4qlLYmYld2FPrkFnDQPxru85OLbHwhB7CExM
         7TuW7A6uo2mWdjfgKWivEUektqBIyve2G2BygtKZh39yUdfGGCEeUwGLJetngVcYb1Wi
         7oFhd3+Sfz4B9jvuTHI9bTpzod4j82i/0I4WAb4NRNXlJJvFVfyVrF2h9LvgScqNkize
         qFSZOs7zPVqqTtfQenWN10NIN3U0yyc9X9vwJ9wWJb7kKBspz5R9TYxmSlrtex1RkZVu
         7Hrw==
X-Forwarded-Encrypted: i=1; AJvYcCVryEBbCkxDGKtoTZjBLtZ6CcWM9hs8BZkkJkJkT64Zyx7dgdtGR6vhnYOxUn9Kap7iFFRg1leat4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5a16ewrrZ8bst5x4EoePqjzHDnazO3tCDrFFJRr+6voJxPICm
	e4HMYQewahQL3CDOs+hHRMVQTtTzu0McLYSWoE8I/3J7K9eJ0I7Pj3jn54DPShARJwUjGbfTF+t
	Gi5toDgaewcHZ37QQ9spsoZdGDtgvsQJOM0hslQ==
X-Gm-Gg: ASbGncsKieH5tU80v2sAyGTh2C2DXIkUSCAZmeDEyDI+am7EPYDrEZyBStxJHwld3kZ
	b4Cef4jYvlE7mpHEj7Xz5Z4Lvm8pycW3h4PBE
X-Google-Smtp-Source: AGHT+IFMYdQtB6thju+Ujdvh+g52bV07bNIc66J4gueu0snzInT0RR6j0JQTqPJk7Ksj973O3ybZVrtFDEZoewU6/5c=
X-Received: by 2002:a05:6512:3a84:b0:540:357b:2137 with SMTP id
 2adb3069b0e04-542845d1b19mr6514038e87.26.1736778454280; Mon, 13 Jan 2025
 06:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227095727.2401257-1-a0282524688@gmail.com> <20241227095727.2401257-3-a0282524688@gmail.com>
In-Reply-To: <20241227095727.2401257-3-a0282524688@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:27:23 +0100
X-Gm-Features: AbW1kvZkOrvrzVjSbv0zK88kVQwaAoATB6fakJzdiYtYFp9GmQSO92IIKLuVefo
Message-ID: <CACRpkdYxtfrgs=Y=OVDjdRu-a1q9qPBdm=yeHojOaCyN5ou0Lg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 10:57=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:

> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

This driver looks completely reasonable to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

