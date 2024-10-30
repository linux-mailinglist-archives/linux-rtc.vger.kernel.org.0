Return-Path: <linux-rtc+bounces-2383-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C850A9B6CE3
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 20:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 049F41C21074
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 19:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234611D043C;
	Wed, 30 Oct 2024 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vk5m7Sub"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A331CF7BB
	for <linux-rtc@vger.kernel.org>; Wed, 30 Oct 2024 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730316742; cv=none; b=lD2B/vyEAYB4fFPB/5b0WP9dyYLm4LpmVH3DEx/iKDy14yWFakdZ7c9pgprbI5NWJ5542YxOjpu4t11ka0ZH0tYXWOysbtwR8Y7hFjH9a2ZjGCQ6MDXUoqUE8vZ0iqYVMNxQq5B8ExQpXI6N/J6uyJc2tlKpkm+QDa1U6n8V1NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730316742; c=relaxed/simple;
	bh=usVZ4YEunIbHVvBSq748OooOQsnvI6vxSw64f7E497c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiPfmNIRR1VdfYnjYoDj4ukYoAVhXWVhIMT2y5r4Jz8kRCQmpLdeCimGDvkmIw79ZBMgnuKYclAey43ifKSJpiqFUXKIPBmgGckGZVnus78tya4gVp0e5yBMqk6pg+ABqFYp9QQtyfrFHV0cNXZ3Eq09XI5/iSbTc9BfNHqOF2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vk5m7Sub; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb5743074bso1597801fa.1
        for <linux-rtc@vger.kernel.org>; Wed, 30 Oct 2024 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730316738; x=1730921538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usVZ4YEunIbHVvBSq748OooOQsnvI6vxSw64f7E497c=;
        b=vk5m7SubHmGywyjEiuLTmzq4wLffQhwdVTLYb2YspBr6SNlhTQXI++sGEXTPr1kFoi
         cmLW1APnsf+ZJYhKAp3gHzhK+g+bA6/0+a3ToQKCn378QZG3u9ZQ5q16w89F70ZHjmwh
         H1wgbiN2Shl7KQO9pevvG1hc8l1ixJgte7ovHwXjpw7ppOAYEpcUO8qoDnYGdLFVFGNe
         lMlVsMBbUUl/ptasJUyEPZI1Gbg0DX3ls9yVhzA6Mu8yAIraEGk+eilQ7Q+/QqupykBH
         rvHWiet+EoQ9r9aA0wzPdSFK1RmW0AyAzK7zfJYQIO1odMRU8gnzUyCsBY5NVox4UqXT
         D1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730316738; x=1730921538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usVZ4YEunIbHVvBSq748OooOQsnvI6vxSw64f7E497c=;
        b=akIqxrZ1vIflcCZWIdM1oV9UamD/ftTIMATKxQ+4IjrBv6w5UbZIL/TfggwrY6Ggj4
         ESdnis+Y/OgJrd76w337ozw/pWp9kkWJAKqe3O/V4ZEF/HZaqRED6EXzJpCUMNba/WkC
         meLFGXDKnKQQtm5RoS/V/ASNzmTISoZa/wPH8mCe9frFea3LcHZQVF+ZQim5U88I/gM0
         gfqtjZyEdC2z1uaAG4LeaDFW/pMqCJb3MOqWZeYvPJferFWwsNyy57+5VazLtIOIYfp2
         +YqPRx+RSjAx1I3JnV8C54sRmY6t/45iSwxoiwDbqPYbzYI9VpFuiGzaoM4KLGZDXjr3
         FoYw==
X-Forwarded-Encrypted: i=1; AJvYcCX8JDOLtHBujLC9ZTLZrmtzUbXOcWVROw+1MlIBWWlfJ/MLo/QQOSzWYK5uQjawgJQd0ILkwnXy3N4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5BP5AdgA1Wq26FZPkcFhpGWbT7+E1Pl1Pe/ZaiNSwjgQvrNq
	1kZTiuho2AL7ax43iYv+f8iIREQxR/upAdnYcI3H/w3s2fCts5OG15F9hdycnGAWB4kP1n+6iIX
	7894dDjgwcRkHvGHfmvTSyclTjNQcdGiQMe82Nw==
X-Google-Smtp-Source: AGHT+IFG7ijwW0f+Mp81RtWCW2V2VJcGxvm0/VX42o/gwTzTjjOH3/XQ/oqOur+E0bOLJYsbtRDWQz/jjZOssJBW5CI=
X-Received: by 2002:a05:651c:896:b0:2fa:ce87:b7da with SMTP id
 38308e7fff4ca-2fcdc9470b8mr26994961fa.18.1730316737580; Wed, 30 Oct 2024
 12:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-3-tmyu0@nuvoton.com>
 <CAMRc=Mc+SZN=EytxY=qA-qBEAY_F17GP-7FRE9oLojLbdUoPaQ@mail.gmail.com>
 <CAOoeyxW4=+5-QMcd_wgncFC9jgx_1Zf1Tq8RTnBvVqZ1JcUBQg@mail.gmail.com>
 <CAMRc=MexqwSCDrsBS0mK0fo_MCwngAH9XVgjRuDQjw0TVUBmPw@mail.gmail.com> <CAOoeyxXRrDuKJRMb3O2h3BF1vC=pwNN3DKfnEN9LnA+jiBCTQg@mail.gmail.com>
In-Reply-To: <CAOoeyxXRrDuKJRMb3O2h3BF1vC=pwNN3DKfnEN9LnA+jiBCTQg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Oct 2024 20:32:05 +0100
Message-ID: <CAMRc=Me+R_i1WxFGeVe-MRREGn1YJvUon73A4FHDOPgs8wVaCg@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 9:57=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wro=
te:
>
> >
> > No for line names - as this is a dynamic USB expander, I'd suggest to
> > have them in the driver and assign to gc->names.
>
> Could I create an array to map each of the GPIO pins?
>

Please trim the quoted email to only the relevant parts.

I'm not sure what you mean by that. There's a field in struct
gpio_chip which you can use to set the line names from the driver
code.

Bart

