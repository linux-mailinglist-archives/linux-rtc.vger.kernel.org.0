Return-Path: <linux-rtc+bounces-13-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E707ABBA4
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Sep 2023 00:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 07B6C281FDE
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Sep 2023 22:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A9147C7D;
	Fri, 22 Sep 2023 22:07:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63FD47C72;
	Fri, 22 Sep 2023 22:07:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC12ECA;
	Fri, 22 Sep 2023 15:07:24 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC8C660003;
	Fri, 22 Sep 2023 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695420443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ilgz1R5QPadu1puRUJsHyEk5oETIb+9oZ0wJLKdwzUA=;
	b=NNUlE+TaSiTEJYgynuv8Vw0hgOwUXq0N5VNf9yWO9UJsgMEILTcvYrK5vGLtIPLMFwKAVy
	Eq4+gms8K0mDJmpcmlNi/dgwaqcdUr8VaB42eLlzcUv8q40pmfNdGNcpf3FS3hUreR2mjW
	jiMTeu6p16F02Wi+bVG3bPfRtAQam5c/W26y3rKNUUsthxna/NozTstunzZx89/DEXsW6W
	KOKZKhvU0xc9unU3Yvr18POKW2JZLzWIbI+yEsepcO3UcJGXRHVMxj7cgraZ551X2R1z4w
	GYaIjpN0eNwXf8EFGw1Zn98EpPOw/SKvplqA1o/8KQUPGuknbkOTmeeDUHsxVA==
Date: Sat, 23 Sep 2023 00:07:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Jose Vasconcellos <jvasco@verizon.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: rtc7301: Support byte-addressed IO
Message-ID: <2023092222072214ad7886@mail.local>
References: <20230921-rtc-7301-regwidth-v1-0-1900556181bf@linaro.org>
 <20230921-rtc-7301-regwidth-v1-2-1900556181bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921-rtc-7301-regwidth-v1-2-1900556181bf@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On 21/09/2023 22:27:43+0200, Linus Walleij wrote:
> diff --git a/drivers/rtc/rtc-r7301.c b/drivers/rtc/rtc-r7301.c
> index 5dbaeb7af648..843e16966b65 100644
> --- a/drivers/rtc/rtc-r7301.c
> +++ b/drivers/rtc/rtc-r7301.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/delay.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/rtc.h>
> @@ -55,12 +56,23 @@ struct rtc7301_priv {
>  	u8 bank;
>  };
>  
> -static const struct regmap_config rtc7301_regmap_config = {
> +/*
> + * When the device is memory-mapped, some platforms pack the registers into
> + * 32-bit access using the lower 8 bits at each 4-byte stride, while others
> + * expose them as simply consequitive bytes.

Shouldn't that be consecutive?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

