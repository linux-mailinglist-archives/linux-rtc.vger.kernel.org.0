Return-Path: <linux-rtc+bounces-4536-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74456B0D6E8
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Jul 2025 12:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F5737A8592
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Jul 2025 10:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBD22E172F;
	Tue, 22 Jul 2025 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BSH6ISmE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC702E11B6
	for <linux-rtc@vger.kernel.org>; Tue, 22 Jul 2025 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178759; cv=none; b=UETWXnJEZIoTWEiS68HFFgkipGlHbjeKagIpEW482ZieR2hArQ7WkT5W/JWPmtQa2aHhXug6+60fraJjTs9i+vWOMj0oUmJSwkhPpMFiD1OE36gCpKlDKXvQyC9vjiaVfPW9zOOKpSroM/PtqW/Dgf14aRBC83XMjQ5wX7LRuYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178759; c=relaxed/simple;
	bh=39YNoWp4OX6qnLsieXmLV9zCGjbhYjyloInkDj4pUC8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YQ7aVzz3wbi33JBMfKni/a/JVgEyuP4iVfk5t+QAeFHGE+zWMfQFwd7YvW/2s48zuf/g5MzoTcUkOQYc2nCKuxc1+SrWZcpntW5xqTad+yt+zG7yXlLR3IyZ4dOVvXFcT9v3Au2kvdoDfrf6PdqBndbUgX0Oo1f4v4xdUJmcEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BSH6ISmE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so59016475e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 22 Jul 2025 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753178756; x=1753783556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6tvj/DkNBulYt/YV/mLvh6U0WsYjvJUAB4Jgyqsz68=;
        b=BSH6ISmE69q5IXtzmw3SbUWR11Ed02ig44M8tcvHldMKuOS3pCR/cX5r/7biuxZDwh
         akqq7aBnYxtoDCqu+15Tx0uZ7HPypCNF7ZIfsX9e1aod+ACfpom1vhRclKuCHK8nK9Lo
         nHSkQGDAPBqPxA/TLJ4OMi4RIPF6FvbWN8Fl0jdx//HIZk3z8QssmJYK+lxV0WPtO0GI
         X6APd5W07f3qQo1kaH7vTOpF3CRBeRzqKo9adujoLJNzFj99d7vitOUS1W57R5C8ynpB
         CLPYbjLP7EaNuI5uPc5SOgEXXnLSOzvI90iPviYGY9xmtf8xcppzjwjW1Dt3dNQgF5MI
         Hmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178756; x=1753783556;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K6tvj/DkNBulYt/YV/mLvh6U0WsYjvJUAB4Jgyqsz68=;
        b=q+e2Q0kneqZMnfkk2/YkyvEnoDVjnmAzEp8fsEQs9m3fSPkhu2Do2IBc5xC/mSsKKK
         p1NMdHiBZgathxaWuL0x/8TsJd3+pg7KszROInaj3IDN6K6XH3fdjJ1HUnzron/AAhx+
         Untv65Ig2cxGYlOt3j3bVPbL4F7wDhfXvzvR+VQAkMkoa6g5q6my/N9FvzMGvc337iGF
         ysNQYH8gUGkEFBckB8ua5qerwyYXo+dJyCvGy5W13gUXsIgFrLueN+IC6ym2Vvi7Crhu
         plybisqByhZpjgWTRc3rAMkQqj0YSfwAqS7fUJt0kGsoLApbcUEWk5GBlpNq+m1Z7pKD
         pVgw==
X-Forwarded-Encrypted: i=1; AJvYcCV/wToWD0tvZVQTHg07gFsbYmxC8avolLpYwUSQJhEsItNhJz1GAYmZcjfZylBa43hgw4LGt6Ajt30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdXG85sU+Xn9SWPHj+s6S/DtC5Ztafb5aZEY9eIDk1T0i65JOw
	Va/dCMtzFphg2LHIuxvg/knT6kbJvu+mkeCDG2qg35eJ2SkbeH9GNyoT1hlqSRFgdoo=
X-Gm-Gg: ASbGnct7QExP1C9EKfu2SCSFbRzSK859MKKEuLhrsnvYaoFGum6IDK7jpLXfgz2P1nS
	eMeZJqNEgR8z6p+Sb7OrzJFqzMIvZQW6nBLvZQuQDjz7pzorqGfGeaB7fV0bdKYMDKZ9cxoCiHP
	BfVPwDQaYT/G1Hcf5O1/d5cAQkNXgTR/5nZGXsrmjR4PtYoRkigCAVd0RoKrjpcv2aOJxIZ11ED
	QatMHIYYQ/kFdWJfs7KKZejaw690tTVFJmR33YO+yBRuY8fSfsEvBkiYtuml46XJ08vYa+Yvsqg
	0bEQ/hyDpSq+Eg8L5b7PFHfTaCYVrUVN9RAuvmzUqKp2rJU7gEglW5UYWkx7VHrtOV5RrokVtto
	fQqXrvFTBM8ngfK5Iov/J4zo6PrRIo++29eqU8HlvjJlvK3aT6O3wBnfyfSruk+H99dDJvkzWNL
	p5iWZOKtAQVA==
X-Google-Smtp-Source: AGHT+IF6xHLS/NKb0FDDLslT+SQ8Ge7DpH9qHjfZKBiFCLY7EOoCDjUS/Zdn1Tv9T1Zp8mEzCtRq7w==
X-Received: by 2002:a05:600c:3acf:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-456348e70f4mr208884215e9.14.1753178755675;
        Tue, 22 Jul 2025 03:05:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bce4:725d:6922:d1ba? ([2a01:e0a:3d9:2080:bce4:725d:6922:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61c9f16d9sm13213953f8f.0.2025.07.22.03.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:05:55 -0700 (PDT)
Message-ID: <4a78f570-62fd-4779-aba2-1c9c558989f2@linaro.org>
Date: Tue, 22 Jul 2025 12:05:54 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: C3: Add RTC controller node
To: xianwei.zhao@amlogic.com, Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
 <20250717-rtc-c3-node-v1-2-4f9ae059b8e6@amlogic.com>
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
In-Reply-To: <20250717-rtc-c3-node-v1-2-4f9ae059b8e6@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2025 11:38, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add the RTC controller node for C3 SoC family.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index cb9ea3ca6ee0..b81bffac7732 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -53,6 +53,13 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	xtal_32k: xtal-clk-32k {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "xtal_32k";
> +		#clock-cells = <0>;
> +	};
> +
>   	sm: secure-monitor {
>   		compatible = "amlogic,meson-gxbb-sm";
>   
> @@ -967,6 +974,15 @@ nand: nand-controller@8d000 {
>   				clock-names = "core", "device";
>   				status = "disabled";
>   			};
> +
> +			rtc@9a000 {
> +				compatible = "amlogic,c3-rtc",
> +					     "amlogic,a5-rtc";
> +				reg = <0x0 0x9a000 0x0 0x38>;
> +				interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&xtal_32k>, <&clkc_periphs CLKID_SYS_RTC>;
> +				clock-names = "osc", "sys";
> +			};
>   		};
>   
>   		ethmac: ethernet@fdc00000 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

