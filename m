Return-Path: <linux-rtc+bounces-2008-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F9C97B07D
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 15:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31F4B1F24264
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 13:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605E1176ABA;
	Tue, 17 Sep 2024 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L65FQO4i"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718C174EFA;
	Tue, 17 Sep 2024 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726578086; cv=none; b=MfEB5H4xC8k27GmwDywfatwPRwgtpbNKvqI2LkVaqU7BiEKY4/KCKoO8Bo7fU9EbJ5HKpA+FbawcSRKDNtVAHRRNWLdtJuGrT2ewgn1YaLtz9x7mKqr0zICil97PO6GFzr/Z8hq5WZCUzPwAFpF/RHjUrqY8FJuOaNfBMyDQ/Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726578086; c=relaxed/simple;
	bh=90Dg2b97RJ0B1Ja+kw/9SxgeGa9WjZTfsvdLrngyNPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdppMhRR4Xzez8+NSOCxrhShAWnIH06ozVn5p9au9yOpNuinX2msU6A4gW4iVz3qGhZIMIYxjmAngPK9HnmY/3bgIKKVRyzayP94yNWsaMkNm9yAsUFW4DI7QpWgeBrlh/wImHMQ/16qhyRIescRT7evW4g9Nf6A7Vn4AqokKeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L65FQO4i; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86FD21BF20C;
	Tue, 17 Sep 2024 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726578075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQlfje8RzrGkZL2VqWknD0uNiWO5cAU70iaVLEwLNAU=;
	b=L65FQO4iMpdZMyY+qPrsMRQ50jSWU2ygXHMRw3RA7fsdQOm81tYUl+GSn+x5dLKr0UPIxb
	sOlegEAWN5N4XlefLr7ICeppeFTkaYBBbLwzMyH3PTZoFhVnBsI69RbZGae0RAb0dIV02X
	8L5ZD5DFLtZpJ2Jy0CzrS3HdPc9sKIAAu44cTrHPDLBE5zHVHQOQa9G6OFGqu9lB4fEL7Q
	m6nxqZQF4MwdkskvdHSveY6oP1y/0QQgsCfW9n2oDcsB1vnc9Tdup5uW86MxXTYZ9gQc/2
	6QPfZWisAPbjh0HhV7zmF7Pk0QU6EgtjniT4QOqf0NqYpgq8wOmoUN4HePb4Ag==
Date: Tue, 17 Sep 2024 15:01:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Message-ID: <20240917130113daecdd5b@mail.local>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
 <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
 <2024091212260302903af7@mail.local>
 <2815dcf8-bb90-4e3f-837d-2c2a36a8744e@oss.nxp.com>
 <202409121403232ab1295b@mail.local>
 <c51a8065-2052-4a4e-b871-c0bd8d834548@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c51a8065-2052-4a4e-b871-c0bd8d834548@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 17/09/2024 10:21:32+0300, Ciprian Marian Costea wrote:
> On 9/12/2024 5:03 PM, Alexandre Belloni wrote:
> > On 12/09/2024 15:36:46+0300, Ciprian Marian Costea wrote:
> > > > Then should this mux be registered in the CCF so you can use the usual
> > > > clock node properties?
> > > 
> > > Hello Alexandre,
> > > 
> > > In hardware, these clock muxes and divisors are part of the RTC module
> > > itself and not external. Therefore, I would say no.
> > 
> > This is irrelevant, if this is a clock mux, it must be in the CCF, just
> > as when the RTC has a clock output.
> > 
> > 
> 
> I understand your point, but taking into account the fact that FIRC clock
> should be used in most scenarios, would it be acceptable to not export this
> 'clksel' property in the devicetree bindings and simply use the FIRC clock
> by default in the RTC driver ?
> 

No, this doesn't work for RTCs because their lifecycle is longer than the
system's and f you change a configuration from the default value without
providing a way to control it, we won't have any upgrade path without
breaking users.

> At least for this patchset, in order to ease the review process. If
> configurable clock source support would want to be enabled and exported via
> bindings for this S32G2/S32G3 RTC driver, then CCF registration for this clk
> mux could be added in future patches.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

