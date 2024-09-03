Return-Path: <linux-rtc+bounces-1839-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C16096957C
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5952810ED
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BB3201266;
	Tue,  3 Sep 2024 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hdr2IS2b"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE61D6DD2
	for <linux-rtc@vger.kernel.org>; Tue,  3 Sep 2024 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348583; cv=none; b=Zu4KffRGCJo1ZxX1S9RiuIa0ILKNSLn4yUegZdZUviOqM9OYaeg0k9afpfdACP2kqFov5HfDmsSvWdkzTwz6TDRSYzNb/KDy7WmLDcpoDnueu3cJLyWuQ8SO7Nwwk14Tz4Ao/s1BvvsZfsG9T52X2nJJD8H8kaoSOOz4pHeC3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348583; c=relaxed/simple;
	bh=OjTvpAAXrGTGgptUXOR17snuqDSOhkzcn0L67rJb/BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjWYSEWRjJFd41APqs/MXYGHe0Q2y/xTjic7cU23Ad3fUnQDlHinYvSuhIAwUc+yuvmxLGzvIj+8HwBPPAG3+VPBM1j81A/XbSFI2VW/YaReR/1hNYQccejQK7Pw1BjM4gayaLnMUqtlLty1EHAVPsyekevZjnj4Gg2xAnOZQRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hdr2IS2b; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so2314719f8f.1
        for <linux-rtc@vger.kernel.org>; Tue, 03 Sep 2024 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725348580; x=1725953380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjTvpAAXrGTGgptUXOR17snuqDSOhkzcn0L67rJb/BM=;
        b=Hdr2IS2b3As/nKpzPm5F3y4sTGkodVUE4Qm8RBF4TQSPS62pM6hhBcuU8OZVBL2FFL
         WNZJSNutIoid6vhdfxG7rhQu7kO8HV/0fh14GRZJ3XVtyeYwGCPdnIPGjWuij83MVEPi
         A/wbbHE5orRu5hJlDDLl6RzFJa7REmZ0/JTablnMSZqJQscybLJr26GetXwlPeBNRuNN
         hDTgjsMnqykhmbGJDMM9KETTqDZRV5BWcb5/Q9FwCDF0E5bIwW5E0a1kfiWac2JD6hWV
         Q+ol9zgY0dZhPuTPCMV+1LdK+2SXvE2iwkaimGs0pa6/p7675FNIG4SOJrlWJLloYX/7
         5Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725348580; x=1725953380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjTvpAAXrGTGgptUXOR17snuqDSOhkzcn0L67rJb/BM=;
        b=KDbBlJJotemoTyr2EFQWeGGyRkWqxIlao0FuBgIa0vPbji2U5G1lByE0Huxi3DRixX
         FTQwc38sVH5/4mgtrIDAIgIQ5haoyq5qwmuZzyElCuZ8TmJOtsShZMyFv5F9CYSqXUcM
         NP/PDZfruolbPxIUpgXajlnSb7mVn13doS4wnZJMK0aIyLVi0ckRgpppSuB6JbA7Heuu
         /93Sn8LVst4BfmKVKK2dNaoH9WFKQiUEF5+dmcNY7XSo9uc19QI2aWxGfbHR2EnsddVm
         DU4ufAGXJXsj3n2Q9AO2Lu6AEdv/DpPGC/7yhpaAZlpcLXnwTr6c9svY/bn60HKlLcQr
         nAeg==
X-Forwarded-Encrypted: i=1; AJvYcCXjj+KUCedOq7IBOAgb/dWYInYps6uNx/8eBbOZy+9bEN8pHzeaWV0XGBSK4FPAs6Ojx1TqF06LkZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysrHvg0dXP6XFe0gr5TbYja6w982e/vE7We35ZQB3+b1ffL924
	lklBk2joYsUFwt/BhF9pEQxphs+use9jQlOiU5B0Rgt0JTpKf2eF1Q1UnfZAekA=
X-Google-Smtp-Source: AGHT+IGhGflCAt3iq4B1lbWKcdTsZZUKYcwm75P51VoYgK+6+yVr8U4256jHMWzi1AT2+olzh4gbWg==
X-Received: by 2002:adf:cf0f:0:b0:374:c2cb:a3c5 with SMTP id ffacd0b85a97d-374c2cba4f9mr5068543f8f.62.1725348580241;
        Tue, 03 Sep 2024 00:29:40 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb73e20b7sm161574845e9.14.2024.09.03.00.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 00:29:39 -0700 (PDT)
Message-ID: <04b80600-1d87-43d7-913d-6940b0b53e36@tuxon.dev>
Date: Tue, 3 Sep 2024 10:29:38 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 kernel test robot <lkp@intel.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>
 <202408302225417622f1e7@mail.local>
 <a7f0a36b-3169-45f8-9169-50bb0c6c04dd@tuxon.dev>
 <20240902202819e2bf5630@mail.local>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240902202819e2bf5630@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02.09.2024 23:28, Alexandre Belloni wrote:
> Thanks for the detailed explanation. Can you add a small comment, I
> really want t avoid people cargo-culting this behavior as this has
> already been the case.

Sure, I'll update it in the next version.

Thank you,
Claudiu Beznea

