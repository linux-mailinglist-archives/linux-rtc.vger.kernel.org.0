Return-Path: <linux-rtc+bounces-2742-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8C9F56BF
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Dec 2024 20:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C383F1884423
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Dec 2024 19:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704781F03D8;
	Tue, 17 Dec 2024 19:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="b+CblpnX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C941629
	for <linux-rtc@vger.kernel.org>; Tue, 17 Dec 2024 19:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734463026; cv=none; b=drbzhVJhObInG+Y5Mp1mRSaGNsQdExVLSpUai5E+Ugln0XwwhOD9fcsA1cc4zRIk/sVK8AW5Ug0BKZne7Dl+p447lN93kVuSqLZFFUtdza2HfdvhHiy8ujNv0WxxZuDBaNa+wajcGIqqjJOnxy/5AuJLVgVKr2J0l74GuoeFjrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734463026; c=relaxed/simple;
	bh=mE0qssoPY8GwL2YPwtUO9KXpuLnGgxHrLl7B+fmV0z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oh/wDsrvMq+0x+yD2llt5BAJMQfC/YyxbosuQSszR+5o+Cs+/ZblILK8CiSFSUmcrKTCXzxwnwHYkwg6hyg9+9ZnuY9JtwbEuWnkg0aLZ7rtlcJO0tXqIDsj1MHXigsaZsC4Jk8WYQ0dTSoAWz8A0Vojks4hRuSwAg+KHA3/TBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=b+CblpnX; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6c3629816so245141985a.1
        for <linux-rtc@vger.kernel.org>; Tue, 17 Dec 2024 11:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734463023; x=1735067823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aeuAurzxeYFlFM9SY4fnV2sr/YX7aTUhIMjwNyUZZnE=;
        b=b+CblpnXJmEdPH5tyNPzckJ+E8BhcGoOraeFys6wdJ+nUmIzUOw8IVOt7AYGndz4rk
         H12rYlfsp4nztr7CdamOeSIe5x5FbTwhCkMudaz7zuIRVyYAJJc4kNL6QAS0av4zIRRe
         0aazND3WoNJTli5znWnTphOhi/fyWJMSLPFV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734463023; x=1735067823;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeuAurzxeYFlFM9SY4fnV2sr/YX7aTUhIMjwNyUZZnE=;
        b=G9h/ZrULj7aLreRR5y+nur2Bw9eww/oW8blXL5Nwex9Z1jVXCLs2KKYjlLJ5gKX31q
         xR253dViJJEsL2/xiIU4wIFba1+QS3CID7OsF+hgNlGAWbKhAhPS3reHchcjM0pU07lu
         uJeXT62wxyerQOlGYpXp8N+ENTjNyIYt37Joju+puGssOJU3pTilf2rkh2g+1qxB7Rnd
         L4kvgCw0CpXsP/i+H7VeRx1hmC6rOdlANvm+WtDQRphrF+3XD8jkVXevy7PbXgDqGbKv
         yz3ApWlag6Cp9tbMAx/sK64iCfDy8GNADtbuE+p574JYa4bFrNRdxOwvo7KOzZs0NaWH
         zV+g==
X-Gm-Message-State: AOJu0Yz9xgoTg3WMUVtyKLHSUnJ27gQywKEe2/bD0LrnDPx+AfbvjIk7
	xXbRspqSdg2JVa+lxM1Hb1GLCvQuE16wqShorkCu/o5FIjHFQOA04rkN72eAEj9GUGnMoDCANyY
	=
X-Gm-Gg: ASbGncvwluXslXZuxK11dy1Pv1Sn34jTrXkWguGY84cqylH9bzgWiq1HeFoznPLQ38b
	VaG3GXIAD7bJZBNetmrzOCDSiRPpc3Im89Rk5A7TenxA3YYIgcGFuxYF1pQr0BJNvGvPemV9o7W
	cp6pzBhPd71A9VeDkpQtuORfJQicxqGibHnkTDWjoKmxJdmieqHFolPcd9srsX/3ksH+ARVbKD1
	G680raliKrYcBTRNgSsoQW8/hASoMN00oivKXuMi1zJxD/m0JF89UV21U+jzLqpdKATqybGYPww
	3Z2dxjTrNOkgXQBw56qz
