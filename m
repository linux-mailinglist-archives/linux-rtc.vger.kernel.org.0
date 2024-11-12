Return-Path: <linux-rtc+bounces-2535-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C616D9C5B6E
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 16:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AFEE2831F2
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 15:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC2B200B9D;
	Tue, 12 Nov 2024 15:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwVLnDjO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D568D200B84
	for <linux-rtc@vger.kernel.org>; Tue, 12 Nov 2024 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731423888; cv=none; b=O7AcvjcJH3FiUpoVEWvdG8sfzXojAOpi8RakhNPhKX5Bacy7BL5qsbv+7XevZ198LieHcySXNakJ+FVLAFHCaUR8GwjB+ikal1wDb3AHPiagvVJYVk5FBpcd7ZvChOogINtS0dUeVaFnKlzzZZfePR1EAmQhFl6yAeYJ9CRNUbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731423888; c=relaxed/simple;
	bh=PVTATqVr+l6t/a2e4nND+1WscjbQhsybbj1RXhGtksI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gBbEaQ/lRXvd0dm7WuVihEr24ukdqOvN5eDfjVnBa3177Dcr5dg16Mgk2tNSjgCSF+WOkET/RZlNqHFMd7nFTZZglDJkxxfZv6Vms2UaTHPutQP/zWxYq6SnhNV6p8ZGQuCXkXgsZgrL0Tz8j32rFBuneyBlmqDDybBURmdlmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwVLnDjO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso4076159f8f.0
        for <linux-rtc@vger.kernel.org>; Tue, 12 Nov 2024 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731423885; x=1732028685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+YJuljH8so7LFNlPr2qSzI8opzLdE/u+hjqBQxVqzQ=;
        b=IwVLnDjOdSc28wr/rhna6zF2hmpO3twVsZvmptVBogVrq6V/YaC99QFJckKM/JVxFU
         XzgMsTB+j9TePskBRDyn4yHoTTF+8Rh7X5ldLw2+nUxqNvKVNUnnIsksIV68bBkVFln8
         ADCwvAuHHsiwb0UIq8fRA0OlhtcLGRlk7JBvI8K1AtweDutux8APuJBMkDzANiU9k0v3
         8x3Ig4oCovA3l2cZZ0tUqja2pT2+9SIB0MiNw7bk6T0DR77fvei/kYaNQvMv1t9ff66C
         coxiZoyEeOeRt5xxqvnYtH/hJs3TX4Hm8Qlia9cpZFb9FCoAEYnU/VNWSiLPMwHevx/Y
         vMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731423885; x=1732028685;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h+YJuljH8so7LFNlPr2qSzI8opzLdE/u+hjqBQxVqzQ=;
        b=EeDOm9hhkrpQLGIfW6mJxaO6CB0QA4xASCgE0+olxvGL81tPIGqCutQR1yxatEL95N
         73LpOL+jljQteg5gGbSPB+MkN93kU8y10kEVIzPr0hFHOZMI9lHjtlG14JwYjXYngBsH
         Mh+Wn6PcUTxGE6Y2c3B+IqjTltBKrW9/7U56L9+bCegfaLmcP0SFiY3YOHjgMQCcxe9Z
         iq5mspZpqD4ByTMkBDMnNzbv4Q+tXup7Tx/R2N7excv38nUYxZryLJ1NZhH10iLqtR5o
         ZmWoptmL1UtcUw5QRmt91+CuYnEsbq4Y4H4S+TMaod9f4Lwdld8GV91b/Bz+uCaxQIjs
         J5DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtUqaBzUSCEvYZuLnaPkExekpbOpYGfC/eT7a8lQYSqOBUo1V7xao+g45RsE/ldJlTCwOL4BWULP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRCh/iGPah8n+/oGKpHdm1qJGJ8z/jKWF6kEY5NYimy2eyVr2
	GBS+wm5F1kRzje5d5Y0c3Te2bW++99PQAz3d6fTRFXBUm8XvxEqXa2/7xRQtw5g=
X-Google-Smtp-Source: AGHT+IGUdcfPX17gUS2CUFCdlqiq3IQ6Q+rwCNxluMYjetF5UrhuIO2tqr7mZtScD18rSXRQBpJadQ==
X-Received: by 2002:a05:6000:2d12:b0:382:4d7:2b4e with SMTP id ffacd0b85a97d-38204d72c42mr3745124f8f.59.1731423884965;
        Tue, 12 Nov 2024 07:04:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04111sm15524843f8f.92.2024.11.12.07.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 07:04:44 -0800 (PST)
Message-ID: <590c326e-cc61-4341-8544-e50616acc7a2@linaro.org>
Date: Tue, 12 Nov 2024 16:04:42 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] rtc: amlogic-a4: drop error messages
To: alexandre.belloni@bootlin.com, Yiting Deng <yiting.deng@amlogic.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241112143652.3445648-1-alexandre.belloni@bootlin.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241112143652.3445648-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 15:36, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Drop error message because there is a high probability they will never be
> seen and the final user action is clear, the time has to be set again.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>   drivers/rtc/rtc-amlogic-a4.c | 20 +++++---------------
>   1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
> index 9423dce4193d..4960790c4b24 100644
> --- a/drivers/rtc/rtc-amlogic-a4.c
> +++ b/drivers/rtc/rtc-amlogic-a4.c
> @@ -102,10 +102,8 @@ static int aml_rtc_read_time(struct device *dev, struct rtc_time *tm)
>   	u32 time_sec;
>   
>   	/* if RTC disabled, read time failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, read time failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
>   	if (rtc->config->gray_stored)
> @@ -145,10 +143,8 @@ static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>   	time64_t alarm_sec;
>   
>   	/* if RTC disabled, set alarm failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, set alarm failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	regmap_update_bits(rtc->map, RTC_CTRL,
>   			   RTC_ALRM0_EN, RTC_ALRM0_EN);
> @@ -174,10 +170,8 @@ static int aml_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>   	int alarm_mask;
>   
>   	/* if RTC disabled, read alarm failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, read alarm failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
>   	if (rtc->config->gray_stored)
> @@ -201,10 +195,8 @@ static int aml_rtc_read_offset(struct device *dev, long *offset)
>   	int sign, match_counter, enable;
>   
>   	/* if RTC disabled, read offset failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, read offset failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
>   	enable = FIELD_GET(RTC_ADJ_VALID, reg_val);
> @@ -231,10 +223,8 @@ static int aml_rtc_set_offset(struct device *dev, long offset)
>   	u32 reg_val;
>   
>   	/* if RTC disabled, set offset failed */
> -	if (!rtc->rtc_enabled) {
> -		dev_err(dev, "RTC disabled, set offset failed\n");
> +	if (!rtc->rtc_enabled)
>   		return -EINVAL;
> -	}
>   
>   	if (offset) {
>   		enable = 1;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

