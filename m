Return-Path: <linux-rtc+bounces-2518-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D979C48B2
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 23:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2AED1F2175B
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 22:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E13C1B654A;
	Mon, 11 Nov 2024 22:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S+NkZEaj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87E413A250;
	Mon, 11 Nov 2024 22:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731362510; cv=none; b=ti/h4MNC534EaTR9VUcuL1s6iqK4xh3EX1OOLWhxOIFFUQ+j/kUk/uOo5wFLi5Z3iQ2G4V/TNW/wnU07/qbjGWFDNFdaoX0789fJ4asvjYyA6sDTKkZK4s3IHsaOJTPrGjGpqAyhA6SRlrtfU2jZ72LseWXdpppMjv412wVdaJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731362510; c=relaxed/simple;
	bh=2v8pstc10O9BFXekElX+tOIQOBA5N5IYRjeBVtqH9hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acg76XwstDDbiGfKJDJBol6ODUPKOFVib7eEzaDTlPE8Jq/QqvrAFKvy4lU0iZlKSF1SOM3amgZgjpPSSkGbOu9Zq596pBckHN9f4GX0spJq8FrYZfpQOrP5i9xm3X7GKyG6vWqYh49yPdiEBrksfmeo14W6pvg0QBkTWCmj7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S+NkZEaj; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C117F60004;
	Mon, 11 Nov 2024 22:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731362500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nkufrg1CIcStL4h9DucTfQMnDSoYDhL3Jsv23vGuCsk=;
	b=S+NkZEajDuG6zBcnK3ptlSHVdU+OypPAL3PdOQoCyMCzyda2/w192sjHngV0gZOlio25tb
	sr/CW3ncCm1DwbW3+An8VLTDd0UKVGEKz3B1tcLzzJL49Jyka2I6KhmaFVNMQBCyeLrwy/
	2KqyPwZGSzJINa56cgEw1bu6aF7DCI24/GMTXWFpN3/ZBeaei8BSMRIcABFa7sYv5x9hyk
	hPWFDMbqC3HZNj8HXPdNbCdU4DPuGsLmJ/cVJfwfyusgJcScqw63IJvt63+t4DK0Vrwvhh
	I2Wt/Tix9L3JABONOqPJQHSmMDwpwjFGfJlRzJh+KGZYWdKCCVoE+/QwleXa3g==
Date: Mon, 11 Nov 2024 23:01:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 0/3] support for amlogic rtc
Message-ID: <202411112201331e47986c@mail.local>
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
 <173136163495.3310623.12434068921554307587.b4-ty@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173136163495.3310623.12434068921554307587.b4-ty@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/11/2024 22:47:51+0100, Alexandre Belloni wrote:
> On Fri, 08 Nov 2024 13:54:40 +0800, Xianwei Zhao wrote:
> > Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.
> > 
> > 
> 
> Applied, thanks!

Actually, I dropped them, I'll comment on 2/3

> 
> [1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
>       https://git.kernel.org/abelloni/c/12defbf1429c
> [2/3] rtc: support for the Amlogic on-chip RTC
>       https://git.kernel.org/abelloni/c/db26c3d6eb01
> [3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
>       https://git.kernel.org/abelloni/c/cf6f2ddfd039
> 
> Best regards,
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

