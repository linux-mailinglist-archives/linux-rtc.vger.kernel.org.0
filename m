Return-Path: <linux-rtc+bounces-3777-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1763A7B957
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 10:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE0617A2D5
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141791A01BF;
	Fri,  4 Apr 2025 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="phXjCmqz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DDB19E804;
	Fri,  4 Apr 2025 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756813; cv=none; b=T55ssZYPaC5PfuWxSDQbkUQBSDZg24qY8QdwlRO+j8t0tUE/HY9oJxv4fOyvRqZN2WvjGSWTGroHVNr0lzH1v8jSzMtoiMd7zHm5guIeVna2AKlnW8g2QGM+qvwLnzESFPzp7xkxR6l/ge3a6VY19WY39fhjCVg5dGSTY5ASiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756813; c=relaxed/simple;
	bh=BR4v9jaduHHtjHDAkP3DcqrljwwGoF2ygLOcD1RaNR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKLzkeZRKoX01zWz0kxXXx5QULS0coRH2wYLFgPyKmnQz/A4heXlrf83Fwn1vInkKPeona0WTjCn1OCnM3g8EVaZtpUiXmwP0oxu5AluZ2V/SO0UksBgyXAuHXQz5WPoCgfDYdPU7GPBkrQzYBivvq8bdceBeUnxMehGrMQOvy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=phXjCmqz; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FA204340C;
	Fri,  4 Apr 2025 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743756804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SZTRJDBNNgYDkCBY6upcyYXVnBhkGlf/cu+m+M/6vIQ=;
	b=phXjCmqzZZKxxuJwruXaetuuVy5P0E2DyGB/9ihDxzLCq+CQn5d1CAbwfZaZ+Fmg9BRjus
	7Q5NWpzcI5e6Iwg39kYruOE98vGmVxUWb92md2uia83KBMDgVaDpZD9qfsncjO9bloHYL0
	5LW158MhgkQiGj/JRR4z4HNiKF/TIGimyBmXrN32dWWPehyS1tRmaxMY/ADDmnMiJ2JMXK
	+jXcXkkKQxqOLY710F/sL0n/tx69yrVl2R2/wb7aZ+nBlIIbwoOt1WeP41torkK7+dYjWX
	yZhckxdHE9b9jL60QvNPVyUM1Vvk86wzB9MlfLJgNsMswfGXXzhKQMTmz9R48g==
Date: Fri, 4 Apr 2025 10:53:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v9 3/4] arm64: defconfig: add S32G RTC module support
Message-ID: <2025040408532288b38dea@mail.local>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-4-ciprianmarian.costea@oss.nxp.com>
 <c4a80c1f-56a0-4cdf-afbd-cb2c13cc0b8b@kernel.org>
 <6ebb8c15-9ff1-4bf3-bbf3-c91aa387d873@oss.nxp.com>
 <dec769ad-5144-4503-9714-d9c83a4c242c@kernel.org>
 <b7d82f31-05d1-4331-809b-e865d21c958c@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7d82f31-05d1-4331-809b-e865d21c958c@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheptghiphhrihgrnhhmrghrihgrnhdrtghoshhtvggrsehoshhsrdhngihprdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 04/04/2025 10:19:56+0300, Ciprian Marian Costea wrote:
> On 4/4/2025 10:15 AM, Krzysztof Kozlowski wrote:
> > On 04/04/2025 08:24, Ciprian Marian Costea wrote:
> > > On 4/4/2025 9:17 AM, Krzysztof Kozlowski wrote:
> > > > On 03/04/2025 12:33, Ciprian Costea wrote:
> > > > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > > 
> > > > > The RTC hardware module present on S32G based SoCs tracks clock time
> > > > > during system suspend and it is used as a wakeup source on S32G2/S32G3
> > > > > architecture.
> > > > Which boards are using it? I don't see any DTS (nowhere), so I do not
> > > > see single reason for this patch.
> > > > 
> > > > Best regards,
> > > > Krzysztof
> > > 
> > > The RTC module is used by all the currently supported S32G2/S32G3
> > > boards, so currently they are: S32G274A-EVB, S32G274A-RDB2, S32G399A-RDB3.
> > 
> > I don't think so. I looked at these DTS and there is no RTC.
> > 
> > > I do see your point in the fact that this driver should be enabled as
> > > module only after platforms are actually using it.
> > 
> > No, post the user. I don't see the point of sending defconfig patch with
> > RTC patchset anyway. That's different subsystem.
> > 
> > > 
> > > So, would it be better for me to send a V10 in this series with the DTS
> > > patch added ?
> > 
> > No, separate patchsets.
> 
> Ok. I will send out a V10 in which I will drop this current patch from the
> patchset. Also, I will send the DTS patch which adds S32G274A-EVB,
> S32G274-RDB2 and S32G399A-RDB3 usage of the RTC after this patchset gets
> accepted.
> 

I don't need V10, I can apply V9 without 3/4 and 4/4

> Best Regards,
> Ciprian
> 
> > 
> > Best regards,
> > Krzysztof
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

