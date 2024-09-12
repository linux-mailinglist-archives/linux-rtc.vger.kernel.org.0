Return-Path: <linux-rtc+bounces-1966-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1194976B70
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 16:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AC15B225FB
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263131AED46;
	Thu, 12 Sep 2024 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RaPIlKBk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28D19F43E;
	Thu, 12 Sep 2024 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726149809; cv=none; b=eISOQ+eBpyld9tKxxDiioXR3VmPiPtgjaDdS3mHyloeqQCyQd47CTIwK0ULSbnW4OIq75d2lPSuJYX+Jqh9o/jn/I26XjF4bIjfqGOmCW9eMy/ki0FgkV3wIenAmJN9b1tRTjZdIQEmV5FjRJe/+OnEOpcxhb48Q/RGfoUeu0hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726149809; c=relaxed/simple;
	bh=YsY3mlB5F9ACVWqyi0PIngb1gCNaAlYaNrMVm7KGDjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDXTdYOW005D+lkyyrBMK6L+zn0500Bo1sx0s1I6MmbzwY7ZfhSophEU33Y3laEUfDOH5qvAOo/37OJPgP1qvX4jJ3Pg6sn6tDuUNTmj+5CIzSQcirT3jrLhjWBd6HLeMRC67I0XF71zyXHH3GF2s0jsIKS2/aYq8ULPbJ9AGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RaPIlKBk; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 026CAC0007;
	Thu, 12 Sep 2024 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726149804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ykz7dg7d9papWK5sWxqUS11GHL3uHkl8jv+q45X3i+g=;
	b=RaPIlKBkruFZtQBQ23m7JtXncLN14xNgh5WQrT4LU4xI56NZqC9KSJzCNKGhf91O3BmCOX
	ylJMJf7Gx58ewLZTWyKqpasy1oqtALd2XsRJ9Yl6Cg5xBWq+sAtNckvmLDL2oNfmtSd7yV
	p44vwf+kFXwU+S8XK9aFnXIlil6v8EllFq0XKozHGum33s8X7PiabBTueKhE4K3J4H7Cju
	QL5QrfUAnQQ6oy72/ZxTSyLLPst3qFAFthf+okWKQNvh8R4CDF5lS3GCSKQlbJ+eWsbwDg
	OFUVnh//BLJHJR0YBm01BIGEXH7bHSDVCFNy6SaBXbYzgGeeOSXpImGXiG5fgw==
Date: Thu, 12 Sep 2024 16:03:23 +0200
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
Message-ID: <202409121403232ab1295b@mail.local>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
 <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
 <2024091212260302903af7@mail.local>
 <2815dcf8-bb90-4e3f-837d-2c2a36a8744e@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2815dcf8-bb90-4e3f-837d-2c2a36a8744e@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/09/2024 15:36:46+0300, Ciprian Marian Costea wrote:
> > Then should this mux be registered in the CCF so you can use the usual
> > clock node properties?
> 
> Hello Alexandre,
> 
> In hardware, these clock muxes and divisors are part of the RTC module
> itself and not external. Therefore, I would say no.

This is irrelevant, if this is a clock mux, it must be in the CCF, just
as when the RTC has a clock output.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

