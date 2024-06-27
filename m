Return-Path: <linux-rtc+bounces-1417-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD591B259
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EE15284D5C
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0701A2C05;
	Thu, 27 Jun 2024 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h0BcoNEn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899231A2573;
	Thu, 27 Jun 2024 22:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719528205; cv=none; b=O2cS3pUXV8+dMM54/ZDkUUD5ByfwzcMM6fdzBkIxD4PIo3Vhwc8RX3id60NWjsFplfeGGrreEiwVpvXG6Jo7YyQ8jnLG7OzfKMUyzIF+637PZEM+cHWofjT/005YzmttF3JTwqdXTIg0w4Ho5aS2z9uVNNChbj3UCQ/5wPzzd1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719528205; c=relaxed/simple;
	bh=dSJoKrKoj9w0AJNQKBShni8tquEeO1Iztv2NUPIFACc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixhVBxbuTQfE5MNfCjm4yaikAHWkwai4dVxNHSJjRineYKPUUQUH7c6xfuC0b9pXnNHDOMRGz5TUWFl83IFDR5StlabPl3/L3Gxo0TzhD0NbE2/hX7ZJKfHMdl1FV48L5ioE7Vq3eS9RX7EbQX4Pwr032eisB23LfJe2TrktSh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h0BcoNEn; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7CC6E0002;
	Thu, 27 Jun 2024 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719528202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dLEu0TIlpm/jNlDq8RrtIfscO374jrNyb9NXvdvHY4A=;
	b=h0BcoNEn7E8GXUTHSPQW+fKSsWO+4XTUpakYbbwg+81+j34QbKePN+Ur/MMIsfNdNuNTlq
	Fsf2oCFlg/cN91C7Va/AFNbW3OG20u8Cko5bD6aq9iozSLAYub3dzu+xLe47+s5yrif0ir
	rQhDWwfxkJyuz/RxOuTerfxf2HwP/ZC+GQIDqv63is+p8z3HHbgy5Pck2cA1/HH9qXYQXo
	yL2DEDaVFWuwW07T/kti7WLXsv5qmFwHbNPX2/A/8aDbSLNSGEf4PqEeLy4A4BArlrz/W5
	hACWG7fiexEYGpqBP8IF8qo3qnFi5XEAo0X1vN/ubd3PVh7wDXdqTcG3jg2DBA==
Date: Fri, 28 Jun 2024 00:43:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Leonard Anderweit <L.Anderweit@phytec.de>
Cc: "arnd@arndb.de" <arnd@arndb.de>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@phytec.de" <upstream@phytec.de>
Subject: Re: Question about [PATCH] [RFC] rtc: y2038: remove broken
 RTC_HCTOSYS workaround
Message-ID: <20240627224321db4557b2@mail.local>
References: <cf6ac9542f58a33b146ad7b0f5577e1dff3becab.camel@phytec.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf6ac9542f58a33b146ad7b0f5577e1dff3becab.camel@phytec.de>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 24/06/2024 11:41:41+0000, Leonard Anderweit wrote:
> Hi,
> 
> I found this patch [1] which is necessary for a project I'm currently
> working on. I'm using phyboard-wega [2] with an am335 ARM SoC which I
> want to make y2038 proof.
> Is there any reason it was never accepted?
> 

The systemd maintainer think the kernel is well placed to take a
decision it can't actually take so they won't fix a bug where systemd is
crashing when userspace is 32bit.

The whole situation is frustrating and honestly, nobody should use the
hctosys insanity anyway. Obviously systemd mandates its usage and this
is yet another topic on which they think the kernel is better placed to
take decisions that are actually userspace policy.

I've been arguing for a while and gave up.

> [1]https://lore.kernel.org/all/20220908115337.1604277-1-arnd@kernel.org/
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dts
> 
> Regards
> Leonard

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

