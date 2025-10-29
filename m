Return-Path: <linux-rtc+bounces-5214-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C6C1ACA7
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 14:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1294B5A502C
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 13:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631982BD001;
	Wed, 29 Oct 2025 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUmnKqAV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F5729D291
	for <linux-rtc@vger.kernel.org>; Wed, 29 Oct 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744384; cv=none; b=ktfT0vyU5GwZTJKtMwF4EKMFq7qGH4bAbAZUpappyn4xbZ1cYMdf+XID63c3FyyzDE20BrQ1ZJvdiuglcpyrEWAw1WVLW7rdp7WgQ0SR7Jrqin8cDr1VS8YWjPh117SPHqET/8MOFKvxxicjHhmPE7sMtN1Ao2KEULkd1LrIoiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744384; c=relaxed/simple;
	bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUaI9uF0FqOPJYhIedowIVEE8FWS7SYvB050Ettx9f3tJW8PYNDHlo6CBQoqrt3WSKL6JRDqTagQuT5W7ZwHcvmWmcK6Zts6PsHddmImPhUSPQ1AOdZxJJeYvHVweLDTPHdDVK+wnVQ38hJOhZukGcvZW1v1pfY8sdg4vgM6/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUmnKqAV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378d246f0f1so78111661fa.3
        for <linux-rtc@vger.kernel.org>; Wed, 29 Oct 2025 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761744380; x=1762349180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
        b=iUmnKqAV2ZqMdwnarD5Ij79DsuDs8d9nv9eDEmFWWJiu41QA9o1q9vb8Pkbw3xbwmL
         c6QCK4LsJtvpN8Y7BhbLijAl1jzxLs/rlhWG9ZVtfRggaPEayDKQmSSxpfpjumVUz0H5
         I8GBQUEMGUmH5HGOvkZB47Y6tPmwj/vITe7gdeYhYEY9X5hUMk4F8RQ/Hv0XqxijV+c+
         nb6NKK0uARBBlJV1IRx5XEZ8x3KkQqHeyeRmN11znwsMl4mZwxGKDovmKAqV81udKgkq
         VTaAMZFkD/rpE6QxRLyak22lIf8mIBCRZqn4bUBxHJiRW7plr8/Hq7YjCbztGtpv29yI
         C6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744380; x=1762349180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSKuU9xIOHp+USY+0olHQZuj/v2CpxFRMmxMh6Q5UbY=;
        b=AjrKCvfaEXzfH4hUfYQZTExnN/WYnPbf7Glopg/uV0ni3hjhfs00Jdl+HdmEDY2xmp
         zjVPblm2P1ikGx82ppwf8KtKcDeMqosLdmfG+p6IY9chyZpTSBM/beYRhwdCrZp1aM/M
         SdzZGXlz4u4DGga5UDTeM3IDQiaA1Y4r/HN7YlK+LtHkr1evFOv2XzsaW8GeH6JX01qt
         UVftVzubpFbF6t9MOVbgcRk+i6fRxefRvHQ2Qyb/OMeWcOKX0tCrqPLlyk+ABVa2CM/q
         s2eUZKlLVGY38jfmKOTA2oWtaIDkOB/5LJKNfAxQ4XnFP6ZKvxlMNvcFeRSPvUYbyrI6
         AW9g==
X-Forwarded-Encrypted: i=1; AJvYcCVtNWdVlShTEjzKiIqo3e5bCJE0dxRuI0hKFoXkiSs/7n2nkwU755ArPa+R59RjZ/fUGLbMnwRhTyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwA25zSWxBKchy/bkhd0CMm4UBB4R/NG8hkStAQPQrXH0XFMt
	0XNO2jdXQVF08NPYEX8X4OtnDckasTFHr5H0Mwaxveeenrw507j1iivph/9a4GSGekuNVleg/1c
	HVvyxn9iuVKeLjBEEnv/4CSbzsF+dCGMyH9F0cIJ7rQ==
X-Gm-Gg: ASbGnctmpmklAUFTZHspaTblLlY9u9FEbMfUekUtVKdx6f4ELA1zf+1e5EYUfgQKdpF
	XMk1t7bUUyf5JSf/PFFCqDFj/CcMSv+EnaGEcl4WKk2ifUqgkHsRBtQ4vOlIjfmutriQCDcfmSK
	DWjPaoP0Df3KhMwI+QQrhUbcSDPf6GMvIX989OS47J4Jns30dh5J35gA2lNdiXzeFx7lB/PaiUX
	qjbW8GV8uDX6C0ZUP0ez5QoAOtiLamDE6mqDeqPH2ENl2zvXl3V7IBG0Huy
X-Google-Smtp-Source: AGHT+IFc/hCvDE1Zso/0IxQN+geIgWUqlAHmVbZSzAYj2L1gPzKHQM2rtOb3cVJ3wqFIdmrbO8L60WWStqgI5NAbuCE=
X-Received: by 2002:a2e:9a12:0:b0:36a:f4d3:82e9 with SMTP id
 38308e7fff4ca-37a023ba912mr9579411fa.6.1761744380200; Wed, 29 Oct 2025
 06:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <b13b733e7e0fba05652f49f727412fed9e0ceb02.1761564043.git.mazziesaccount@gmail.com>
 <20251029-adamant-mamba-of-patience-cddb65@kuoka> <a81fba66-adf0-440f-96e1-bf3a83d504d8@gmail.com>
In-Reply-To: <a81fba66-adf0-440f-96e1-bf3a83d504d8@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 14:26:08 +0100
X-Gm-Features: AWmQ_bkO8UFcogwNBcRXNNMdmHiXiiZyPgTHaU5THyaD5CILTj16yxOphtBr7r4
Message-ID: <CACRpkdZcszMZEU2Wzx8kaoR46ytziqtedmCrsjEL3QOrDtDgzg@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: Add trickle-charge upper limit
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:22=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> > But I believe this is wrong. Trickle charging does not switch to
> > anything more, there is no fast charging after trickle. You have some
> > sort of pre-pre-charging, which is just pre-charging.
>
> There is trickle, pre and fast-charge phases. Furthermore, the
> fast-charge is further divided to CC and CV. Finally, if my memory
> serves me well, Linus W did explain me that some chargers use
> 'trickle-charging' as a _last_ charging phase for a full battery. Thus
> the term 'trickle-charging' is slightly confusing - but it is already
> used by the existing bindings...
>
> https://lore.kernel.org/all/20211116001755.2132036-1-linus.walleij@linaro=
.org/

I think we need to refer to a textbook or IEEE articles to get this
terminology right.

As you say it appears "trickle-charging" is ambiguous.

Maybe what Krzysztof suggest to use: "pre-pre-charging" or
"empty-battery-charging" or something like this is needed.

But we really need a trustworthy academic source here.

Yours,
Linus Walleij

