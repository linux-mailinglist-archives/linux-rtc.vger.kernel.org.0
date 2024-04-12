Return-Path: <linux-rtc+bounces-1025-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3572E8A2AF3
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 11:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58BFD1C22829
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Apr 2024 09:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C77502B0;
	Fri, 12 Apr 2024 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhypIjNA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7D63D3BC
	for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712913584; cv=none; b=Xx3gqHr+IEECuz7b4f1saYd1vhG0Eev8IkN2/BlaoJD8EvsILaHLbiy1u9ATp9bwrgMQ0MJunu7np5ZVpB+FRv8ln6aOqcpI7X7ScByS4L1ePNF/6zxQ3cBQ2tk8Xy2WPyZTFZRS/iPFH85LrNTwn1IgYMQQN0KL9eTo79uRJCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712913584; c=relaxed/simple;
	bh=z7cWuzvqpm4ZwCmpHzYr74RHQsoKK0E8YzkwQ1qjD9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcruGDGfp+j6CwSdoahms7akgpVjdCUXsk5lAjsEZ03VasO8Spjc8eRcP0XWJlckpOQCNFwQaEFGhkoqOIhpW12zbaUUYrV4+y6hKnKWa9sqwoQ1xOtiQfr1ZjAX2LznFlmxLxxDVH4ghm2x8KaIV3iq2Vl8Aq/nD4GkxY2I2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhypIjNA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e37503115so541694a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 12 Apr 2024 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712913580; x=1713518380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bgd8iTM8jYzI4GBbVZWg6A5Y54CVMr5y4lgBoQ1W9Wk=;
        b=rhypIjNAQ5vBN1O+proUt3s60ZiqKzwHk3R8aiPgQGoaiIsfayy+lEWLqulDoqWlbb
         ZFNR0b2YWKpztRYR489HDzk3c2rf0sbffLGBbHr2gAmA/tYyiS4iOYopuy3xtJ3AzPhM
         mBMlObaGvue4K4LJbHmWccSUAOXxtKOZSuN48bdss/mpv4Ry9PDLmReYFrHNXgJAbabX
         mOX87ammCoSX1S80zTV+IlYLcXA4tvycwr+Cuaytr32dgqdnxCawfm/IQBSw5t9pZuj9
         FH+LtXxa+bLs3cKMbq4IZOYFe3txfWMFFz6cKp8V0B27o9Z39Eq3jSjJjUBlWAqjUVrL
         nwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913580; x=1713518380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bgd8iTM8jYzI4GBbVZWg6A5Y54CVMr5y4lgBoQ1W9Wk=;
        b=U5I9o3ne/c0qhYiSxFvJr43JerD3ALQPSRh01fWI4bEub36p6qposshDQ0hLFPmn11
         HydGdF5fxmIM95rc1ElkpvBs0ozD9LSmT4yuQTNVCcVZ7ESVVaU7YOu+MGqsmmEn+eLt
         B2AcPUSAq+TYWAd3EYL51kG9fumbuWXmgjPTuYMRavM1MFvBVKMvQvie7uD+WpuOdY/Z
         lsKAzN00RpiqNZ8uRRU975mP4NNDE1BcepFJn1w1VleI5ACDhyAfOBtipM7T/eJQTVw8
         U8SgDhUBg6xt7PAt1F2mvn+f48YdZwt0yepXYwXGyaj0HoVnPuCzcfCWa4vafXMi2iXI
         S7Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXDuBe50uAninAAC3nieUgpERq7rtoel1wBrEH6UhttcUC1cAe+rsq6SDJcpVY6YTVZuRIs1ctv4C1KdBHyIDaqxNYAw0QCzKVE
X-Gm-Message-State: AOJu0Yx7wk0IlnscHD09wTmZitrEX0DSi+983jKPkJVkjaUsZuLmWQHE
	AeBe8eMzRwNeD9smfFKM+X6KBFHxkF1x8Tyyq13dxAAsCb+3tXsZ+4Glqr4SF4k+GoEVG4Hs5Gr
	p
X-Google-Smtp-Source: AGHT+IHl0klW+ni5NaX1mEP0HWgseFackRu4sAodSgA5uGOTmK055be71fNeT+lP2FBtIE3EhUCv3Q==
X-Received: by 2002:a17:907:1b1d:b0:a52:2b39:879b with SMTP id mp29-20020a1709071b1d00b00a522b39879bmr1309977ejc.46.1712913579910;
        Fri, 12 Apr 2024 02:19:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id bi6-20020a170907368600b00a51d3785c7bsm1588980ejc.196.2024.04.12.02.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 02:19:39 -0700 (PDT)
Message-ID: <ccdef80e-4d8e-403a-8b7f-e52ef9e3fc66@linaro.org>
Date: Fri, 12 Apr 2024 11:19:37 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: dts: thead: Add XuanTie TH1520 RTC device node
To: wefu@redhat.com, jszhang@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20240412080238.134191-1-wefu@redhat.com>
 <20240412080238.134191-6-wefu@redhat.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240412080238.134191-6-wefu@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/04/2024 10:01, wefu@redhat.com wrote:
> From: Wei Fu <wefu@redhat.com>
> 
> Add nodes for the XuanTie TH1520 RTC device node on the XuanTie TH1520 Soc.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index cd6bc89a240c..62e588dbc942 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -463,6 +463,17 @@ timer7: timer@ffffc3303c {
>  			status = "disabled";
>  		};
>  
> +		rtc: rtc@fffff40000 {
> +			compatible = "snps,dw-apb-rtc";

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> +			reg = <0xff 0xfff40000 0x0 0x1000>;
> +			interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc_32k>;
> +			clock-names = "osc_32k";
> +			wakeup-source;
> +			prescaler = <0x8000>;

What is 0x8000? Why is it in hex if this divides the clock? Clock is in
Hz and we all operate on decimal units.

> +			status = "okay";

Drop, please don't upstream directly downstream code.

> +		};
> +
>  		gpio@fffff41000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xfff41000 0x0 0x1000>;

Best regards,
Krzysztof


