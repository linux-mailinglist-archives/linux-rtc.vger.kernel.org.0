Return-Path: <linux-rtc+bounces-2573-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A35B59D0FAB
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 12:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77E0CB2571E
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Nov 2024 11:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC11194C8D;
	Mon, 18 Nov 2024 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GiH2xuyY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D60196C67;
	Mon, 18 Nov 2024 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928335; cv=none; b=l/qTfhvt4yZtf/dsvUflwW5KbRtmpg1q+SOf114pylHXX6t2irxmOLj+IIrUq1dsVPraTKsEYpToDamTEN+mvR03+pWzibeU9yzKaws/bW50Ldjmku9iWnxcCCgTxtrafmFtOO14ZfNAf+UcYiqQhHkv1EMojsOr3c0mgr2MulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928335; c=relaxed/simple;
	bh=nZWt5D/nYLH9D3AVFY+WYyG47RIfin4SWeo/dHY5Jd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHTrXnoZLoekEakz62q75p86UdLgrB1FKd6nTCO56VGo9Dv0RmUas3CW1vZFiHX92BVqpgb3ms1xW9+ByEmhSTOvIJRJcFpO4PelptJsO2AuzCUmswiUpE80pQ8HQ5B9s1wUTLR/ywC/hNOkoDVlzndXfRnH12Jbr5eeTHSOd3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GiH2xuyY; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63FA3FF807;
	Mon, 18 Nov 2024 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731928331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s2J/oLGaxpU+f1e4cOMmvrSsZLgYaeU8Grzz4u1OMcs=;
	b=GiH2xuyYOMgtpy21Cc68edmUefBxzE0kGgZWoCTeE/eIaNA5ZMiYnCbf3HqFavJ1UORR1a
	cjOUWvzYG8QHDqSDOGl+O7lxjP9hg3gLAnQzV8kbX60ULRjyNvsdulHhm5+RGGu7F8Boce
	wgmDm6EsOCKwCgzb0KI5Ek3s3OXMBRaA5frJbJh35aTRbHOJDy0iAACfZkLIGXIPr/SAAQ
	9nrpywhk7IVzYr2EmGHdZZfxzarnYwtgQpuCRIG7RzgeNryAhrZWwgO67i6UHViHPugqUJ
	wrF1s/VeJ+P/IZIeYovY8TTrJiYTDjuVHr0gleoD2gkk4DWt963ydywUZpuS6g==
Date: Mon, 18 Nov 2024 12:12:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Michel Pollet <buserror@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rzn1: update Michel's email
Message-ID: <173192830951.23080.18159980251324825341.b4-ty@bootlin.com>
References: <20241114193450.13982-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114193450.13982-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 14 Nov 2024 20:34:50 +0100, Wolfram Sang wrote:
> The Renesas address bounces, use the alternative one.
> 
> 

Applied, thanks!

[1/1] rtc: rzn1: update Michel's email
      https://git.kernel.org/abelloni/c/1f7a0c648344

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