X-Google-Smtp-Source: AGHT+IFWKUg6UHribvxHy+oOt3XT6MiknZPeGnZca3v4Ta/KA6AZw3Sqwq10SdpugBsExU8k6chdjw==
X-Received: by 2002:a05:620a:1925:b0:7b6:6ee8:6c03 with SMTP id af79cd13be357-7b6fbf45965mr3093622385a.58.1734463023037;
        Tue, 17 Dec 2024 11:17:03 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048d0e9csm344726285a.122.2024.12.17.11.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 11:17:01 -0800 (PST)
Message-ID: <fdcdabd2-56a5-498e-a21f-124c63105a6f@broadcom.com>
Date: Tue, 17 Dec 2024 11:16:55 -0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: brcmstb-waketimer: disable wakeup in .remove() and
 in the error path of .probe()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, alexandre.belloni@bootlin.com,
 bcm-kernel-feedback-list@broadcom.com, Doug Berger <opendmb@gmail.com>
Cc: linux-rtc@vger.kernel.org
References: <20241212025007.3472182-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20241212025007.3472182-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/24 18:50, Joe Hattori wrote:
> Current code leaves the device's wakeup enabled in .remove() and in the
> error path of .probe(), which results in a memory leak. Therefore, add
> the device_init_wakeup(dev, false) call.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> Fixes: 2cd98b22c144 ("rtc: brcmstb-waketimer: non-functional code changes")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Looks like you forgot to copy the maintainer (Doug Berger), added him.

> ---
>   drivers/rtc/rtc-brcmstb-waketimer.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
> index fb47c32ab5ff..1bdfec94c693 100644
> --- a/drivers/rtc/rtc-brcmstb-waketimer.c
> +++ b/drivers/rtc/rtc-brcmstb-waketimer.c
> @@ -298,15 +298,17 @@ static int brcmstb_waketmr_probe(struct platform_device *pdev)
>   	device_init_wakeup(dev, true);
>   
>   	ret = platform_get_irq(pdev, 0);
> -	if (ret < 0)
> -		return -ENODEV;
> +	if (ret < 0) {
> +		ret = -ENODEV;
> +		goto err_disable_wakeup;
> +	}
>   	timer->wake_irq = (unsigned int)ret;
>   
>   	timer->clk = devm_clk_get(dev, NULL);
>   	if (!IS_ERR(timer->clk)) {
>   		ret = clk_prepare_enable(timer->clk);
>   		if (ret)
> -			return ret;
> +			goto err_disable_wakeup;
>   		timer->rate = clk_get_rate(timer->clk);
>   		if (!timer->rate)
>   			timer->rate = BRCMSTB_WKTMR_DEFAULT_FREQ;
> @@ -351,6 +353,8 @@ static int brcmstb_waketmr_probe(struct platform_device *pdev)
>   err_clk:
>   	clk_disable_unprepare(timer->clk);
>   
> +err_disable_wakeup:
> +	device_init_wakeup(dev, false);
>   	return ret;

The error path change looks good to me,

>   }
>   
> @@ -360,6 +364,7 @@ static void brcmstb_waketmr_remove(struct platform_device *pdev)
>   
>   	unregister_reboot_notifier(&timer->reboot_notifier);
>   	clk_disable_unprepare(timer->clk);
> +	device_init_wakeup(&pdev->dev, false);

That part, I don't think is necessary at all, since the interrupts 
handlers have been freed and disabled, they will not be causing any 
system wake-up, besides that, the device is completely gone from /sys.
-- 
Florian

