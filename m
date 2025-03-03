Return-Path: <linux-rtc+bounces-3367-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED1A4B995
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 09:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA3416A207
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 08:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24B41EF08D;
	Mon,  3 Mar 2025 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="d/m7hkht"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B61EB1BF
	for <linux-rtc@vger.kernel.org>; Mon,  3 Mar 2025 08:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991233; cv=none; b=N9Ft4qu8qxXiMbDmaw0oFQTi+/qeG+LA68TMUyS/59R42H2t65WzL3zyCjG+XdOapZstOPG23cjL3R15ND2X9wMsrGVq92gHscL2u80iTLws8eUqgbXdXL1hxXZuwQaACJqWAJa4C75OvwIV1DaYSeQYQgsLRg4VBIwcVeyitWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991233; c=relaxed/simple;
	bh=TPu0b3Yb8x9XdyZxR9D2BnVeAYiPf0X8CkpwpVfMdK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2KH3ZfHBgxl+XS5bOgAeRjyLaHfDADbxIHVDqp/rQ0tcr2Q0+8pkWTtixzCLxobp+7joiWlb6JFGpedMDT7yoyZ7GM+Z7vnFhJNr4EgM3AvRbQp/FFN9IX8lzZszCPgxr1acujV+gAbFy84KGx0nxFtEHrisIhnsYxgBHCgpV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=d/m7hkht; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso741265766b.3
        for <linux-rtc@vger.kernel.org>; Mon, 03 Mar 2025 00:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740991230; x=1741596030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7t59WyUTPd0L7Mi3cChysUXnRM6v1fDvAcY991WF1bQ=;
        b=d/m7hkhtYbS9FQ02J6OUue9K8XWSrfTQsCQNsJrxXMnxjx014Y6lhj8GGfZ+cVKWF3
         6G4lCTOCKCMQgqPi/gOTKfc8c/oZ7g0WdDCdhU8DqXoVmXPUE3yhEVR23oi1Wr5O7Jrc
         X9YbsxPxkJfmky+wXsnCQ+CMnnS3T6nk3yzLcbJptPvxUXKrBEuYGZPOWj93D+lFsS6t
         xEeK6ZBm9K9+6z2IKe8baqMJdv8wxUH0fPpsFrwd4QMydaNxCYB8OaTo/fzYc6/pA5ZD
         D/pQq9D8ezHncVdTX3enW14hctaVjQRdh7w9o0s/hTyKPAOt8BNPnh/YajxIzKBS5fdE
         N58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991230; x=1741596030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7t59WyUTPd0L7Mi3cChysUXnRM6v1fDvAcY991WF1bQ=;
        b=CI5NOrfxHH+0jU1gvk1PtBkERRgO4gA7Hx/JJ80xAxYjsh+vcjHPEC9v5VTtOh5iSd
         KyJyjXiZ8dlETEAalXftTKobQQQhfXaKCcIeSSgdajU6dY+f3suINnNXc9D8REF4SixR
         Fe6DBgxLPyq38he4SD1GQs7lfzyW3qhoydJmdbxC7eTjEkMM0b3aQcAuuYLopQE9ycF0
         9HhzbY6wAWShOKRBDQhvK/B/qL8sDWCPlAEmgijTSGcp3jUJXZCpaMz2h6JVq1C5s7ym
         OmLKAtkFVCY/H6zbKSVOyAqCCqRQjXJVwVFfcPU8HTgv1ZHKYKEQ7jVb3Ks+ykrTVp1X
         h1hw==
X-Forwarded-Encrypted: i=1; AJvYcCUny/d+/oOgsB+sng2QY/ImCNzumSai5+eyCpmJORukMJ/mwn0akMXy1noB8mDbGmwtji0TDK7l3nU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrJ72P0ODFzgKFVYX1rV+ILVEU7UXBcSpolGh3B/1/jvqYfbE
	+awGPIvARXrW52AtkgLf8SS7G+25LLXqk2LS0aKAmzYB38fZ1UN36teibDOffe0=
X-Gm-Gg: ASbGncuRssMYfdUq2pEVyC5KR5S98wSAkG7H56zTpNZXx2OAghK72A3GVlkS3Ke44hK
	IgPkWBdk8c8qvJpBwLyz9VQt23QgLVGRTRo4Wh5wNzuW9t9maP94OzzK/LKBMk3PuSVp7dAGFPq
	NXnq4dCXRV2jfpPmUmOemJ0cYv+KdAvZD0rZ3ZgIFvt5xOsqNmHEY8yqH40Spxc4yYtcP4FMm1F
	QZJsjWfGxTrHblohSiXcWgB33AB+szQL39jU2QSbZ7QcefcBuQQy77ZMzTziib32NhWMysRPNwY
	cYlLn+GRB8XlMVKv6KloWQjfG7FCh+9ZPtgTQaKGHnGI2QgPWxLuAQ==
X-Google-Smtp-Source: AGHT+IFbnHrYeaaWFN8nqN3k607A73JWI/jQQa94/Cd3rmC/xFunczpany1uHLkd1AybmzRvqJrINA==
X-Received: by 2002:a17:907:7f0f:b0:ac0:b05:f0c0 with SMTP id a640c23a62f3a-ac00b05f592mr254231866b.1.1740991230131;
        Mon, 03 Mar 2025 00:40:30 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b98e1sm764527166b.9.2025.03.03.00.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:40:29 -0800 (PST)
Message-ID: <2a18e305-090c-41fe-9b27-97ebe93fd4e4@tuxon.dev>
Date: Mon, 3 Mar 2025 10:40:25 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/21] Enable Power Modes Support for SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27.02.2025 17:51, Ryan.Wanner@microchip.com wrote:
> Ryan Wanner (20):
>   ARM: at91: Add PM support to sama7d65
>   ARM: at91: pm: add DT compatible support for sama7d65
>   ARM: at91: PM: Add Backup mode for SAMA7D65
>   ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65

Applied to at91-soc with some adjustments, please check!

>   ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Add Shutdown controller support
>   ARM: dts: microchip: sama7d65: Add RTC support for sama7d65
>   ARM: dts: microchip: sama7d65: Add SFRBU support to sama7d65
>   ARM: dts: microchip: sama7d65: Enable shutdown controller

Applied to at91-dt with some adjustments, please check!

Thank you!

