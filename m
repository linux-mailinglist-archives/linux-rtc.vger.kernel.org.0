Return-Path: <linux-rtc+bounces-3173-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8045A320D2
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 09:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 809597A3663
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 08:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D14A2054E9;
	Wed, 12 Feb 2025 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KfE7zELY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B548204F62
	for <linux-rtc@vger.kernel.org>; Wed, 12 Feb 2025 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739348460; cv=none; b=dLmWq20+jGJ0UTefqiXMkicPmKRN9HKoaAJqJrb3eECGI2Ox+t2M+KL4o/z/HA5t8+NqJNFAbpIh2pfNamFRRmyfTkA1LCQUGI2scLZm142zBnGBJ7pOsbfQmDiZnq1F98lLvfrR9noBFsmbtPA5PeSfkKTtWNHT1y3sdzb0ypA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739348460; c=relaxed/simple;
	bh=dt7mTqxVDPujGC4i5+vhi/iVi9M3QFBPfFhyk83MMVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAO5/0L0Qy7RQ6IrWaEJ4iZQUsh2r3YJKSfLb4WMSQUwbtFSGBwwgP7/KWGQ27PnvTQKWhzQE4zqlOeaJ3zRPV6LCjeNhpApgd0Nc1QJP0MIhchNSPF+Hi8VDYsPkQEt/0+B017W7mGp+XKi8+3/5jn3ZG3FiguU7kutoxRcJEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KfE7zELY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so1156568a12.0
        for <linux-rtc@vger.kernel.org>; Wed, 12 Feb 2025 00:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348457; x=1739953257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4plJ+TLmBGf/WTNjrm+6CqwSfdP84ackQKWHmK37yA=;
        b=KfE7zELY8cAmBe51AHM1HrNOoJihbDOwQawROKv1uJ7PFGYVyJWyA1mKTr+hjFpppA
         AdIfkNR3kmAXfuCLXUzOzoM39mt6OdD8jPGAzNfjWUX3NTKQqXYodU0d4H5qWdBWFziP
         fjkPAXi0IcljiWZ4Gti6HYdA83K4h/FZidtF5y9iyIc20fkSI/6/hTn/5m52YHNIoAAS
         lkMQkj7YHIHJ4fSKOBiYPC/p8GZGwhBDhL7u2KQA0IzdedoF9WXihJRf8HT3kBL3OXGm
         KzWuedUNFlW3YIKH46co/5DqZT1kbH5pS1qjbNEbxXwTC546qIJdq/5kGSRChRNzWwjb
         h+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348457; x=1739953257;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4plJ+TLmBGf/WTNjrm+6CqwSfdP84ackQKWHmK37yA=;
        b=m7Uc3Dg2lR+IiNS8bgf720QAQ1Oxcz1AKLqfEkoYIjRIdzwm1fmVuKWSFvbisHVqEf
         MTFhyGykC5FNLyXT1+QhQw6ho4ecwcinI6SW8YrSLMibdmlNLhtmknagTa9M/4Hor5xN
         +YGeZ3RnXETrSOy+fbLa2bzneYDHxO4Gafz5v5sH4wliCa0RkZVIOwHGyWZQOuIdvvGx
         Fyg8hgMl/5dnXoTC0elvjnmBHWo8KyvEu2Ua3NjTkgs0pvf3cubTUXpK3K7nOrbxli43
         wL75cY29LwoeLRxeYMntpT9frcsf0SyHQN14fNpydZNZPHGYaKR7aoQKEswe4QeDC9x6
         GUoA==
X-Forwarded-Encrypted: i=1; AJvYcCWMRf0DyHjkwK8nxkTBbC7WX6Eo+I6UbFmZC7yvgNu8EvrTQa4Xw6t6L6LvA9QIFUH8Aeve8sGSfYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyadrxxTwxOPAlEgQltQ1P+5ipXmlWjvc1umtPaWN7/gxKFDG
	noyQa3kGEo3Vy+nRbcOYjLLKgWgeQnnTbtM37YA2x3DZwD8ycEgn/oyvjxJgSFg=
X-Gm-Gg: ASbGncvE35eGGidex4cqno5YW9vQlE+teHfzGYeYCcVZiBXv+qyuq84jlp18oKKU7Ry
	cYCI5inPiMa66GKqxkEP536okrkjhX/jL1tUs3isY9GOKY8pHboCDa8eagLsEQlCXD7LHf8V2NG
	opKD+ZBjMtqKE8SSlaR3sjqOW0MZqgMksuzDZaTbKM/JFIw8Ksnj7jJhZqtAfrBRRxsbhQjXwUa
	++H++/aVMxiQzLQP6dABJhh+sNsh+wwIMIRR1l+KUewJeZ7Ty8aQE73eg5ooTfyp0vw/tUu04H8
	6WQK1RjE2Ax/K8fVT5EOS0pO
X-Google-Smtp-Source: AGHT+IGHgQnz97yzWagUt64UI9llWg0kGJkKPM/iEqy5L+liOX9Mj9QGFUHTzEDBGabzYNsN0XqmLg==
X-Received: by 2002:a05:6402:2084:b0:5db:68bd:ab78 with SMTP id 4fb4d7f45d1cf-5deae0ea210mr1791667a12.10.1739348457023;
        Wed, 12 Feb 2025 00:20:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4fe72207sm9052128a12.38.2025.02.12.00.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:20:55 -0800 (PST)
Message-ID: <82b072df-57b2-4668-9439-1a6c89788268@tuxon.dev>
Date: Wed, 12 Feb 2025 10:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] power: reset: at91-sama5d2_shdwc: Add sama7d65
 PMC
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <e3bde200e4b8efe69656f1ecc9e8e7c5c6f631a5.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <e3bde200e4b8efe69656f1ecc9e8e7c5c6f631a5.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add sama7d65-pmc compatible string to the list of valid PMC IDs.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/power/reset/at91-sama5d2_shdwc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/power/reset/at91-sama5d2_shdwc.c b/drivers/power/reset/at91-sama5d2_shdwc.c
> index edb0df86aff45..0cb7fe9f25a07 100644
> --- a/drivers/power/reset/at91-sama5d2_shdwc.c
> +++ b/drivers/power/reset/at91-sama5d2_shdwc.c
> @@ -326,6 +326,7 @@ static const struct of_device_id at91_pmc_ids[] = {
>  	{ .compatible = "atmel,sama5d2-pmc" },
>  	{ .compatible = "microchip,sam9x60-pmc" },
>  	{ .compatible = "microchip,sama7g5-pmc" },
> +	{ .compatible = "microchip,sama7d65-pmc" },

This does not apply cleanly on top of v6.14-rc1. The conflict is on sam9x7
compatible which is missing from this diff.

>  	{ /* Sentinel. */ }
>  };
>  


