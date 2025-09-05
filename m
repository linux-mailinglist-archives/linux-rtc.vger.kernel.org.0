Return-Path: <linux-rtc+bounces-4839-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF8B44F52
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 09:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98BA0189734B
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 07:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE2E2ED848;
	Fri,  5 Sep 2025 07:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lPvne8zr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657292ED17B;
	Fri,  5 Sep 2025 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757056729; cv=none; b=uS04IHwREAJ+uUX9iFpi04CPKSsDk8ZoLLA+6LIb7p0XxBsK+Owv5JRYFIEG4sVc6DE1TcJjA7FX0JsvZXc+X73weOmTvC9ynsKA1toILpTDlv18rUJtJ1XGpdwfQt9veRPmOZROo8eWDleeFbB0ortrmgBA+EZU3MkRqU3n2ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757056729; c=relaxed/simple;
	bh=7mfEzOPQfq5K1ir/b9joCG8MYH/Ff/4lkv59IXYzy60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfkxb+hjg9PKdMAXWaJrYLuV9wUHMvCExPgKdNrhEBk0uqWf4flRIcSaBApi255RlYLCtTLzJydUKYK/5R2gGFFbYEj/XuOrdUQ+TtcEfqV911eGAGGuaPhok1hi3FFjgynterIHRaAmV8y9cs4kthfXd2G+hzP1FgjnX/aAbA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lPvne8zr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3A6F41A0DD0;
	Fri,  5 Sep 2025 07:18:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 130AA606C5;
	Fri,  5 Sep 2025 07:18:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 735EC102F27E1;
	Fri,  5 Sep 2025 09:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757056722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=GADct/AbiVj9XBTyxNr5n8ho8ytwvAJWcxRb1vyJkfg=;
	b=lPvne8zrzIT8Lcj5JwF71RsOzlxRRp0Q1by6VTjEmRmEdCq7OOf9pry49alpxGlsKbuIa0
	cavTMkz6lGDDyCw6lDgr/ONu/l/mLk8FcnXtKwkdWyrWp208+L8NBnQxSbXkZk9nyrO6kP
	gXEoNRGfZLrY8sgd2mYt367LiFlmkGGvXCzFbc3ZIB676j7w3I/gEqfvD6F8qAEJZYE4qe
	NM5N7lEb7/FC5q/omHg63t1wER6ZHASei71k3VYB5ZLOW+zmV0hixDF6fyagzPRFzb2Avz
	A+rBQuTUIvIFi4spfRwEV4wIlaZAWwHWpFcajwdqsQy569Q4NTpv0J3iHCRIvg==
Date: Fri, 5 Sep 2025 09:18:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: pcf85063: remove
 quartz-load-femtofarads restriction for nxp,pcf85063
Message-ID: <202509050718321ac264d6@mail.local>
References: <20250903191128.439164-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903191128.439164-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On 03/09/2025 15:11:27-0400, Frank Li wrote:
> Original TXT binding doc have not limitition about quartz-load-femtofarads,
> which only allow 7000 for nxp,pcf85063.

The only valid values are 7000 and 12500, wouldn't it be better to
improve the limitation rather than removing it?

> 
> So remove it to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
>         from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf85063.yaml          | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> index 1e6277e524c27..f7013cd8fc20b 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> @@ -62,16 +62,6 @@ allOf:
>      then:
>        properties:
>          quartz-load-femtofarads: false
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - nxp,pcf85063
> -    then:
> -      properties:
> -        quartz-load-femtofarads:
> -          const: 7000
>    - if:
>        properties:
>          compatible:
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

