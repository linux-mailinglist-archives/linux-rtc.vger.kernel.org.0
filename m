Return-Path: <linux-rtc+bounces-1220-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E623F8D22D7
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 19:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92995285255
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 17:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818A2446A1;
	Tue, 28 May 2024 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F2AXblSp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D34501E
	for <linux-rtc@vger.kernel.org>; Tue, 28 May 2024 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716919024; cv=none; b=XvJsnatL6cU4pCNk8IPDd5zJRGasGQwE1kCVauMqeb9Lq048a7x3KcRvbys6T4aCmRdmTsC27jOYvw+ohKvQSXV1gN2yDu28PpZW2fwQVtWDl0TsaJvR2A/0V49U5tHw9gcv8dMOMyoHY6mR5kMts6QBxYCZe0msp7CRgku537s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716919024; c=relaxed/simple;
	bh=5Ek0LSFzAKqsU1v0n1F5PF/K6A6cp44J/jbvqjRfKAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duq+P2FhxTW5aFh0MY5UMoVq6hmpzh2nJNSPnZKrB2uQoxcTLuvBO9imHM92bmobgudY8kq8hJ5SKKvZrn3lwQypY4P0tT5PwsxEsYkzys78qXrsU8Wn1Cul8sGmnfd0gt7DvJ3ouwR9tRiJVcr8AKI3BUdS/r+Lv16J6kgqaVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F2AXblSp; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77AC61C0004;
	Tue, 28 May 2024 17:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716919014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aT2dctHU+85n4gt7j+6zKx/fGKO2XSwzGFERNsyXMY4=;
	b=F2AXblSpgoXpGfBOCbIROwharkNDtqaXKCbm6YP2dqm+GtrtIcg8CEuPffBfD0kUd3PPvP
	8HkRhuGTvPDRzUsRK2hO/07ugsrjQWIdXOWLb1dbG2IZYSVeWC3Fq6sE0/qDHABLXjSc0u
	GobZTR28NUThniEs+yhuv47b/zw4+n4QvSriZtg2NH7Zs/dpfEEUanN2UxPpDsny3XC7S7
	TqWlQbUIO3nF91IDnveFGI2SgcCvl2odARLzkxReOfzYCk9Ma9DB0yjVuG8dxFZMH8dtVO
	j1+eM2aH1VoXUdcZ+jL8yR/LP+NWenmvCplA+LsJrXqgkK7Tl3UeQzwGXZ2L7g==
Date: Tue, 28 May 2024 19:56:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: Add UIE handling ability to rtc_class_ops
Message-ID: <202405281756543dfd3a39@mail.local>
References: <20240528161314.404383-2-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240528161314.404383-2-csokas.bence@prolan.hu>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 28/05/2024 18:13:14+0200, Csókás, Bence wrote:
> Currently, Update Interrupt Enable is performed by emulating
> it with either polling, or alarm interrupts. Some RTCs, however,
> can directly provide Update Interrupts.
> 

This has been removed from the kernel 13 years ago. What is your use
case to reintroduce it?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

