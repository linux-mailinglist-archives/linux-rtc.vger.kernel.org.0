Return-Path: <linux-rtc+bounces-247-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20E7E5D83
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 19:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A585A28126D
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Nov 2023 18:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511E132C92;
	Wed,  8 Nov 2023 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED26832C82;
	Wed,  8 Nov 2023 18:56:33 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45212210D;
	Wed,  8 Nov 2023 10:56:33 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1f0f94943d9so1269626fac.2;
        Wed, 08 Nov 2023 10:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699469792; x=1700074592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0s3leUhfdCXtqd2GQERP13Q2t1M8oOeLUmcRLyKV8Y=;
        b=kCHCZdLlgHL2Z8THYqohXsXQLyceJubLKF+B9kWnJIbjy74FfGwGcf8nDZKlI+98yI
         vVFYoAEalh04e/y69MlLQVtAUdoQvFZ/6LfvU0GaXL0SP4MmVZGLA+diOrVN2RKkNlUf
         s5ggPo8kUvFz3SXkfH6r3ZHrNPfhuccZmToh5CSgGXj1iHECfhh2Ub2Jaq+FXy2DfZqD
         dugVwK29TgynEpAZT4sTnq4kOJO6WgJvpCcNB7oZ46Mmi01hFYM9Ac1E58m8jKzGyDxE
         UjHonWdNpCSKqs1SyegXnS4EBgMchxYvn0ZAJwFXTVN83nIDrWaFNephfOJVmDAfU/62
         R1AA==
X-Gm-Message-State: AOJu0YxGrZg9s8KlZb+1tTEWVn3LGopjphhD99+LHS6I9SEFM94cS2jU
	4JdtqnLs3ObX6XBfjkBkVw==
X-Google-Smtp-Source: AGHT+IE0mbiHvR9GjYeolkzHi9SUwOP9v8XsmJuVs9xWh9Zkn8dD1A7MBvs46KqOAxR54Xhtj5FP+A==
X-Received: by 2002:a05:6870:fe91:b0:1e9:af81:54c2 with SMTP id qm17-20020a056870fe9100b001e9af8154c2mr2838245oab.45.1699469792539;
        Wed, 08 Nov 2023 10:56:32 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ef4-20020a0568701a8400b001efb3910402sm408267oab.0.2023.11.08.10.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:56:31 -0800 (PST)
Received: (nullmailer pid 2748787 invoked by uid 1000);
	Wed, 08 Nov 2023 18:56:30 -0000
Date: Wed, 8 Nov 2023 12:56:30 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-i2c@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-serial@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Maxime Ripard <mripard@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-iio@vger.kernel.org, 
	Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org, 
	linux-mmc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-sound@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, 
	Tomasz Figa <tomasz.figa@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 01/17] dt-bindings: hwinfo: samsung,exynos-chipid: add
 specific compatibles for existing SoC
Message-ID: <169946978921.2748598.1967407376619995212.robh@kernel.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-2-krzysztof.kozlowski@linaro.org>


On Wed, 08 Nov 2023 11:43:27 +0100, Krzysztof Kozlowski wrote:
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
> 
> ---
> 
> I propose to take the patch through Samsung SoC (me). See cover letter
> for explanation.
> ---
>  .../bindings/hwinfo/samsung,exynos-chipid.yaml  | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


