Return-Path: <linux-rtc+bounces-1385-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D386912F65
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 23:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 589F12826B9
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 21:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701E417BB31;
	Fri, 21 Jun 2024 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/4Y2Etj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27FF16D311
	for <linux-rtc@vger.kernel.org>; Fri, 21 Jun 2024 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719004910; cv=none; b=nE6DLlZpVgOGNjDcWwCI5SFswx2YSKQ6sO0PPlHlbFBMVIf9B6Y4sz1RS57kFkX5BP525b1naXJ7OiPfuzBi+J3nzfc2dGPAILMiVc7nNFp4LLxGD2v2ghDgchOQ+491s95Cmbva3Eh/1xuJDLoVuYazx/u50Q4Jco+L3CxCR1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719004910; c=relaxed/simple;
	bh=6OwU3g5/7PEoCA8T5u53wxNdNZACBR3qvz1VZFAE+r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdlUn15SzcpNlw66aGO81ra8msDzKQVekO5zingWJU327P/MpnM4lS7wfKyJTxmUlvRtxUoW6fj0iIAK5CqoUe6in745umLzA16k76FG5TadB4/xGzaeU7Lf7J2Ss2cQIUEjA9Pig6qWvjnvF2jIy7vk41T5Pyli0SvlCxAdXXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/4Y2Etj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-354b722fe81so1630925f8f.3
        for <linux-rtc@vger.kernel.org>; Fri, 21 Jun 2024 14:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719004907; x=1719609707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dwpodCTQAZQJVX6OzPylhaU++onJn6Fu1+C4vSG5mPw=;
        b=S/4Y2Etj8LP7qEGj2ZnU44xkq5yuAPZAtz2UyKj/pm2pVkVxYUjFqcPvQxyRo14OkQ
         XTSMZpxfhAIKd78psfHwP0NWsYnq+6vzu29h1p527YUpjsUY2R9Zq2yqDIby4BdppFbg
         WXulQiaFDN8ORVFqorllNI0CfG/xKU9nFJ8bR/ibKobl4wBV3YaABUQeB6x+aLiHwkOS
         Qybrp9b9u2yjKAz/mcbm/0jD0iSsVnQu5IX8v/CchUVsQq51L6guKo6Oy1Cbgh5FguEa
         R1sXQ6x2hIppAudJrUWi0kd5kYF2RMNxIm+kPGT5Qqr79EBlHyD0Zk1o7utCD53m0CsN
         8M3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719004907; x=1719609707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwpodCTQAZQJVX6OzPylhaU++onJn6Fu1+C4vSG5mPw=;
        b=O2S2F/TeWuDx+jM6UKfCbx0/GtavoV7v+hwdcp1PxpNpHWp4UsVltLpflaQZAilsPR
         ofpZpGNfP8R/Hu2RnXiYu67+SiKLG8/IBt/JI2CLgeVqfivzhmmcfQn0DaFxVlGK6Xtn
         ZjpAU2G7/AXvfojUvMTG+YPUYz3DV4wLAub55soq+Nk5VCv+1XUqYJ5UDX5SBDFtqCI0
         jjHLYvxVrF878hyXJLLfRPu6InlF56AHlnvm47S2ip9FJfIVk9FklBbUv7d4sr5Hjthp
         VLs4seCjrsutNy4GJX2FqlkpuIwTnjfFl7TmM5fK8kDO/1R+E8+no348oGCzxTnCBkTM
         79qg==
X-Forwarded-Encrypted: i=1; AJvYcCXSSnLJm+laYG3T2qJMpYjv+JB//Hzm93kAf5rrfoX3sCMnDRKUfDzuIJbhTSOLiKrOvmNEBx6d1Hi+sSH255k2YL96fWKiRdYb
X-Gm-Message-State: AOJu0YxMhQpba9VEAlidJj5WMRSRtYVCPqBHh04RfM66nEQjf0eRJx7s
	6RlDNROai6F1T+pW40HHZyXSeoYn7tI3821EOZYfHKIsRWBYwH6zHq7jTlVwPlM=
X-Google-Smtp-Source: AGHT+IEzQ4rIrOnwizgWJWmaBFT5pkt5oc9TgW9owS7sv9mlyk1FyS0hLQMvtFnAXXdLtrJb0u6rEA==
X-Received: by 2002:adf:f209:0:b0:366:dd50:8ccd with SMTP id ffacd0b85a97d-366dd508d96mr1273664f8f.38.1719004907144;
        Fri, 21 Jun 2024 14:21:47 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f6d16sm2793209f8f.3.2024.06.21.14.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 14:21:46 -0700 (PDT)
Message-ID: <91d242ae-ece2-4665-ac1e-54694152da70@linaro.org>
Date: Fri, 21 Jun 2024 22:21:45 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rtc: abx80x: Fix return value of nvmem callback on
 read
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sean Anderson <sean.anderson@seco.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Joy Chakraborty <joychakr@google.com>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240613120750.1455209-1-joychakr@google.com>
 <171895100442.14088.18136838489262595773.b4-ty@linaro.org>
 <202406211503118dfe2df1@mail.local>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <202406211503118dfe2df1@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/06/2024 16:03, Alexandre Belloni wrote:
> On 21/06/2024 07:23:24+0100, Srinivas Kandagatla wrote:
>>
>> On Thu, 13 Jun 2024 12:07:50 +0000, Joy Chakraborty wrote:
>>> Read callbacks registered with nvmem core expect 0 to be returned on
>>> success and a negative value to be returned on failure.
>>>
>>> abx80x_nvmem_xfer() on read calls i2c_smbus_read_i2c_block_data() which
>>> returns the number of bytes read on success as per its api description,
>>> this return value is handled as an error and returned to nvmem even on
>>> success.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] rtc: abx80x: Fix return value of nvmem callback on read
>>        commit: 126b2b4ec0f471d46117ca31b99cd76b1eee48d8
>>
> 
> Please drop it from your tree, I'm going to handle the rtc related
> patches...
> 

Sure I will drop it.

--srini
>> Best regards,
>> -- 
>> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
> 

