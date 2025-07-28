Return-Path: <linux-rtc+bounces-4600-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E98B1408A
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Jul 2025 18:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 943443A58D3
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Jul 2025 16:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE807274B42;
	Mon, 28 Jul 2025 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VWD9rWi5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D00274678
	for <linux-rtc@vger.kernel.org>; Mon, 28 Jul 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721017; cv=none; b=Ltg5Vi3of9L3FLx+BrF6wpGVYowCzbCA7CDFKP4+8Mo/V4dqAVR1pnMjbRf7BCQphoofRkF3VQthMHS4xrDGa9GofpAWrc0zcvgCGZvQcDEgE/+slDNDUMITmGTT+Se93Oku2pLdc4sTuk5qR4FaWjwet/+oDSPG+J6TFo0A6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721017; c=relaxed/simple;
	bh=rhjEXzsTwnZFAF5osPavXR0nQ1U3valXq3FCuGUvhIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tW9HVdZxw2cX6E06zS/449mcy8dHl9VOWlq9LnefzU+rUcpV0cmYv19RcOALe8WqM9Xw3xTQT9IbD9fL20DZjnuzwOe1B5dnHo86pxvXjKWqY2PUz66h1u6vQxm1wWd7VeOKJjJJJ95hhxRKEPbfeBLCGmd/PVCHfu3wsNjoO1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VWD9rWi5; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e3d181e839so9658435ab.2
        for <linux-rtc@vger.kernel.org>; Mon, 28 Jul 2025 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753721015; x=1754325815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldQSwkThGxTZIExSscNpx1zCzTVrhc9kUZXUJm0UXLk=;
        b=VWD9rWi5UNPMCHl7NEdL4Ys7wh/esp6/e/I/jIPXpju6XdeXEdXn21Xn0izSlqe4N1
         SnMTazPnnxo2KTbusPTfh8U9QpeHn4380vwAwd5kcaDqqpLASZSdOcPX4jPP0Tb05Lw1
         5Wo0RjcVP35m84lspTgoemGsQiH08rN3kYjJMsUS+3IqFn7p+iaXEG3VUNCMkTOhPGxz
         GQDajRTZK+cVWnxOt/Y/5oetlqYt9Gh5vILY8F7q6ltSPGLlYu1vsSy++f1/Lv90uASr
         fTst6mgHuW9rdf6BFqLKMGL0GWxxF5yy8Q65kkPbf1S1mDIFz3jMoKQ0+5Le+Pue35q4
         3ehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721015; x=1754325815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldQSwkThGxTZIExSscNpx1zCzTVrhc9kUZXUJm0UXLk=;
        b=j9SJBGqecnZEQYsEqC5bj8Ho+uQdg3N1gid7T8emgxFYYTB5ryHRfCXAiS6Cm0BNjD
         zCzBYdIjn3tTuIoTCuKNaUPAcWnbZxpnci9j1PGbBTzzVAwccDIIxGlUyC1OOcVK10ls
         NuHdNnB2dAMU0mPYASTkQ9AUAtSNQE+/qi6PSjmcmBDRfd6A5Tl7QhLSTpdGljrLtsLR
         2ny1aChP188ql17kbECSnHGJxgNRw+7nwixOuPUb07XO8k3qnlDjMOiVwla/HPjhklnR
         paaQhN9ctkpAGn97Jeka9+BzpwOJhuYb01+zFxHkggONP6cZ0VeT0ngxoz4l4uXCbYaV
         /euA==
X-Forwarded-Encrypted: i=1; AJvYcCUrPkOFjonjukiUD/mn2EMDSwAqoUNbUaimnGNgVEUZeGYTAE9hfiAzjZGEpcidClDMq//2B6xcYno=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YcQ4o+OoPyx4XYkz8Z0dqvMvOfQK6gUcgJjKsJqSN64Sqn9B
	jwap4FcewEGhBBEHfb1UWpj6JpJA1xSkXIojfcDuTtgnljy5dd+jGYzjxEGGV0qy3ck=
X-Gm-Gg: ASbGncvKPTn8/Yj7rwZ7j457tkRvlz6Yv7CrMYxG58LujlxW0FwTX/M9/tNy4bM/Ou9
	SW53+DuGXs0z3bytmHYDUF77ExCFwO0DR+ISsyEYW4sbrZOzzsqadlkSMif2PgB2C1BcsupQFxj
	Ic09LociPTRXIbVk2eZSzGmXhhHCB5IneKVqor66pQpx8V01wDnj59IWjGZ8xxAOdJup9WaNJXN
	pi8t+dUXI4LB0VK1SoCZNVZ4jL5vKfFFehg0cI+3N8xYYaAQKk6VS8OZE2JaK2RkRKiElCuSRiy
	WTk5X+F39sF5fC92Lgo/CWFv4YfaycSRextc/NJDVxi6OCf6U9CoQBKbDyPjIIgo97kudLDS0Ru
	TZfAvee/i781gVriXyY2m0rcgBzHs72cWmJ843HSxjVnC3R2os2nLv9Qtjoia0Bo=
X-Google-Smtp-Source: AGHT+IEKf13G5VVtKix2Gq667g//FiBaGINonaogdX3yn8hZwcFv6711Pe8N6gMwP+Vbi5i7MjtaZg==
X-Received: by 2002:a05:6e02:1805:b0:3e2:9f1e:e291 with SMTP id e9e14a558f8ab-3e3c53125b1mr209554715ab.21.1753721014595;
        Mon, 28 Jul 2025 09:43:34 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e3cad13c7csm25861755ab.61.2025.07.28.09.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 09:43:34 -0700 (PDT)
Message-ID: <ef2b4526-3725-4a25-9118-ab77a1d91362@riscstar.com>
Date: Mon, 28 Jul 2025 11:43:32 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1
 regulators
To: kernel test robot <lkp@intel.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, alexandre.belloni@bootlin.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250726131003.3137282-5-elder@riscstar.com>
 <202507281558.lZ0NYtth-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202507281558.lZ0NYtth-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/25 2:37 AM, kernel test robot wrote:
> Hi Alex,
> 
> kernel test robot noticed the following build warnings:

I have a fix for this, and will include it in v11 of this series
when I publish it.  I will wait to do that until I get additional
feedback.

The fix is to make REGULATOR_SPACEMIT_P1 depend on I2C, in addition
to ARCH_SPACEMIT || COMPILE_TEST.

					-Alex

> 
> [auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250726-211530
> base:   d7af19298454ed155f5cf67201a70f5cf836c842
> patch link:    https://lore.kernel.org/r/20250726131003.3137282-5-elder%40riscstar.com
> patch subject: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1 regulators
> config: alpha-kismet-CONFIG_MFD_SPACEMIT_P1-CONFIG_REGULATOR_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507281558.lZ0NYtth-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1 when selected by REGULATOR_SPACEMIT_P1
>     WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1
>       Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
>       Selected by [y]:
>       - REGULATOR_SPACEMIT_P1 [=y] && REGULATOR [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y])
> 


