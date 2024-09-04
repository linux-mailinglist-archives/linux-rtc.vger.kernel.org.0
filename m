Return-Path: <linux-rtc+bounces-1869-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA296B61B
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 11:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C5B12892A6
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Sep 2024 09:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FD01CC16F;
	Wed,  4 Sep 2024 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Ky4oO3XV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248CA17CA1D;
	Wed,  4 Sep 2024 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440989; cv=none; b=bQLyA9P8fZM/WY53pOJcHshD5D0uG2Y4/0yXExwLCWb9JFNc89Fb/j32pJaqINriiU1SPoQil4QZGIiyi+Z9Y8Cbmlxo2jjD/ImorwZOYWwyYHuvUG54xjWBtSyFau8D9sCaIVLyW/nVxGlw2hoO5zN6VTaXNlhgKO0OBDWDHLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440989; c=relaxed/simple;
	bh=5pmD9c3B417IKDW7NCpXURYRShMC2cQ9g/e4h40dOyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XnCeRkHXk3yjZ7kUxqpCD8mrRJ1ssBRG2j1bTmUsYdugTyY7/5ChFcUji2v0nk3HwVEKebAcMOJdVkokpgUJUNvbg6pQLsq3++L7Ai6U8ZXHVCL4ZbyNfX0yG/e1vzdnwhpH878tr/6BtHDrMz8Rry0WNu32pHXnyeEQ2gVEuRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Ky4oO3XV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WRwluVRMOa7IzLDu5O+B9iAsJQjcJHexkQ03u6Hw6+4=; b=Ky4oO3XV8dX69lb6SQW69m+Lq8
	JB1QaLV6ugb/GXc79OPlVLe9BRzMRPFo9OrNTBSR8J/Vrx8fhc0eLZnIWQmHow6mID4JqEUNTcpJN
	y7IzD1EDeH7WUmJLu1eeo0BRFWzUZ7eGB9XpZ8nA7olWBQ2etTZbJvw70eAaDReoAvoU9WJef3kK6
	9JN7y/qNhjT7rdWCEz4dMlSchmqJETe7UWx4+0O0FOgUSAzUad6tV4BkKG/v4YyfrSMWNEO4Tv8AG
	k6r++fGZsvpqGc1FArFgnNBel5b6LmhLZaOl56SJuXusTjMFM7tOvIResHsdrctZ/OXKc5lNHlN19
	sSS6ByUg==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1slm1G-0006jf-Pm; Wed, 04 Sep 2024 11:09:42 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alexandre.belloni@bootlin.com,
 Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Subject: Re: [PATCH v2 4/8] ARM: dts: rockchip: Add watchdog node for RV1126
Date: Wed, 04 Sep 2024 11:11:27 +0200
Message-ID: <6440792.jCCqRG4XHG@diego>
In-Reply-To: <20240903105245.715899-5-karthikeyan@linumiz.com>
References:
 <20240903105245.715899-1-karthikeyan@linumiz.com>
 <20240903105245.715899-5-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 3. September 2024, 12:52:41 CEST schrieb Karthikeyan Krishnasamy:
> Add watchdog node for Rockchip RV1126
> 
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>

this needs a separate patch for adding a watchdog compatible to
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml#n33

see for example
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dcd615ee6fd3651ab0357364c4cf65b1148a40be

Thanks
Heiko

> ---
> 
> Notes:
>     v2:
>     - No change
> 
>  arch/arm/boot/dts/rockchip/rv1126.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
> index abf442804d27..283985608428 100644
> --- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
> @@ -544,6 +544,14 @@ timer0: timer@ff660000 {
>  		clock-names = "pclk", "timer";
>  	};
>  
> +	wdt: watchdog@ff680000 {
> +		compatible = "snps,dw-wdt";
> +		reg = <0xff680000 0x100>;
> +		clocks = <&cru PCLK_WDT>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +	};
> +
>  	i2s0: i2s@ff800000 {
>  		compatible = "rockchip,rv1126-i2s-tdm";
>  		reg = <0xff800000 0x1000>;
> 





