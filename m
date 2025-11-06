Return-Path: <linux-rtc+bounces-5278-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F01C3A52B
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 11:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 530BA1A43E34
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 10:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D002E6100;
	Thu,  6 Nov 2025 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NiHV8lXi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6225F2E1EE5;
	Thu,  6 Nov 2025 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762425670; cv=none; b=Z9/0b7dxn4AmNJclLwTUEBzSDsToBvYA0V5U/k1Cisj66brgukrNI72srJdARG3ISVHzBInpVPyQWXKd6NliT9pi2R1BQ0HWCtH1JqNLI0PS3PdGc9VQGAbSbU+3NSVuKEUo+IJRlV68+BnXuBXlQ/BZuSug8l03ZZUfE1KY/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762425670; c=relaxed/simple;
	bh=wlTKicE4vKhM9gisZDttSjvvCGuHx5DPhO7+hmvYxjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV3RqcP+uTtFHenROse3ollvsVz/v+CsrkigCAjVosPn02YF/5zaSpEelYtTfBgINxCCQh6rIpiK3JANfvopxLTmZfAsEIB4JXCuB5TBgeG/74JE1AhCnh7z2ckF/7tK3zTzuUYCvJpySW6HTSotNQGX9bdPjGEWFDlM6nSf9o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NiHV8lXi; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 816B8C0FA83;
	Thu,  6 Nov 2025 10:40:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 846B96068C;
	Thu,  6 Nov 2025 10:41:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9313411850DB0;
	Thu,  6 Nov 2025 11:41:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762425665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=SaqnAYTHX2kejKwlwzUJIjgXWYbAMy9QqRlDeeqtVyQ=;
	b=NiHV8lXistQAmVxLkr5lIcVHDmO3CV6+qfDyqqLLrxX3V7V8kWU0xeITUVlajGcaXaW/o0
	dKyh5YOvXvYn8k34NOKH3BkI1+5kVaSersgnu3jnpMUAUZDj6iX8Zepr8lsmEq/9MhxzLj
	ekExIRwa44ZTNDP0bXUH/mDadvwuEPKnFpKqOjkJX6pRN4RFbA023QRd1BcICT6x1Fv28/
	Buk2d5mKhIUBXbmAeTDJ8EeiJmggujqPG9ru7BpBdMGcazGjZVTdjWEwLEmm86LtPEnO98
	BCZs/B9xnfTISoiPjeZzz3MS2S04vwlBFMS6WcOF9pyi6lcIH8XyzCo/sHL93A==
Date: Thu, 6 Nov 2025 11:41:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: geert <geert@linux-m68k.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Message-ID: <2025110610410184fb6c28@mail.local>
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
 <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
 <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
 <TY7PR01MB14910AA199960CAB587D3E9F1D3C2A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY7PR01MB14910AA199960CAB587D3E9F1D3C2A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3

On 06/11/2025 09:13:53+0000, Ovidiu Panait wrote:
> Hi Geert,
> 
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Thursday, November 6, 2025 10:47 AM
> > To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>;
> > alexandre.belloni@bootlin.com; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; magnus.damm <magnus.damm@gmail.com>;
> > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; linux-
> > rtc@vger.kernel.org; linux-renesas-soc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > clk@vger.kernel.org
> > Subject: Re: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
> > support
> > 
> > Hi Ovidiu,
> > 
> > Sorry, I still had outstanding review comments I hadn't sent yet, as
> > I hadn't finished my review yet.
> > 
> > On Tue, 21 Oct 2025 at 10:07, Ovidiu Panait
> > <ovidiu.panait.rb@renesas.com> wrote:
> > > The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> > > (r9a08g045), with the following differences:
> > > - It lacks the time capture functionality
> > > - The maximum supported periodic interrupt frequency is 128Hz instead
> > >   of 256Hz
> > > - It requires two reset lines instead of one
> > >
> > > Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and
> > update
> > > the binding accordingly:
> > > - Allow "resets" to contain one or two entries depending on the SoC.
> > > - Add "reset-names" property, but make it required only for RZ/V2H.
> > >
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > ---
> > > v2 changes:
> > > - Added "reset-names" property and made it required for RZ/V2H.
> > 
> > Thanks for the update!
> > 
> > > --- a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
> > 
> > > @@ -61,6 +63,39 @@ required:
> > >    - power-domains
> > >    - resets
> > >
> > > +allOf:
> > > +  - $ref: rtc.yaml#
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,r9a08g045-rtca3
> > > +    then:
> > > +      properties:
> > > +        resets:
> > > +          items:
> > > +            - description: VBATTB module reset
> > > +        reset-names:
> > > +          const: vbattb
> > 
> > Please add this property to the example at the bottom, too.
> > 
> 
> Thanks for your review!
> 
> Please see the latest v3 series:
> https://lore.kernel.org/all/20251103121848.6539-1-ovidiu.panait.rb@renesas.com/
> 
> The first two patches were applied by Alexandre in the meantime.
> 
> Alexandre, would it be possible to drop the patches from your queue and I
> will send v4 to address the latest feedback from Geert and Conor? 
> 

Sure, I'll drop them later today.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

