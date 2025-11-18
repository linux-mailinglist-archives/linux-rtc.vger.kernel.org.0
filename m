Return-Path: <linux-rtc+bounces-5406-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998DC6B018
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 18:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C443347977
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 17:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279FE349B19;
	Tue, 18 Nov 2025 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nDVMW4jJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC4349AF7
	for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487176; cv=none; b=AZIgeIigSCbAbWKrCZ5oO0aMAp30uvlcr0g77jFip2hkMmqsaqBDxPswWFSwiRb5s+81Z6kjjI0OOaiaC2srdzWt7sQOs2/cUpR+sr/cS63EtSjqnV0swlnJwixHf6XamgqrhxLFvfkPiPkI5kry9PMvFMBDIw/6xicDHv/g6oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487176; c=relaxed/simple;
	bh=qD0IQfQMQSr3tUmULm2hGqSPctE9/lbgVV0xWzp1kmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4tRQoaoEle163VCYFJQqXhbY7w6ZUABaMgj2T5IjvKUuaAnckiyQI7dtpReyw8QOnnuEdcYcOOQbLNwCkfovff7MWCzttygXAY2FNs2Z89XxoTE7lQSTHWR1eR9+/Q+EkDoJWb6kXC6bT1VZc2+vJ0fQjHjsnu5i92q+Sjp5go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=nDVMW4jJ; arc=none smtp.client-ip=209.85.166.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f194.google.com with SMTP id e9e14a558f8ab-43321629a25so38540275ab.3
        for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 09:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487173; x=1764091973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1oOiqDzzj9jTgkI2h8Dnql40uqXQIp1HBHBf0WuCieM=;
        b=nDVMW4jJ6i6gcJ/5Igf8ECwLtBIH610N71F19I02zr8NAa1eNPPeZyuZQA4phTMGHk
         tMvfbn8GqFpmBjYJUcqyY0e9l1hjOVOHdYIxGgleM7wt9rJDr1W6gE3Lcjb4wZOE9oa9
         Bh9ORVf0t03vh9KQmBC0Y0jqnxNe1BduULhC0sSPjDxoKje47rL9RbvIHBlUAGVpl5ja
         50Akzu/beXrOI48Ri2ZMfD0/PK1X8mmK5kPOEGa+ALz0Z0opXPK9XK3NySntV9TO78NN
         44hKtG8BuHG0bbeUil50QvQbX3LONZ8pLkaOBV9LqhIXM/0p+fN57YuF0H58h7K+2Bnc
         zxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487173; x=1764091973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oOiqDzzj9jTgkI2h8Dnql40uqXQIp1HBHBf0WuCieM=;
        b=ThFyjVfyMaIAnMM9gInqgsS7EQg8cYtd3fzSpJ4+kGlh2/a5be2RIdYqZKN8z+b3tn
         z6EPuxm4mFydqWOyBxkvw6fUMPN5N1XHbioje1nPOtC0Ex6TIMWIRppJ/Pbzb2SF/2bx
         l4mw2qgjmhI0n6mj32N9lkUOGUkNO9/nPTYe0fdmpQPrSOI6UI4TYxVsEBttUGJfSsEv
         +oPfyugyCVqBAAyJqWMxKFvCMzON2Tvlo0y57ia41YfGATmbcNJLCeaL/E1WrAnGaTth
         JzzMLo0Uemam7mDBfx2TQJrzUuHYnSaquwTA37elqmwU78VlYzUqvWMNyyov9AHzCk4X
         5WTg==
X-Forwarded-Encrypted: i=1; AJvYcCUDHqd09tVqkpZBl80GlHSIdqrubVc45U/FaXfwp2iRZPenVyz9q3G43Qpd7QxTQ31k8W7QdXbcI3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2XBT3UFNJmzmr+L2Ah85IrCOP5QDj+eyxtms2MMYq6ohUGb6s
	Xf0NsYy4muE4GQ4aXNsboM0BNEaJEFRFoSYAc6JbTu7+wgBJEzM/5MRCKWG28rIleFw=
X-Gm-Gg: ASbGncurMIFt2YIZbIOwzIAfIyE413K12J+V4KGxAgbI1WP0DJQmxTif76LWPB7lC32
	luxFwqACDuej4OKkB6DJfIjozQ9fwqYwD0DDNRrVdZoXpiW5jssLuTBXGUzy0Va7aI28nyl+8/V
	NlXmsMkx6dbMJ0cFQhsobimnn4TGMgd9gGJ6xVERpiUyEpXs4hgw82MMzEaUZjIyjPjH7oqfclR
	7/jXRfhvXjh1bkY0hFVWkFp0e8RdzKX3rUFUsxpK4x0ySmPImgDqhVKdn/Rb28diO2ztx9CmPIG
	hqliZ3klIiA8sKo0jDZHiqMJTJNQytJwKzGKAmg759AbwuMJOJSZdiBhj5pH3yDf2SRPJDiFQDI
	+sbC4c0aHeTNYjH0/inw4nRO8W8M08hjLAnBnhzum2IHLAh8Ox8+tyt5zU24kpk152NgqWFGOF1
	yEEnknUeFDN94DcX2t550nRHTGFwrHdXlP0akNjUTNP22/cnzV7s3C/igKgZc3
X-Google-Smtp-Source: AGHT+IGahI9DGjaU2urpjYEZBPmSTbQQTgXyf3rdyDOFBmX83/b65vQYd/eGVMJz3IuDl90Wqglj7A==
X-Received: by 2002:a92:c262:0:b0:433:7a5f:9439 with SMTP id e9e14a558f8ab-4348c91de6fmr183399575ab.24.1763487173123;
        Tue, 18 Nov 2025 09:32:53 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:52 -0800 (PST)
Message-ID: <d33f6f1d-ce1d-4670-b7a2-1d086a16945c@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:51 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.
> 
> Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
> in REGULATOR_SPACEMIT_P1 is now redundant.
> 
> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
> ---
>   drivers/regulator/Kconfig | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d84f3d054c59d86d91d859808aa73a3b609d16d0..e2cbbb90500189a1c4282511b8d7141301cae1f0 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1455,9 +1455,8 @@ config REGULATOR_SLG51000
>   config REGULATOR_SPACEMIT_P1
>   	tristate "SpacemiT P1 regulators"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on I2C
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default MFD_SPACEMIT_P1

If possible:

	default m if MFD_SPACEMIT_P1

Acked-by: Alex Elder <elder@riscstar.com>

>   	help
>   	  Enable support for regulators implemented by the SpacemiT P1
>   	  power controller.  The P1 implements 6 high-efficiency buck
> 


