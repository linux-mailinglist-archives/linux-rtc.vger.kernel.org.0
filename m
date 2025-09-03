Return-Path: <linux-rtc+bounces-4818-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4432CB429D1
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 21:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15AC41883D0C
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 19:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D237A35CED8;
	Wed,  3 Sep 2025 19:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UVhtq/7C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E092D9789;
	Wed,  3 Sep 2025 19:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927487; cv=none; b=gtUvLbZ0HwjPzj0NolwL1tvNXYxAJ7OGAdGkUN7bdzNcJ1JdpvWz8rUP8VH+JlgD4RMN3or6EaCX029h6y4V6l3PWwbV45rYckJyS9cDv0K2Kh9OFXrRKCS7GA8Rk/PCbOLljd9MLqfXgQZqoOSNF2a9Ah49L6NnrLvK2yhdFcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927487; c=relaxed/simple;
	bh=aj6l4uBc11YzSUw1ssIkh2HS2puMZvUKoYHbWxcVsBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+GVVigWzxYkrAsKWuQRIz/jCLGStzi2SjneY8YZW7Jb2r36nVRTmjKU3YjkVyfGwZZNK7JMxhz2Bytrciak/fE2de9STUAHfAIFip7TfeX2ULOxzOUVpNOKr1+kXX+grtPalN4SaUVZWuNB7cMcz0zJ6n5HaLnAjZgpTgMk4Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UVhtq/7C; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F3F604E40BDB;
	Wed,  3 Sep 2025 19:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ACA49606C3;
	Wed,  3 Sep 2025 19:24:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7089A1C228983;
	Wed,  3 Sep 2025 21:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756927480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=CSX67n2NDl4x2gypHsejx6bRhDLoEx00lnRe9Ruo/QA=;
	b=UVhtq/7C8Fm6tWWV/f/tmd+4uZX8q9RVUT7HWX0Ud2YKLuTolRlvPRND4pYmafLLI/LozF
	ypGykVZ3uCwzI3lgKA6yCS+YejpDcwPpPqbWgcu6y6VbVF7scfUFpib8HvktgBTeoVoeK6
	Uo+/DbjAh+TDwPtp2kQU6b9nZxPuk1K/fyW+16vNyl+USqyG7o3e6rVYZhxmFh+dqwYX+W
	DwDQjt0Zo6IDoVCW8mmJ+77QISNdlc7+0YLjXkK3pHNmme6oS1xBIAPKyjr1KZ+nmEjBL0
	pJ71x+7qZQ1FTnTzoY67zac6obqi3osT5qukjfTJp+UqtpzM18PZiQ/aaWFUzw==
Date: Wed, 3 Sep 2025 21:24:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: pcf2127: add compatible string
 nxp,rtc-pcf2123
Message-ID: <202509031924363f3ca29e@mail.local>
References: <20250903165536.431586-1-Frank.Li@nxp.com>
 <202509031658298690ab12@mail.local>
 <aLiHyoI6orsalmyJ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLiHyoI6orsalmyJ@lizhi-Precision-Tower-5810>
X-Last-TLS-Session-Version: TLSv1.3

On 03/09/2025 14:24:10-0400, Frank Li wrote:
> On Wed, Sep 03, 2025 at 06:58:29PM +0200, Alexandre Belloni wrote:
> > On 03/09/2025 12:55:36-0400, Frank Li wrote:
> > > Add compatible string nxp,rtc-pcf2123, which style is not consistent with
> > > existed compatible string because existed driver and dts use
> > > nxp,rtc-pcf2123.
> > >
> > > Fix below CHECK_DTBS warning:
> > > arch/arm/boot/dts/nxp/imx/imx6q-evi.dtb: /soc/bus@2000000/spba-bus@2000000/spi@2018000/rtc@3: failed to match any schema with compatible: ['nxp,rtc-pcf2123']
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > index 11fcf0ca1ae07..595c20df6a411 100644
> > > --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > @@ -20,6 +20,7 @@ properties:
> > >        - nxp,pcf2127
> > >        - nxp,pcf2129
> > >        - nxp,pcf2131
> > > +      - nxp,rtc-pcf2123
> >
> > Nope, you need to fix the devicetree.
> 
> Oh, driver drivers/rtc/rtc-pcf2123.c also use nxp,rtc-pcf2123. For such old
> devices, generally keep it as it.
> 
> Maybe DT team members provide more professional comments for it.

It is there for DT ABI compatibility, we don't need to advertise its
existence in the doc, you must fix the device tree.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

