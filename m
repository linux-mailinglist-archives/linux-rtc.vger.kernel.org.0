Return-Path: <linux-rtc+bounces-257-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DAE7E729F
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Nov 2023 21:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D6CA280F7E
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Nov 2023 20:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D0037175;
	Thu,  9 Nov 2023 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wRlxhK72"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06137154
	for <linux-rtc@vger.kernel.org>; Thu,  9 Nov 2023 20:07:02 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F31244B3
	for <linux-rtc@vger.kernel.org>; Thu,  9 Nov 2023 12:07:02 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7eef0b931so15470587b3.0
        for <linux-rtc@vger.kernel.org>; Thu, 09 Nov 2023 12:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699560421; x=1700165221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxfBT9XrSRT5nrDSafWJh9sd+I3zu8gAVwzWVP+isuk=;
        b=wRlxhK72w6O5c5iPkyqSco0awCEHjG8RKS1w691vXr5E5gHa1GxtFSK2UMBm0f7at7
         lbRNSpBebmSMpS/Deg5XJ8VvdZNuhIjegYWGU5ikllSTvlUEP8LSXQsd4dBfNaR+yNXK
         tPgTHRb1gaJ0cOAX643Ohba3mpPxbo8RCwnt1HpkiYrF5uJ1pGSnOHfiTueFWgE3Dqn/
         u88ZBAn2tAuicHiOPEuD/SPxw3WsKqTO2GpW/38AnZRFTS2lp1XLiPLHp4J5/tMyK7fw
         sHAwZ4aL2oq1uB08XwGLuEI+fXXa+7oK8w6n1R8PZVbltQoo1ZBbfMWh7vSR1ePzxy9a
         uEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699560421; x=1700165221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxfBT9XrSRT5nrDSafWJh9sd+I3zu8gAVwzWVP+isuk=;
        b=Hz31dxnAxlkO/fXVwcGkP1RBsh3Oxx1Y6dt01mtULqpY+7sGi9iRhHLANvmbf0BXJL
         DHiXcrAHCKDr1H1G+GYC2ddB93yIZm0csxIIpwgMpmq/aPWFiGkuxABmOXjfISrT5TAc
         vztQmDN4v4OYCgcrsjFvvV7EdGcsntXHTHt90YSAWRdbNjwTzKurUBtodIWSW+9Bq7fM
         48roBvEUDqrtuvUOy9IPaWwf20Lk+z4/dXfwLnOZWGGqau7qhgM1tIjx56r25axts935
         odlYJZBsgtKj2yAvi+sxR0dMSk97POXlVQ7TQdbOYV3YcTeAzehU0Xt6tWcDzL19MMhK
         9M4Q==
X-Gm-Message-State: AOJu0Yzly0DzG9/9FqnvYGheNuW+m5TR6GMsZQmhP/EYt1Zz4f9x3Tqt
	b4jH4y+F2b7NeM+im+ZvjbLPkMPL95HLhWwRpM6bTg==
X-Google-Smtp-Source: AGHT+IEXBKt+FURrtNfddWlqR3gL5F6B4MyNTpLeCgYWcpg+lWu9UphB2hG1mn1lgkc9/kt9ZZeKnj4In3j2CaEDK+8=
X-Received: by 2002:a81:df01:0:b0:5ae:c35a:807a with SMTP id
 c1-20020a81df01000000b005aec35a807amr5649968ywn.48.1699560421299; Thu, 09 Nov
 2023 12:07:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org> <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Nov 2023 21:06:50 +0100
Message-ID: <CACRpkdbAwOfjbD_CjC4Aqi_A2+pghTBeWyV7mPMZv25BXMPStw@mail.gmail.com>
Subject: Re: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add specific
 compatibles for existing SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2023 at 11:44=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:
> 1. Compatibles should be specific.
> 2. We should add new compatibles in case of bugs or features.
>
> Add compatibles specific to each SoC in front of all old-SoC-like
> compatibles.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Makes perfect sense to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

