Return-Path: <linux-rtc+bounces-4831-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C52CCB4371A
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 11:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CF275A18D5
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 09:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7654C2F6168;
	Thu,  4 Sep 2025 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYaolKcm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5941EEE6;
	Thu,  4 Sep 2025 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756978168; cv=none; b=a/dP4lo2+gb/+/xPfChdYnXgr2xVOxEvfa4b9bJZlAIl9tMcEZpfdUfeCb0IOYu1gzI+E23teF43gV+U5BiYHn2pMDY4ibrwGdJ2REwLg45Uk+QvCDytAmyFRwuQbJ53oNDMS2Iv4U+utZ8sXA1WLsnsdHjoRejwUG0fMo446pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756978168; c=relaxed/simple;
	bh=tLhzmUoB6F0bCZVOg6V1Z/71TJ8zwtXmXvbdCQbSAWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQnc6Wy+ed1wGvVDfXoAtkzW1qAc1xGJ9KsV4G7VrCwjsirTa6EqAzrPg8pobbtF+pYO+yYzVy8djSQbkaMn2yaRE5AX/+frg02/CFiEHdkhkLIgNUScZqTlRwObemIQUdAsCqqprnMLAwynQmXCsGtMdvSihvL6UmNcF0UNDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYaolKcm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCDBC4CEF0;
	Thu,  4 Sep 2025 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756978168;
	bh=tLhzmUoB6F0bCZVOg6V1Z/71TJ8zwtXmXvbdCQbSAWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYaolKcm/+oQsHD+/h6GUtEn7176vTOWYyBMqmbAJMpbcbqR6PsVsp4ke3kKLrJbz
	 adImpnCN0iquCCmunC1Bnad6/isCNihpmuPJrihaStEOSPtioa2iBKvhHTXuh6ZbNl
	 nm3rRsql0/CMF5oRQih8zwqMReY8HsKZvuf99f5g2/rA4N9aL1d6Do77GjmsMp5Rp9
	 Z032fgk9vDxFDiF4EYbz2dsGzjIVazhnCt1Nha3KtlSISytU0ofsofwfTFvNnbmCap
	 sRXigqFOwL5oUd7eSWHvRJ+MPYh+18wRW+gjy6hWT1fvj373uNtfA9mJ/2WZ3iCggE
	 HL98BEG1QpXTQ==
Date: Thu, 4 Sep 2025 11:29:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: pcf2127: add compatible string
 nxp,rtc-pcf2123
Message-ID: <20250904-mustard-lion-of-downpour-f07cea@kuoka>
References: <20250903165536.431586-1-Frank.Li@nxp.com>
 <202509031658298690ab12@mail.local>
 <aLiHyoI6orsalmyJ@lizhi-Precision-Tower-5810>
 <202509031924363f3ca29e@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202509031924363f3ca29e@mail.local>

On Wed, Sep 03, 2025 at 09:24:36PM +0200, Alexandre Belloni wrote:
> On 03/09/2025 14:24:10-0400, Frank Li wrote:
> > On Wed, Sep 03, 2025 at 06:58:29PM +0200, Alexandre Belloni wrote:
> > > On 03/09/2025 12:55:36-0400, Frank Li wrote:
> > > > Add compatible string nxp,rtc-pcf2123, which style is not consistent with
> > > > existed compatible string because existed driver and dts use
> > > > nxp,rtc-pcf2123.
> > > >
> > > > Fix below CHECK_DTBS warning:
> > > > arch/arm/boot/dts/nxp/imx/imx6q-evi.dtb: /soc/bus@2000000/spba-bus@2000000/spi@2018000/rtc@3: failed to match any schema with compatible: ['nxp,rtc-pcf2123']
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > > index 11fcf0ca1ae07..595c20df6a411 100644
> > > > --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > > @@ -20,6 +20,7 @@ properties:
> > > >        - nxp,pcf2127
> > > >        - nxp,pcf2129
> > > >        - nxp,pcf2131
> > > > +      - nxp,rtc-pcf2123
> > >
> > > Nope, you need to fix the devicetree.

Yep, 6 years is enough for all users to adjust, so I agree.

> > 
> > Oh, driver drivers/rtc/rtc-pcf2123.c also use nxp,rtc-pcf2123. For such old
> > devices, generally keep it as it.
> > 
> > Maybe DT team members provide more professional comments for it.
> 
> It is there for DT ABI compatibility, we don't need to advertise its
> existence in the doc, you must fix the device tree.

In-tree compatibles should be documented anyway (as "deprecated: true").

Best regards,
Krzysztof


