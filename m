Return-Path: <linux-rtc+bounces-1735-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615DC95EA6F
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 09:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2EAEB20B81
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 07:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB4F82490;
	Mon, 26 Aug 2024 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cZ5RB3D5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE21D339AB;
	Mon, 26 Aug 2024 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724657433; cv=none; b=qHYLWZhtsevKqecyT9pmNZXAcDaHR1NC3I7hcMy86GHVFdOSGjhbm1uRA60t5c8HPjzsbu/r+yu8WsdTitAZ89sbt4D7/olPtY9bv2AWrDwtEOOFdly/llfWWd3iJ+J7dPgObRuygJVLGz0LJrunKozFbS9wJflo5We73wY5jic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724657433; c=relaxed/simple;
	bh=nLJafC/RJkAiXMmcJ/serDyLuQ5oEl1N6bGyWiLxg4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DItKcWysL9P6hSxlD3qUufjc4JGMJbHGU6x3yn6VxPEogvtQ0uIjsFGvzVQOGIa+6BeB9WRvvgHXSWggXu4ymQMtpykm/7mIEzkn4v9kCxWlFATmo5/mSaFX9L3WQGcDGFbVbpJLzhVQwyKL+DCJVfNUciLOJM72yxln0/i2dns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cZ5RB3D5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAFBC8CDC1;
	Mon, 26 Aug 2024 07:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724657433;
	bh=nLJafC/RJkAiXMmcJ/serDyLuQ5oEl1N6bGyWiLxg4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZ5RB3D5dAncRGaWeUEbGsIQ5WH4jGnpnWnV8DZ1XAd8FUaqpQlEmRmyGHxUjy2or
	 EGubQ6IAp9znH/XaycXZFddQsIdY/cmGyWfuFUii1EcDC0bKiyJW1aNnc4ovJW3hiI
	 I3/HDEPU3+UB+5O+WlgGGrjzS1pzGsM/wTGK6u5k=
Date: Mon, 26 Aug 2024 09:30:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Johan Hovold <johan@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: rtc: at91sam9: fix OF node leak in probe() error path
Message-ID: <2024082622-freckles-armored-978c@gregkh>
References: <20240825183103.102904-1-krzysztof.kozlowski@linaro.org>
 <675f1e34-784f-44d2-9774-2652b919eecd@web.de>
 <391cc2f7-4a88-4565-8653-e46bd77e28f8@linaro.org>
 <bbc43cc6-0ee9-4cfd-b642-ac888ad9e627@web.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbc43cc6-0ee9-4cfd-b642-ac888ad9e627@web.de>

On Mon, Aug 26, 2024 at 09:12:32AM +0200, Markus Elfring wrote:
> >>> Driver is leaking an OF node reference obtained from
> >>> of_parse_phandle_with_fixed_args().
> >>
> >> Is there a need to improve such a change description another bit?
> >>
> >> + Imperative mood
> …
> > Commit msg is fine.
> …
> >> + Tags like “Fixes” and “Cc”
> >
> > Read the patch.
> 
> What does hinder you to take requirements from a known information source
> better into account?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.11-rc5#n94
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

