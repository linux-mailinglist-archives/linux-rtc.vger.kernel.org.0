Return-Path: <linux-rtc+bounces-175-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CA7DE24A
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Nov 2023 15:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33B501F21574
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Nov 2023 14:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4926F13ADA;
	Wed,  1 Nov 2023 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="jKmW3CGj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7E2134D3;
	Wed,  1 Nov 2023 14:21:51 +0000 (UTC)
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151EB115;
	Wed,  1 Nov 2023 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=OCON80s5+YBfYIu8CqkppkNaABmnDO3nFsvKwtvLV2k=; b=jKmW3CGjYqjvqvQkv061BlX4aq
	w88GulevTOno29x6tMLLgPdHUHau7teiI5GIzRbD8eOfa0Q+Xk/jGCqoDEOCFBV+bRDmdepuNPEqE
	Cbq6EkfCnVERbaCzav+0EJch/oug7K+X36L0HMZdzQ+SBaRWMVLeHS8F0qsEn1hUYmKk=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:43426 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1qyC6A-00062D-K3; Wed, 01 Nov 2023 10:21:39 -0400
Date: Wed, 1 Nov 2023 10:21:34 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, a.zummo@towertech.it,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bruno.thomsen@gmail.com, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20231101102134.ecce883a3ccbbf76abf8013d@hugovil.com>
In-Reply-To: <20231011182330.393f4ec10ba53c85cb09c7e8@hugovil.com>
References: <20230802191153.952667-1-hugo@hugovil.com>
	<20230802191153.952667-2-hugo@hugovil.com>
	<20230808-capsize-deodorize-5776d3dbb192@spud>
	<20230808082533.b608c9a2a4bd922920643c4b@hugovil.com>
	<202308081232266ec8a9b7@mail.local>
	<20230808084426.fc7e432a9d85e5caf72d3ffe@hugovil.com>
	<20230905113058.0fed933265fb68cd53b6d0fa@hugovil.com>
	<20230919113423.6c8c48cb1b89275f5b4f3cc2@hugovil.com>
	<20231011182330.393f4ec10ba53c85cb09c7e8@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add properties to set
 battery-related functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Wed, 11 Oct 2023 18:23:30 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> On Tue, 19 Sep 2023 11:34:23 -0400
> Hugo Villeneuve <hugo@hugovil.com> wrote:
> 
> > On Tue, 5 Sep 2023 11:30:58 -0400
> > Hugo Villeneuve <hugo@hugovil.com> wrote:
> > 
> > > On Tue, 8 Aug 2023 08:44:26 -0400
> > > Hugo Villeneuve <hugo@hugovil.com> wrote:
> > > 
> > > > On Tue, 8 Aug 2023 14:32:26 +0200
> > > > Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> > > > 
> > > > > On 08/08/2023 08:25:33-0400, Hugo Villeneuve wrote:
> > > > > > On Tue, 8 Aug 2023 12:21:24 +0100
> > > > > > Conor Dooley <conor@kernel.org> wrote:
> > > > > > 
> > > > > > > Hey Hugo,
> > > > > > > 
> > > > > > > On Wed, Aug 02, 2023 at 03:11:52PM -0400, Hugo Villeneuve wrote:
> > > > > > > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > > > > > 
> > > > > > > > These properties can be defined in the board's device tree to set the
> > > > > > > > default power-on values for battery-related functions.
> > > > > > > > 
> > > > > > > > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > > > > > ---
> > > > > > > >  .../devicetree/bindings/rtc/rtc.yaml          | 19 +++++++++++++++++++
> > > > > > > >  1 file changed, 19 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> > > > > > > > index efb66df82782..0217d229e3fa 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> > > > > > > > +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> > > > > > > > @@ -26,6 +26,25 @@ properties:
> > > > > > > >        0: not chargeable
> > > > > > > >        1: chargeable
> > > > > > > >  
> > > > > > > > +  battery-low-detect:
> > > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > > +    enum: [0, 1]
> > > > > > > > +    description: |
> > > > > > > > +      For RTC devices supporting a backup battery/supercap, this flag can be
> > > > > > > > +      used to configure the battery low detection reporting function:
> > > > > > > > +      0: disabled
> > > > > > > > +      1: enabled
> > > > > > > > +
> > > > > > > > +  battery-switch-over:
> > > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > > +    enum: [0, 1]
> > > > > > > > +    description: |
> > > > > > > > +      For RTC devices supporting a backup battery/supercap, this flag can be
> > > > > > > > +      used to configure the battery switch over when the main voltage source is
> > > > > > > > +      turned off:
> > > > > > > > +      0: disabled
> > > > > > > > +      1: enabled
> > > > > > > 
> > > > > > > Why are these implemented as enums? This seems to fall into the category
> > > > > > > of using DT to determine software policy - why's it not sufficient to
> > > > > > > have boolean properties that indicate hardware support and let the software
> > > > > > > decide what to do with them?
> > > > > > 
> > > > > > Hi Conor,
> > > > > > the reason is that I based the new properties on the existing property
> > > > > > "aux-voltage-chargeable":
> > > > > > 
> > > > > > -------------------
> > > > > >  aux-voltage-chargeable:
> > > > > >     $ref: /schemas/types.yaml#/definitions/uint32
> > > > > >     enum: [0, 1]
> > > > > >     description: |
> > > > > >       Tells whether the battery/supercap of the RTC (if any) is
> > > > > >       chargeable or not:
> > > > > >       0: not chargeable
> > > > > >       1: chargeable
> > > > > > -------------------
> > > > > > 
> > > > > > I agree with you that a boolean would be more appropriate. Should I
> > > > > > also submit a (separate) patch to fix the "aux-voltage-chargeable"
> > > > > > property to a boolean?
> > > > > > 
> > > > > 
> > > > > No, this is an enum on purpose.
> > > > > I will not take battery switch over related properties, this is not
> > > > > hardware description but software configuration. There is an ioctl for
> > > > > this.
> > > > 
> > > > Hi Alexandre,
> > > > can you suggest then how we can set default PWRMNG values for the
> > > > PCF2131 then?
> > > > 
> > > > I looked at Documentation/ABI/testing/rtc-cdev but couldn't find an
> > > > ioctl to activate the battery switch over function, nor one to activate
> > > > the battery-low detection...
> > > 
> > > Ping...
> > 
> > Second ping...
> > 
> > Hugo.
> 
> Third ping...

Hi Alexandre,
Fourth ping...

People are writing to me off the mailing
list to indicate that there is a "bug" with the PCF2131 driver relating
to PWRMNG incorrect values.

Can you answer my question so that we can find a solution to this
problem?

Hugo.


> > > > > > > > +
> > > > > > > >    quartz-load-femtofarads:
> > > > > > > >      description:
> > > > > > > >        The capacitive load of the quartz(x-tal), expressed in femto
> > > > > > > > -- 
> > > > > > > > 2.30.2
> > > > > > > > 
> > > > > 
> > > > > -- 
> > > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > > Embedded Linux and Kernel engineering
> > > > > https://bootlin.com
> > > 

