Return-Path: <linux-rtc+bounces-5405-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26781C6AFC9
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 18:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 34AF12B97D
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 17:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A32349AE8;
	Tue, 18 Nov 2025 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="G9RPzdtO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9E131ED6E
	for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487173; cv=none; b=GiiOg953sXwhusZ6uouww40b/miBxTfdFGiPHMjnn5wq9NdM3O1CVuJj3apbj/3W9hAL6FfHszk3nULaosPdeXMCEIjB0llg1iZKcWJPuRJ8u9rxcVw1RJrGWx/HNqhdylhCeZiZIJh0wA85373FkdCZ4Zn2DqPUqr5h2N0TeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487173; c=relaxed/simple;
	bh=xsbCHfdfJS3GyOiFBe9tPYn5s7T1RShrdeMH8RFRZu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdxbN+B/YWlqAF9Bv36YSd/Db6CkJSuI5PRslo1LrVWjb16au+vvbYlQdmvq4VFMOE0wP/qyO8bFYUoMUdu5MoTi+T+MBTOGOmBVtCSc6pJvAgLmSGoEGMw6AVEmmeufw572tf/wljJ0BSkj6r8hgKMJulO01Fft9oscDIHCFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=G9RPzdtO; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-4330e912c51so25341965ab.3
        for <linux-rtc@vger.kernel.org>; Tue, 18 Nov 2025 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487170; x=1764091970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi2g01Pl4HghpEkqiXiXs3PDN1XWinc+i2ynrpZ9eb8=;
        b=G9RPzdtODoGFdSXIdHiw+2/9xNd0/u11waPmgyfh/5wUMM76KYiHU2G/o/OuokPwKy
         3jltB7RDXy0SderdHBlqX6GFI5xOdiJuwm/PZaUV4ZRK6s2G5VTSVhVrU9nPNAD+yQhs
         aaUTwoNxdYHde7x9tjqCJdmFARZngkdN7qpN3MWn69mSbKUlIS5Aq6PaFZgyRptdCo4J
         baKBt8MgTDWKJjFKXOPBwtvX8nrQDPj4DZYyncWKf9N00yO5EegIyCmT3UvbeUU0BSSY
         fAUGH3aW3Y5Wthex54MBkjItzhb1pqEnrCzfMmsY47ptflsRvQwfCswdhy1wZ398g7+T
         xH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487170; x=1764091970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi2g01Pl4HghpEkqiXiXs3PDN1XWinc+i2ynrpZ9eb8=;
        b=uACex86oKX35RV7KdGu3QPv3Nk7pX6hIsExYbI2oNqnjvdNN937QdWuz3yzVPELW7x
         5KICD3R2NOGejsYiAp2rVFPrWmN4LhTP+4Qr0hXXnTdveWIvV86+giGppWGWmTy/RUFv
         ZQVQAEAuUpUMTXoZ2FQnPREZvUbXoAw5tMt4bYbbUBdsBVwMbj9lfcUvuSOvS/xMmJd1
         kmCdCMGlQrSlfzMIsIvQxeh7cj45g8SLbm3i9OetBDJnkI9mGEKpMMzfA4NxRaZpbh91
         Icr20pEmsHBbbXaZ0lbRyluk5CO4NtScLqvfsSAnou6CUjYhNnS9t1sMhhgWeH4V0SIZ
         fQjA==
X-Forwarded-Encrypted: i=1; AJvYcCVWO9Wq7rp22WeB96uv5FTS8UVJ6sVYhBIoMjEP1DqpQakOt2aZfCwu58nl9ZRjSfgh85JJ6tvqsDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjDKD2+og1JJ+ReZNAFHcbs/tkkhnk93MX/8SDp7CWfsFYez3A
	RpzxYsZ37UaP0Vg7b0F4QE2YODIqNtJo6yPrQBihCbaeCtCcndGlLg33rj6n0FPlLyw=
X-Gm-Gg: ASbGncscg34PFMZX4JS5MWZiQC1GFRjofNX9H0xwIIHLV5+n+gSuSLC9VRyXU0Itd9G
	27F0kyj5ABmkr2n/L3i80djwE5BG7QnD4ZWhjPuCgtK8Kjn2N9p9TXZfShoXABUvJ1WB/CSOL8d
	INNvbeB+pjq2FoP02cLsuPwWpc92Q4jWW85qeYHYmZNAHER2+iDGo1/BXkkuGutch/Hjc4xjRgi
	kPgcwvTaWFtzVFHogkXohzYgcwmVNg+R1bmEeIRiusTt7PGbfQQLjEUa/1KDSVqOllMFJZ2vKgH
	s6iwQs4DrYlJmDRgVYDxTlxA+St0YpLbrUpeXr2DWT7DQkDcpen/iOV4/fZjwtOKQJK44gmIpA/
	XDpu2Qrw0Ad68oWfM3sfUfnCEIO5oL8urtiejCpoC7yIS3BOUUxMpuroAPlsfRn1fxoTCDytXeO
	OElhVGtWBY0qd4SfcKMkixDyfNWtkXaUk/ZYMw0x6RXFW1INNeLg==
X-Google-Smtp-Source: AGHT+IEvjf8wjHz1IDZuMlpDmRvZ1PR2gWcJIHsR0vG4NMPKURJNCf3jErqqY7OwlQvDOA+3W4E9nA==
X-Received: by 2002:a05:6e02:156f:b0:434:74a6:4907 with SMTP id e9e14a558f8ab-4348c94e271mr229950765ab.30.1763487170478;
        Tue, 18 Nov 2025 09:32:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:49 -0800 (PST)
Message-ID: <4e8ef549-9c31-480a-a88b-5704f9e12bec@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:49 -0600
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.

In particular, it looks like it doesn't depend on I2C...

> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com/
> ---
>   drivers/rtc/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2933c41c77c88e60df721fe65b9c8afb995ae51e..b392e6d096ed077e841a2e68b70d8b80d9ad1cde 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -409,8 +409,8 @@ config RTC_DRV_MAX77686
>   config RTC_DRV_SPACEMIT_P1
>   	tristate "SpacemiT P1 RTC"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default MFD_SPACEMIT_P1

If possible, this should maybe be:

	default m if MFD_SPACEMIT_P1

In any case, this looks like an improvement.

Acked-by: Alex Elder <elder@riscstar.com>

>   	help
>   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>   	  This driver can also be built as a module, which will be called
> 


