Return-Path: <linux-rtc+bounces-1229-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A98D7FE3
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Jun 2024 12:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B20B1289CF6
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Jun 2024 10:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F0A8003F;
	Mon,  3 Jun 2024 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsgINyhX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A057B67D;
	Mon,  3 Jun 2024 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717410291; cv=none; b=DmQcCGVLZdkU72EJXcGWsy/BljmBiGAELnnN2JozvqHzQ8+zJOB4Cwpg64tmiu+J2m97TUIf2fRSt0k9fvb9FOAeI5mnqH0EPp4i3opvTV6cGnLud9XDpX65vZmAu+gpkFEFTU3jZQrKO17Nq0NOTb/ogHFFJwGs/C2x6le5aOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717410291; c=relaxed/simple;
	bh=ySxojL4s3GRQtCCO1qqScuVnnfRp68eyKYTF0VJJHX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W26fazrnAKBxNo0Zt6B+Fc6tP0Qso7EFiDtqvPTLs9uISQ3Vjn4AabJRmOsw6t9IqOZeNhTx27ggfyA8HaAHyXd8cfZFvcpkMgcZ6SNdfIKfgwHu6T54pqvm+EASU2lHLFcnx//0mJYf70OH74mCYFEHmD8nSxJ8fRg0GgL+6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsgINyhX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6266ffdba8so358326666b.1;
        Mon, 03 Jun 2024 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717410288; x=1718015088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqA1PXrwcCN98Nii3x8SpO9ZeqKqzlhOVt86I0o4hY8=;
        b=BsgINyhXo+jvY5BJDCT2Hk9BC8D4XBKXTsOA+EuqB3N+TaI+5WHGqf2mPIk6NNCuUI
         1+WyCplmqxI8k2QPgrP1K7DqBMVoBzumqZ3YxXdiOxF+a2CxuIQibBak2gnJl3PJ0ljm
         DuwDBlt/yVmnrbOZbXTyQAw8rQSGSYkMUAUyhJ88V2V0DEczEcPNWQC+ZLmfNqM2gMq6
         bfeImSWzKZv2fblSJnDSaiYvFqbsI8OwJKZCEhC3O8KAJgmJViE4mwmEgzr6HOVFd0a8
         F6RinnooUKxqWDci4LD7iCVOeTWSaD6x7nY+GsmhUwIaMSpVywECLe3XjQ1zdHsbJAkg
         DH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717410288; x=1718015088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqA1PXrwcCN98Nii3x8SpO9ZeqKqzlhOVt86I0o4hY8=;
        b=XWysxLq7y7hMjN5Yb3oNXcTv4sdtAkFBpfK87O3D6YATcEpLwUZY00ruIeRqFHBSJ6
         +Ir+3zZb8rpxLt/3vF927La2ji1kGxfnsr4ijvayo4NlSbWOSRi5+yRa9V+Q8iJE6qYd
         HxWhZfGrXqTr9p2sm2c/8CII0/eskdtrcaazCJyFclViVdJQMkdt8XseQlzXotrKMDCS
         wDJ32vFAZ/ITU7oAOAnsh6JXljST1GGlyLBXkJwSup6eKqAwwDtUZZ17WMHWWtJaRY8t
         4wFrxqJ5Z2G0oiUq7xrdcuNjDwGhFEp/IzBlFYsHAl4KHFledXFPL6+YCs9E/AaTlzzF
         wjRw==
X-Forwarded-Encrypted: i=1; AJvYcCUazBuWFYiGJ2IEgP1LNox3yHTIfggF3H50jzbGkij2T6Fgslzucxd3D5GyOiy3I4yb3CAcSpPFPUbzessKfVUT3vr48T2GchdTO6U/+XrxxUj+iU6R9Nt9jpknJjmqR39HsW/bpFJ9Ow==
X-Gm-Message-State: AOJu0YytcgWY60Kof73hwYgP2S+yMyAnc2xERoP+coTCOwMPafRhWdJe
	udLIHy46sTCAIWudQNLhgxaliujqoR2DaRN8bRo2SeWCmiV1W41Fda38Dh3t
X-Google-Smtp-Source: AGHT+IF1CtcgDyhj37LHv92BCOpjLvOTVmffDU90JlA3fyLw8/2VlZTAH8nbqfafha5QeK5FmMjkNQ==
X-Received: by 2002:a17:906:da89:b0:a59:a85d:31c6 with SMTP id a640c23a62f3a-a68224460b9mr684563466b.66.1717410287636;
        Mon, 03 Jun 2024 03:24:47 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b6ef0d8esm328804366b.105.2024.06.03.03.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 03:24:47 -0700 (PDT)
Message-ID: <a61bb06d-bb06-49d3-82e8-7262fdbb0031@gmail.com>
Date: Mon, 3 Jun 2024 12:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm: dts: nxp: lpc: lpc32xx: drop 'clocks' form
 rtc
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com>
 <20240413-rtc_dtschema-v3-1-eff368bcc471@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240413-rtc_dtschema-v3-1-eff368bcc471@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/04/2024 22:22, Javier Carrasco wrote:
> The RTC does not provide a controllable clock signal (it uses a fixed
> 32768 Hz crystal, the input clock of the SoC). Remove the 'clocks'
> property to better describe the device and avoid errors when checking
> the dts against the nxp,lpc3220-rtc binding.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 974410918f35..f78d67e672b4 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -384,7 +384,6 @@ rtc: rtc@40024000 {
>  				reg = <0x40024000 0x1000>;
>  				interrupt-parent = <&sic1>;
>  				interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk LPC32XX_CLK_RTC>;
>  			};
>  
>  			gpio: gpio@40028000 {
> 

A little reminder: the rest of the series was applied, but this patch is
still pending.The nxp,lpc3220-rtc binding was moved to trivial-rtc.yaml
and it is already in the mainline kernel.

Best regards,
Javier Carrasco

